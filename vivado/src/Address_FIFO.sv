// Address FIFO for buffering read addresses during write operations
module Address_FIFO #(
    parameter ADDR_WIDTH = 5,
    parameter FIFO_DEPTH = 16,  // Sufficient for buffering during write cycles
    parameter NUM_PORTS = 16    // 16 addresses (8 BRAMs × 2 ports)
)(
    input  logic                        clk_i,
    input  logic                        rst_i,
    
    // Write interface (from GenAddress)
    input  logic                        push,           // Push new addresses
    input  logic [ADDR_WIDTH-1:0]       addr_in0,
    input  logic [ADDR_WIDTH-1:0]       addr_in1,
    input  logic [ADDR_WIDTH-1:0]       addr_in2,
    input  logic [ADDR_WIDTH-1:0]       addr_in3,
    input  logic [ADDR_WIDTH-1:0]       addr_in4,
    input  logic [ADDR_WIDTH-1:0]       addr_in5,
    input  logic [ADDR_WIDTH-1:0]       addr_in6,
    input  logic [ADDR_WIDTH-1:0]       addr_in7,
    input  logic [ADDR_WIDTH-1:0]       addr_in0B,
    input  logic [ADDR_WIDTH-1:0]       addr_in1B,
    input  logic [ADDR_WIDTH-1:0]       addr_in2B,
    input  logic [ADDR_WIDTH-1:0]       addr_in3B,
    input  logic [ADDR_WIDTH-1:0]       addr_in4B,
    input  logic [ADDR_WIDTH-1:0]       addr_in5B,
    input  logic [ADDR_WIDTH-1:0]       addr_in6B,
    input  logic [ADDR_WIDTH-1:0]       addr_in7B,
    
    // Read interface (to BRAM)
    input  logic                        pop,            // Pop addresses for read
    output logic [ADDR_WIDTH-1:0]       addr_out0,
    output logic [ADDR_WIDTH-1:0]       addr_out1,
    output logic [ADDR_WIDTH-1:0]       addr_out2,
    output logic [ADDR_WIDTH-1:0]       addr_out3,
    output logic [ADDR_WIDTH-1:0]       addr_out4,
    output logic [ADDR_WIDTH-1:0]       addr_out5,
    output logic [ADDR_WIDTH-1:0]       addr_out6,
    output logic [ADDR_WIDTH-1:0]       addr_out7,
    output logic [ADDR_WIDTH-1:0]       addr_out0B,
    output logic [ADDR_WIDTH-1:0]       addr_out1B,
    output logic [ADDR_WIDTH-1:0]       addr_out2B,
    output logic [ADDR_WIDTH-1:0]       addr_out3B,
    output logic [ADDR_WIDTH-1:0]       addr_out4B,
    output logic [ADDR_WIDTH-1:0]       addr_out5B,
    output logic [ADDR_WIDTH-1:0]       addr_out6B,
    output logic [ADDR_WIDTH-1:0]       addr_out7B,
    
    // Status signals
    output logic                        empty,
    output logic                        full,
    output logic [$clog2(FIFO_DEPTH):0] count
);

    // FIFO storage array: [depth][port_index]
    logic [ADDR_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1][0:NUM_PORTS-1];
    
    // Pointers
    logic [$clog2(FIFO_DEPTH)-1:0] wr_ptr, rd_ptr;
    logic [$clog2(FIFO_DEPTH):0]   counter;
    
    // Status flags
    assign empty = (counter == 0);
    assign full  = (counter == FIFO_DEPTH);
    assign count = counter;
    
    // Write operation
    always_ff @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            wr_ptr <= '0;
        end else if (push && !full) begin
            fifo_mem[wr_ptr][0]  <= addr_in0;
            fifo_mem[wr_ptr][1]  <= addr_in1;
            fifo_mem[wr_ptr][2]  <= addr_in2;
            fifo_mem[wr_ptr][3]  <= addr_in3;
            fifo_mem[wr_ptr][4]  <= addr_in4;
            fifo_mem[wr_ptr][5]  <= addr_in5;
            fifo_mem[wr_ptr][6]  <= addr_in6;
            fifo_mem[wr_ptr][7]  <= addr_in7;
            fifo_mem[wr_ptr][8]  <= addr_in0B;
            fifo_mem[wr_ptr][9]  <= addr_in1B;
            fifo_mem[wr_ptr][10] <= addr_in2B;
            fifo_mem[wr_ptr][11] <= addr_in3B;
            fifo_mem[wr_ptr][12] <= addr_in4B;
            fifo_mem[wr_ptr][13] <= addr_in5B;
            fifo_mem[wr_ptr][14] <= addr_in6B;
            fifo_mem[wr_ptr][15] <= addr_in7B;
            
            wr_ptr <= wr_ptr + 1'b1;
        end
    end
    
    // Read operation
    always_ff @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            rd_ptr <= '0;
            addr_out0  <= '0;
            addr_out1  <= '0;
            addr_out2  <= '0;
            addr_out3  <= '0;
            addr_out4  <= '0;
            addr_out5  <= '0;
            addr_out6  <= '0;
            addr_out7  <= '0;
            addr_out0B <= '0;
            addr_out1B <= '0;
            addr_out2B <= '0;
            addr_out3B <= '0;
            addr_out4B <= '0;
            addr_out5B <= '0;
            addr_out6B <= '0;
            addr_out7B <= '0;
        end else if (pop && !empty) begin
            addr_out0  <= fifo_mem[rd_ptr][0];
            addr_out1  <= fifo_mem[rd_ptr][1];
            addr_out2  <= fifo_mem[rd_ptr][2];
            addr_out3  <= fifo_mem[rd_ptr][3];
            addr_out4  <= fifo_mem[rd_ptr][4];
            addr_out5  <= fifo_mem[rd_ptr][5];
            addr_out6  <= fifo_mem[rd_ptr][6];
            addr_out7  <= fifo_mem[rd_ptr][7];
            addr_out0B <= fifo_mem[rd_ptr][8];
            addr_out1B <= fifo_mem[rd_ptr][9];
            addr_out2B <= fifo_mem[rd_ptr][10];
            addr_out3B <= fifo_mem[rd_ptr][11];
            addr_out4B <= fifo_mem[rd_ptr][12];
            addr_out5B <= fifo_mem[rd_ptr][13];
            addr_out6B <= fifo_mem[rd_ptr][14];
            addr_out7B <= fifo_mem[rd_ptr][15];
            
            rd_ptr <= rd_ptr + 1'b1;
        end
    end
    
    // Counter logic
    always_ff @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            counter <= '0;
        end else begin
            case ({push && !full, pop && !empty})
                2'b10:   counter <= counter + 1'b1;  // Push only
                2'b01:   counter <= counter - 1'b1;  // Pop only
                default: counter <= counter;          // Both or neither
            endcase
        end
    end

endmodule