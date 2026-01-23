

module RAM_2R_2W #(
    parameter DATA_WIDTH = 12,
    parameter ADW = 5,
    parameter INIT_FILE = ""
    )(
    // Port A
    input  wire                     clk_i,    // clock for port A
    input  wire                     we,     // write enable for port B
    input  wire [ADW-1:0]           addrr_a,   // address for port A
    input  wire [ADW-1:0]           addrw_a,   // address for port A
    input  wire [DATA_WIDTH-1:0]    din_a,    // data in for port A
    output reg  [DATA_WIDTH-1:0]    dout_a,   // data out for port A

    // Port B
    input  wire [ADW-1:0]           addrr_b,   // address for port B
    input  wire [ADW-1:0]           addrw_b,   // address for port B
    input  wire [DATA_WIDTH-1:0]    din_b,    // data in for port B
    output reg  [DATA_WIDTH-1:0]    dout_b    // data out for port B
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


