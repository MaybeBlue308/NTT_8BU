module Controller_NTT #(
    parameter DATA_WIDTH = 12,
    parameter ADDR_WIDTH = 5,
    parameter INPUT_WIDTH = 192,
    parameter BU_LATE = 7,
    parameter MAX_CAL = 8,
    parameter WRITE_BACK_LATE = 2
)(
    input logic clk_i,
    input logic rst_i,
    input logic start,
    input logic done_gen_addr,
    input logic is_NTT,
    input logic valid_input,
    input logic [INPUT_WIDTH-1:0] din,

    output logic [DATA_WIDTH-1:0] din_load_a, din_load_b,
    output logic [ADDR_WIDTH-1:0] addr_load_a, addr_load_b,

    output logic start_decode,
    output logic start_BU_choose,
    output logic start_BRAM_chain,
    output logic start_BRAM_load,
    output logic start_BRAM_write,

    output logic is_NTT_decode,
    output logic is_NTT_BU_choose,
    output logic is_NTT_output,
    output logic is_NTT_load,
    output logic is_NTT_read,

    output logic [7:0] we,
    output logic done_all
);
    localparam IDLE = 3'b000;
    localparam LOAD = 3'b001;
    localparam DECO = 3'b010;
    localparam READ = 3'b011;
    localparam CALC = 3'b100;
    localparam WRIB = 3'b101;
    localparam DONE = 3'b110;

    logic [2:0]     state;
    logic [4:0]     count_load;
    logic [3:0]     bram_load_index;
    logic [1:0]     count_time;
    logic           is_NTT_load, valid_input_load;
    logic [3:0]     count_calc;
    //logic [191:0]   din_reg;
    logic [1:0]     count_write;
    logic [3:0]     count_all;

    // always @(posedge clk_i) begin
    //     din_reg <= din;
    // end

    logic [11:0] coeff_buff [0:15];
    genvar k;
    generate
        for (k = 0; k < 16; k = k + 1) begin: GEN_COEF
            assign coeff_buff [k] = din[191 - k*12 -:12];
        end
    endgenerate

    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            state               <= IDLE;
            we                  <= '0;
            start_decode        <= 1'b0;
            start_BU_choose     <= 1'b0;
            start_BRAM_chain    <= 1'b0;
            start_BRAM_load     <= 1'b0;
            start_BRAM_write    <= 1'b0;
            is_NTT_decode       <= 1'b0;
            is_NTT_BU_choose    <= 1'b0;
            is_NTT_output       <= 1'b0;
            is_NTT_read         <= 1'b0;
            done_all            <= 1'b0;
            count_all           <= '0;
            count_write         <= '0;
            count_calc          <= '0;
            bram_load_index     <= '0;
            count_time          <= '0;
            count_load          <= '0;
        end else begin
            case (state)
                IDLE : begin
                    we                  <= '0;
                    start_decode        <= 1'b0;
                    start_BU_choose     <= 1'b0;
                    start_BRAM_chain    <= 1'b0;
                    start_BRAM_load     <= 1'b0;
                    start_BRAM_write    <= 1'b0;

                    is_NTT_decode       <= 1'b0;
                    is_NTT_BU_choose    <= 1'b0;
                    is_NTT_output       <= 1'b0;
                    is_NTT_read         <= 1'b0;

                    done_all            <= 1'b0;
                    count_all           <= '0;
                    count_write         <= '0;
                    count_calc          <= '0;
                    
                    bram_load_index     <= '0;
                    count_time          <= '0;
                    count_load          <= '0;
                    
                    if (start) begin
                        state           <= LOAD;
                        is_NTT_load     <= is_NTT;
                    end
                end 
                
                LOAD : begin
                    start_BRAM_load     <= 1'b1;
                    
                    if (valid_input) begin
                        // Calculate address: base_addr = count_time * 16 + count_load
                        // For port A: addr = {count_time, count_load[3:0], 1'b0}
                        // For port B: addr = {count_time, count_load[3:0], 1'b1}
                        addr_load_a     <= {count_time, count_load, 1'b0};
                        addr_load_b     <= {count_time, count_load, 1'b1};
                        
                        // Extract 12-bit data from 192-bit input
                        // din[191:180] = first 12 bits, din[179:168] = second 12 bits, etc.
                        din_load_a      <= coeff_buff[{count_load, 1'b0}];      // Even position
                        din_load_b      <= coeff_buff[{count_load, 1'b0}]; // Odd position
                        
                        // Set write enable for current BRAM
                        case (bram_load_index)
                            4'd0:    we <= 8'b00000001;
                            4'd1:    we <= 8'b00000010;
                            4'd2:    we <= 8'b00000100;
                            4'd3:    we <= 8'b00001000;
                            4'd4:    we <= 8'b00010000;
                            4'd5:    we <= 8'b00100000;
                            4'd6:    we <= 8'b01000000;
                            4'd7:    we <= 8'b10000000;
                            default: we <= '0;
                        endcase
                        
                        // Counter increment logic
                        if (count_load == 7) begin  // 0-7 = 8 loads (16 values with A/B ports)
                            count_load <= '0;
                            if (count_time == 1) begin  // count_time: 0 or 1
                                count_time <= '0;
                                if (bram_load_index == 7) begin  // All 8 BRAMs loaded
                                    bram_load_index <= '0;
                                    state <= DECO;
                                    we <= '0;
                                    start_BRAM_load <= 1'b0;
                                end else begin
                                    bram_load_index <= bram_load_index + 1'b1;
                                end
                            end else begin
                                count_time <= count_time + 1'b1;
                            end
                        end else begin
                            count_load <= count_load + 1'b1;
                        end
                    end else begin
                        we <= '0;
                    end
                end

                DECO : begin
                    start_decode        <= 1'b1;
                    is_NTT_decode       <= is_NTT_load;
                    if (done_gen_addr) begin
                        state           <= READ;
                        start_decode    <= 1'b0;
                    end
                end

                READ : begin
                    start_BRAM_chain    <= 1'b1;
                    is_NTT_read         <= is_NTT_decode;
                    state               <= CALC;
                end

                CALC : begin
                    start_BRAM_chain    <= 1'b0;
                    start_BU_choose     <= 1'b1;
                    is_NTT_BU_choose    <= is_NTT_read;
                    is_NTT_output       <= is_NTT_read;
                    count_calc          <= count_calc + 1'b1;
                    
                    if (count_calc == BU_LATE - 1) begin
                        count_calc      <= '0;
                        state           <= WRIB;
                    end 
                end

                WRIB: begin
                    we                  <= 8'b11111111;
                    start_BRAM_write    <= 1'b1;
                    start_BU_choose     <= 1'b0;
                    count_write         <= count_write + 1'b1;

                    if (count_write == WRITE_BACK_LATE - 1) begin
                        count_write     <= '0;
                        we              <= '0;
                        start_BRAM_write <= 1'b0;
                        count_all       <= count_all + 1'b1;

                        if (count_all == MAX_CAL - 1) begin
                            state       <= DONE;
                        end else begin
                            state       <= READ;
                        end
                    end
                end

                DONE: begin
                    done_all    <= 1'b1;
                    state       <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end
endmodule