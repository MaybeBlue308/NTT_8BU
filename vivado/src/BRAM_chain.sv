/*
module BRAM_chain #(
    parameter DATA_WIDTH = 12,
    parameter INPUT_WIDTH = DATA_WIDTH * 16,
    parameter ADDR_WIDTH = 5,
    parameter DELAY_ADDR_WRITE = 7
    )(
    input logic                     clk_i,
    input logic                     rst_i,
    input logic                     start_BRAM_chain,
    input logic                     start_BRAM_load,
    input logic                     start_BRAM_write,
    input logic [7:0]               we,
    input logic [DATA_WIDTH-1:0]    data_load_a,
    input logic [DATA_WIDTH-1:0]    data_load_b,
    input logic [ADDR_WIDTH-1:0]    addr_load_a,
    input logic [ADDR_WIDTH-1:0]    addr_load_b,

    input logic [DATA_WIDTH-1:0]    data_in0, 
    input logic [DATA_WIDTH-1:0]    data_in1, 
    input logic [DATA_WIDTH-1:0]    data_in2,
    input logic [DATA_WIDTH-1:0]    data_in3,
    input logic [DATA_WIDTH-1:0]    data_in4,
    input logic [DATA_WIDTH-1:0]    data_in5,
    input logic [DATA_WIDTH-1:0]    data_in6,
    input logic [DATA_WIDTH-1:0]    data_in7,
    input logic [DATA_WIDTH-1:0]    data_in0B, 
    input logic [DATA_WIDTH-1:0]    data_in1B, 
    input logic [DATA_WIDTH-1:0]    data_in2B,
    input logic [DATA_WIDTH-1:0]    data_in3B,
    input logic [DATA_WIDTH-1:0]    data_in4B,
    input logic [DATA_WIDTH-1:0]    data_in5B,
    input logic [DATA_WIDTH-1:0]    data_in6B,
    input logic [DATA_WIDTH-1:0]    data_in7B,

    input logic [ADDR_WIDTH-1:0]    addr_out0, 
    input logic [ADDR_WIDTH-1:0]    addr_out1, 
    input logic [ADDR_WIDTH-1:0]    addr_out2,
    input logic [ADDR_WIDTH-1:0]    addr_out3,
    input logic [ADDR_WIDTH-1:0]    addr_out4,
    input logic [ADDR_WIDTH-1:0]    addr_out5,
    input logic [ADDR_WIDTH-1:0]    addr_out6,
    input logic [ADDR_WIDTH-1:0]    addr_out7,
    input logic [ADDR_WIDTH-1:0]    addr_out0B, 
    input logic [ADDR_WIDTH-1:0]    addr_out1B, 
    input logic [ADDR_WIDTH-1:0]    addr_out2B,
    input logic [ADDR_WIDTH-1:0]    addr_out3B,
    input logic [ADDR_WIDTH-1:0]    addr_out4B,
    input logic [ADDR_WIDTH-1:0]    addr_out5B,
    input logic [ADDR_WIDTH-1:0]    addr_out6B,
    input logic [ADDR_WIDTH-1:0]    addr_out7B,    

    output logic [DATA_WIDTH-1:0]   data_bram0, 
    output logic [DATA_WIDTH-1:0]   data_bram1, 
    output logic [DATA_WIDTH-1:0]   data_bram2,
    output logic [DATA_WIDTH-1:0]   data_bram3, 
    output logic [DATA_WIDTH-1:0]   data_bram4, 
    output logic [DATA_WIDTH-1:0]   data_bram5, 
    output logic [DATA_WIDTH-1:0]   data_bram6,
    output logic [DATA_WIDTH-1:0]   data_bram7, 
    output logic [DATA_WIDTH-1:0]   data_bram0B, 
    output logic [DATA_WIDTH-1:0]   data_bram1B, 
    output logic [DATA_WIDTH-1:0]   data_bram2B,
    output logic [DATA_WIDTH-1:0]   data_bram3B,
    output logic [DATA_WIDTH-1:0]   data_bram4B,
    output logic [DATA_WIDTH-1:0]   data_bram5B,
    output logic [DATA_WIDTH-1:0]   data_bram6B,
    output logic [DATA_WIDTH-1:0]   data_bram7B,
    );

    logic [DATA_WIDTH-1:0] din0a, din0b, din1a, din1b, din2a, din2b, din3a, din3b, din4a, din4b, din5a, din5b, din6a, din6b, din7a, din7b;
    logic [ADDR_WIDTH-1:0] addr_in0, addr_in1, addr_in2, addr_in3, addr_in4, addr_in5, addr_in6, addr_in7;
    logic [ADDR_WIDTH-1:0] addr_in0B, addr_in1B, addr_in2B, addr_in3B, addr_in4B, addr_in5B, addr_in6B, addr_in7B;

    ////////BRAM0/////////
    bram_tdp bram0 (
        .clk_i (clk_i),
        .we_a  (we[0]),
        .addr_a (addr_in0),
        .din_a  (din0a),
        .dout_a (data_bram0),
        .we_b   (we[0]),
        .addr_b (addr_in0B),
        .din_b  (din0b),
        .dout_b (data_bram0B)
    );
    ////////BRAM1/////////
    bram_tdp bram1 (
        .clk_i (clk_i),
        .we_a  (we[1]),
        .addr_a (addr_in1),
        .din_a  (din1a),
        .dout_a (data_bram1),
        .we_b   (we[1]),
        .addr_b (addr_in1B),
        .din_b  (din1b),
        .dout_b (data_bram1B)
    );
    ////////BRAM2/////////
    bram_tdp bram1 (
        .clk_i (clk_i),
        .we_a  (we[2]),
        .addr_a (addr_in2),
        .din_a  (din2a),
        .dout_a (data_bram2),
        .we_b   (we[2]),
        .addr_b (addr_in2B),
        .din_b  (din2b),
        .dout_b (data_bram2B)
    );
    ////////BRAM3/////////
    bram_tdp bram3 (
        .clk_i (clk_i),
        .we_a  (we[3]),
        .addr_a (addr_in3),
        .din_a  (din3a),
        .dout_a (data_bram3),
        .we_b   (we[3]),
        .addr_b (addr_in3B),
        .din_b  (din3b),
        .dout_b (data_bram3B)
    );
    ////////BRAM4/////////
    bram_tdp bram4 (
        .clk_i (clk_i),
        .we_a  (we[4]),
        .addr_a (addr_in4),
        .din_a  (din4a),
        .dout_a (data_bram4),
        .we_b   (we[4]),
        .addr_b (addr_in4B),
        .din_b  (din4b),
        .dout_b (data_bram4B)
    );
    ////////BRAM5/////////
    bram_tdp bram5 (
        .clk_i  (clk_i),
        .we_a   (we[5]),
        .addr_a (addr_in5),
        .din_a  (din5a),
        .dout_a (data_bram5),
        .we_b   (we[5]),
        .addr_b (addr_in5B),
        .din_b  (din5b),
        .dout_b (data_bram5B)
    );
    ////////BRAM6/////////
    bram_tdp bram6 (
        .clk_i (clk_i),
        .we_a  (we[6]),
        .addr_a (addr_in6),
        .din_a  (din6a),
        .dout_a (data_bram6),
        .we_b   (we[6]),
        .addr_b (addr_in6B),
        .din_b  (din6b),
        .dout_b (data_bram6B)
    );
    ////////BRAM7/////////
    bram_tdp bram7 (
        .clk_i  (clk_i),
        .we_a   (we[7]),
        .addr_a (addr_in7),
        .din_a  (din7a),
        .dout_a (data_bram7),
        .we_b   (we[7]),
        .addr_b (addr_in7B),
        .din_b  (din7b),
        .dout_b (data_bram7B)
    );

    logic [ADDR_WIDTH-1:0] addr_in [0:15];
    assign addr_in = ' {addr_out7B, addr_out6B, addr_out5B, addr_out4B, addr_out3B, addr_out2B, addr_out1B, addr_out0B,
                        addr_out7, addr_out6, addr_out5, addr_out4, addr_out3, addr_out2, addr_out1, addr_out0};
    logic [ADDR_WIDTH-1:0] load_addr_outa, load_addr_outb;

    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            {din0a, din0b, din1a, din1b, din2a, din2b, din3a, din3b, din4a, din4b, din5a, din5b, din6a, din6b, din7a, din7b} <= '0;
        end else begin
            if (start_BRAM_chain) begin
                case (mode_BRAM);
                    2'b00: {din0a, din0b, din1a, din1b, din2a, din2b, din3a, din3b, din4a, din4b, din5a, din5b, din6a, din6b, din7a, din7b} <= '0
                    2'b01: begin
                        din0a <= data_load_a;
                        din0b <= data_load_b;
                        din1a <= data_load_a;
                        din1b <= data_load_b;
                        din2a <= data_load_a;
                        din2b <= data_load_b;
                        din3a <= data_load_a;
                        din3b <= data_load_b;
                        din4a <= data_load_a;
                        din4b <= data_load_b;
                        din5a <= data_load_a;
                        din5b <= data_load_b;
                        din6a <= data_load_a;
                        din6b <= data_load_b;
                        din7a <= data_load_a;
                        din7b <= data_load_b;

                        addr_in0    <= addr_out0;                        
                        addr_in1    <= addr_out1;
                        addr_in2    <= addr_out2;
                        addr_in3    <= addr_out3;
                        addr_in4    <= addr_out4;
                        addr_in5    <= addr_out5;
                        addr_in6    <= addr_out6;
                        addr_in7    <= addr_out7;
                        addr_in0B   <= addr_out0B;
                        addr_in1B   <= addr_out1B;
                        addr_in2B   <= addr_out2B;
                        addr_in3B   <= addr_out3B;
                        addr_in4B   <= addr_out4B;
                        addr_in5B   <= addr_out5B;
                        addr_in6B   <= addr_out6B;
                        addr_in7B   <= addr_out7B;
                    end
                    2'b10: begin
                        
                    end
                    2'b11: begin
                        din0a <= data_in0;
                        din0b <= data_in0B;
                        din1a <= data_in1;
                        din1b <= data_in1B;
                        din2a <= data_in2;
                        din2b <= data_in2B;
                        din3a <= data_in3;
                        din3b <= data_in3B;
                        din4a <= data_in4;
                        din4b <= data_in4B;
                        din5a <= data_in5;
                        din5b <= data_in5B;
                        din6a <= data_in6;
                        din6b <= data_in6B;
                        din7a <= data_in7;
                        din7b <= data_in7B;

                        addr_in0    <= addr_load_a;                        
                        addr_in1    <= addr_load_b;
                        addr_in2    <= addr_load_a;
                        addr_in3    <= addr_load_b;
                        addr_in4    <= addr_load_a;
                        addr_in5    <= addr_load_b;
                        addr_in6    <= addr_load_a;
                        addr_in7    <= addr_load_b;
                        addr_in0B   <= addr_load_a;
                        addr_in1B   <= addr_load_b;
                        addr_in2B   <= addr_load_a;
                        addr_in3B   <= addr_load_b;
                        addr_in4B   <= addr_load_a;
                        addr_in5B   <= addr_load_b;
                        addr_in6B   <= addr_load_a;
                        addr_in7B   <= addr_load_b;
                    end
                endcase
            end
        end
    end
    
    
endmodule
*/

