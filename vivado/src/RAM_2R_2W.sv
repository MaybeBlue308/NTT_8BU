

module RAM_2R_2W #(
    parameter DATA_WIDTH = 12,
    parameter ADW = 5,
    parameter INIT_FILE = ""
    )(
    // Port A
    input  wire                     clk_i,  
    input  wire                     we,      
    input  wire [ADW-1:0]           addrr_a,
    input  wire [ADW-1:0]           addrw_a,
    input  wire [DATA_WIDTH-1:0]    din_a,  
    output reg  [DATA_WIDTH-1:0]    dout_a, 

    // Port B
    input  wire [ADW-1:0]           addrr_b,
    input  wire [ADW-1:0]           addrw_b,
    input  wire [DATA_WIDTH-1:0]    din_b,  
    output reg  [DATA_WIDTH-1:0]    dout_b  
);

    reg [DATA_WIDTH-1:0] blockram [0:31];

    always @(posedge clk) begin
        if (we) begin
            blockram[addrw_a] <= din_a;
            blockram[addrw_b] <= din_b;
        end 
        dout_a <= blockram[addrr_a];
        dout_b <= blockram[addrr_b];
    end
endmodule