module BRAM_chain #(
    parameter DATA_WIDTH = 12,
    parameter INPUT_WIDTH = DATA_WIDTH * 16,
    parameter ADDR_WIDTH = 5,
    parameter DELAY_ADDR_WRITE = 7
)(
    input logic                     clk_i,
    input logic                     rst_i,
    input logic                     start_BRAM_chain,
    input logic                     start_BRAM_load,
    input logic                     start_BRAM_write,
    input logic [7:0]               we,
    input logic [DATA_WIDTH-1:0]    data_load_a,
    input logic [DATA_WIDTH-1:0]    data_load_b,
    input logic [ADDR_WIDTH-1:0]    addr_load_a,
    input logic [ADDR_WIDTH-1:0]    addr_load_b,

    // Data from BU (for write back)
    input logic [DATA_WIDTH-1:0]    data_in0, 
    input logic [DATA_WIDTH-1:0]    data_in1, 
    input logic [DATA_WIDTH-1:0]    data_in2,
    input logic [DATA_WIDTH-1:0]    data_in3,
    input logic [DATA_WIDTH-1:0]    data_in4,
    input logic [DATA_WIDTH-1:0]    data_in5,
    input logic [DATA_WIDTH-1:0]    data_in6,
    input logic [DATA_WIDTH-1:0]    data_in7,
    input logic [DATA_WIDTH-1:0]    data_in0B, 
    input logic [DATA_WIDTH-1:0]    data_in1B, 
    input logic [DATA_WIDTH-1:0]    data_in2B,
    input logic [DATA_WIDTH-1:0]    data_in3B,
    input logic [DATA_WIDTH-1:0]    data_in4B,
    input logic [DATA_WIDTH-1:0]    data_in5B,
    input logic [DATA_WIDTH-1:0]    data_in6B,
    input logic [DATA_WIDTH-1:0]    data_in7B,

    // Address from address generator (for read and write)
    input logic [ADDR_WIDTH-1:0]    addr_out0, 
    input logic [ADDR_WIDTH-1:0]    addr_out1, 
    input logic [ADDR_WIDTH-1:0]    addr_out2,
    input logic [ADDR_WIDTH-1:0]    addr_out3,
    input logic [ADDR_WIDTH-1:0]    addr_out4,
    input logic [ADDR_WIDTH-1:0]    addr_out5,
    input logic [ADDR_WIDTH-1:0]    addr_out6,
    input logic [ADDR_WIDTH-1:0]    addr_out7,
    input logic [ADDR_WIDTH-1:0]    addr_out0B, 
    input logic [ADDR_WIDTH-1:0]    addr_out1B, 
    input logic [ADDR_WIDTH-1:0]    addr_out2B,
    input logic [ADDR_WIDTH-1:0]    addr_out3B,
    input logic [ADDR_WIDTH-1:0]    addr_out4B,
    input logic [ADDR_WIDTH-1:0]    addr_out5B,
    input logic [ADDR_WIDTH-1:0]    addr_out6B,
    input logic [ADDR_WIDTH-1:0]    addr_out7B,    

    // Data output to BU
    output logic [DATA_WIDTH-1:0]   data_bram0, 
    output logic [DATA_WIDTH-1:0]   data_bram1, 
    output logic [DATA_WIDTH-1:0]   data_bram2,
    output logic [DATA_WIDTH-1:0]   data_bram3, 
    output logic [DATA_WIDTH-1:0]   data_bram4, 
    output logic [DATA_WIDTH-1:0]   data_bram5, 
    output logic [DATA_WIDTH-1:0]   data_bram6,
    output logic [DATA_WIDTH-1:0]   data_bram7, 
    output logic [DATA_WIDTH-1:0]   data_bram0B, 
    output logic [DATA_WIDTH-1:0]   data_bram1B, 
    output logic [DATA_WIDTH-1:0]   data_bram2B,
    output logic [DATA_WIDTH-1:0]   data_bram3B,
    output logic [DATA_WIDTH-1:0]   data_bram4B,
    output logic [DATA_WIDTH-1:0]   data_bram5B,
    output logic [DATA_WIDTH-1:0]   data_bram6B,
    output logic [DATA_WIDTH-1:0]   data_bram7B
);

    // Internal signals for BRAM ports
    logic [DATA_WIDTH-1:0] din0a, din0b, din1a, din1b, din2a, din2b, din3a, din3b;
    logic [DATA_WIDTH-1:0] din4a, din4b, din5a, din5b, din6a, din6b, din7a, din7b;
    logic [ADDR_WIDTH-1:0] addr_in0, addr_in1, addr_in2, addr_in3, addr_in4, addr_in5, addr_in6, addr_in7;
    logic [ADDR_WIDTH-1:0] addr_in0B, addr_in1B, addr_in2B, addr_in3B, addr_in4B, addr_in5B, addr_in6B, addr_in7B;

    // Delayed addresses for write-back (to match read addresses)
    logic [ADDR_WIDTH-1:0] addr_write_delay[0:DELAY_ADDR_WRITE-1][0:15];

    ////////BRAM0/////////
    bram_tdp bram0 (
        .clk_i  (clk_i),
        .we_a   (we[0]),
        .addr_a (addr_in0),
        .din_a  (din0a),
        .dout_a (data_bram0),
        .we_b   (we[0]),
        .addr_b (addr_in0B),
        .din_b  (din0b),
        .dout_b (data_bram0B)
    );
    
    ////////BRAM1/////////
    bram_tdp bram1 (
        .clk_i  (clk_i),
        .we_a   (we[1]),
        .addr_a (addr_in1),
        .din_a  (din1a),
        .dout_a (data_bram1),
        .we_b   (we[1]),
        .addr_b (addr_in1B),
        .din_b  (din1b),
        .dout_b (data_bram1B)
    );
    
    ////////BRAM2/////////
    bram_tdp bram2 (
        .clk_i  (clk_i),
        .we_a   (we[2]),
        .addr_a (addr_in2),
        .din_a  (din2a),
        .dout_a (data_bram2),
        .we_b   (we[2]),
        .addr_b (addr_in2B),
        .din_b  (din2b),
        .dout_b (data_bram2B)
    );
    
    ////////BRAM3/////////
    bram_tdp bram3 (
        .clk_i  (clk_i),
        .we_a   (we[3]),
        .addr_a (addr_in3),
        .din_a  (din3a),
        .dout_a (data_bram3),
        .we_b   (we[3]),
        .addr_b (addr_in3B),
        .din_b  (din3b),
        .dout_b (data_bram3B)
    );
    
    ////////BRAM4/////////
    bram_tdp bram4 (
        .clk_i  (clk_i),
        .we_a   (we[4]),
        .addr_a (addr_in4),
        .din_a  (din4a),
        .dout_a (data_bram4),
        .we_b   (we[4]),
        .addr_b (addr_in4B),
        .din_b  (din4b),
        .dout_b (data_bram4B)
    );
    
    ////////BRAM5/////////
    bram_tdp bram5 (
        .clk_i  (clk_i),
        .we_a   (we[5]),
        .addr_a (addr_in5),
        .din_a  (din5a),
        .dout_a (data_bram5),
        .we_b   (we[5]),
        .addr_b (addr_in5B),
        .din_b  (din5b),
        .dout_b (data_bram5B)
    );
    
    ////////BRAM6/////////
    bram_tdp bram6 (
        .clk_i  (clk_i),
        .we_a   (we[6]),
        .addr_a (addr_in6),
        .din_a  (din6a),
        .dout_a (data_bram6),
        .we_b   (we[6]),
        .addr_b (addr_in6B),
        .din_b  (din6b),
        .dout_b (data_bram6B)
    );
    
    ////////BRAM7/////////
    bram_tdp bram7 (
        .clk_i  (clk_i),
        .we_a   (we[7]),
        .addr_a (addr_in7),
        .din_a  (din7a),
        .dout_a (data_bram7),
        .we_b   (we[7]),
        .addr_b (addr_in7B),
        .din_b  (din7b),
        .dout_b (data_bram7B)
    );

    // Address delay pipeline for write-back
    always_ff @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            for (int i = 0; i < DELAY_ADDR_WRITE; i++) begin
                for (int j = 0; j < 16; j++) begin
                    addr_write_delay[i][j] <= '0;
                end
            end
        end else if (start_BRAM_chain) begin
            // Shift the delay pipeline
            addr_write_delay[0][0]  <= addr_out0;
            addr_write_delay[0][1]  <= addr_out1;
            addr_write_delay[0][2]  <= addr_out2;
            addr_write_delay[0][3]  <= addr_out3;
            addr_write_delay[0][4]  <= addr_out4;
            addr_write_delay[0][5]  <= addr_out5;
            addr_write_delay[0][6]  <= addr_out6;
            addr_write_delay[0][7]  <= addr_out7;
            addr_write_delay[0][8]  <= addr_out0B;
            addr_write_delay[0][9]  <= addr_out1B;
            addr_write_delay[0][10] <= addr_out2B;
            addr_write_delay[0][11] <= addr_out3B;
            addr_write_delay[0][12] <= addr_out4B;
            addr_write_delay[0][13] <= addr_out5B;
            addr_write_delay[0][14] <= addr_out6B;
            addr_write_delay[0][15] <= addr_out7B;
            
            for (int i = 1; i < DELAY_ADDR_WRITE; i++) begin
                addr_write_delay[i] <= addr_write_delay[i-1];
            end
        end
    end

    // BRAM control logic
    always_ff @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            din0a <= '0; din0b <= '0;
            din1a <= '0; din1b <= '0;
            din2a <= '0; din2b <= '0;
            din3a <= '0; din3b <= '0;
            din4a <= '0; din4b <= '0;
            din5a <= '0; din5b <= '0;
            din6a <= '0; din6b <= '0;
            din7a <= '0; din7b <= '0;
            
            addr_in0  <= '0; addr_in0B  <= '0;
            addr_in1  <= '0; addr_in1B  <= '0;
            addr_in2  <= '0; addr_in2B  <= '0;
            addr_in3  <= '0; addr_in3B  <= '0;
            addr_in4  <= '0; addr_in4B  <= '0;
            addr_in5  <= '0; addr_in5B  <= '0;
            addr_in6  <= '0; addr_in6B  <= '0;
            addr_in7  <= '0; addr_in7B  <= '0;
        end else begin
            // LOAD MODE: Load data from controller (din_load_a/b)
            if (start_BRAM_load) begin
                din0a <= data_load_a;
                din0b <= data_load_b;
                din1a <= data_load_a;
                din1b <= data_load_b;
                din2a <= data_load_a;
                din2b <= data_load_b;
                din3a <= data_load_a;
                din3b <= data_load_b;
                din4a <= data_load_a;
                din4b <= data_load_b;
                din5a <= data_load_a;
                din5b <= data_load_b;
                din6a <= data_load_a;
                din6b <= data_load_b;
                din7a <= data_load_a;
                din7b <= data_load_b;

                addr_in0  <= addr_load_a;
                addr_in1  <= addr_load_a;
                addr_in2  <= addr_load_a;
                addr_in3  <= addr_load_a;
                addr_in4  <= addr_load_a;
                addr_in5  <= addr_load_a;
                addr_in6  <= addr_load_a;
                addr_in7  <= addr_load_a;
                addr_in0B <= addr_load_b;
                addr_in1B <= addr_load_b;
                addr_in2B <= addr_load_b;
                addr_in3B <= addr_load_b;
                addr_in4B <= addr_load_b;
                addr_in5B <= addr_load_b;
                addr_in6B <= addr_load_b;
                addr_in7B <= addr_load_b;
            end
            // READ MODE: Read data from BRAM using address generator addresses
            else if (start_BRAM_chain) begin
                // Don't care about din in read mode, but set to 0 for safety
                din0a <= '0; din0b <= '0;
                din1a <= '0; din1b <= '0;
                din2a <= '0; din2b <= '0;
                din3a <= '0; din3b <= '0;
                din4a <= '0; din4b <= '0;
                din5a <= '0; din5b <= '0;
                din6a <= '0; din6b <= '0;
                din7a <= '0; din7b <= '0;

                addr_in0  <= addr_out0;
                addr_in1  <= addr_out1;
                addr_in2  <= addr_out2;
                addr_in3  <= addr_out3;
                addr_in4  <= addr_out4;
                addr_in5  <= addr_out5;
                addr_in6  <= addr_out6;
                addr_in7  <= addr_out7;
                addr_in0B <= addr_out0B;
                addr_in1B <= addr_out1B;
                addr_in2B <= addr_out2B;
                addr_in3B <= addr_out3B;
                addr_in4B <= addr_out4B;
                addr_in5B <= addr_out5B;
                addr_in6B <= addr_out6B;
                addr_in7B <= addr_out7B;
            end
            // WRITE MODE: Write data back from BU using delayed addresses
            else if (start_BRAM_write) begin
                din0a <= data_in0;
                din0b <= data_in0B;
                din1a <= data_in1;
                din1b <= data_in1B;
                din2a <= data_in2;
                din2b <= data_in2B;
                din3a <= data_in3;
                din3b <= data_in3B;
                din4a <= data_in4;
                din4b <= data_in4B;
                din5a <= data_in5;
                din5b <= data_in5B;
                din6a <= data_in6;
                din6b <= data_in6B;
                din7a <= data_in7;
                din7b <= data_in7B;

                // Use delayed addresses to write back to the same locations we read from
                addr_in0  <= addr_write_delay[DELAY_ADDR_WRITE-1][0];
                addr_in1  <= addr_write_delay[DELAY_ADDR_WRITE-1][1];
                addr_in2  <= addr_write_delay[DELAY_ADDR_WRITE-1][2];
                addr_in3  <= addr_write_delay[DELAY_ADDR_WRITE-1][3];
                addr_in4  <= addr_write_delay[DELAY_ADDR_WRITE-1][4];
                addr_in5  <= addr_write_delay[DELAY_ADDR_WRITE-1][5];
                addr_in6  <= addr_write_delay[DELAY_ADDR_WRITE-1][6];
                addr_in7  <= addr_write_delay[DELAY_ADDR_WRITE-1][7];
                addr_in0B <= addr_write_delay[DELAY_ADDR_WRITE-1][8];
                addr_in1B <= addr_write_delay[DELAY_ADDR_WRITE-1][9];
                addr_in2B <= addr_write_delay[DELAY_ADDR_WRITE-1][10];
                addr_in3B <= addr_write_delay[DELAY_ADDR_WRITE-1][11];
                addr_in4B <= addr_write_delay[DELAY_ADDR_WRITE-1][12];
                addr_in5B <= addr_write_delay[DELAY_ADDR_WRITE-1][13];
                addr_in6B <= addr_write_delay[DELAY_ADDR_WRITE-1][14];
                addr_in7B <= addr_write_delay[DELAY_ADDR_WRITE-1][15];
            end
        end
    end

endmodule