module bram_tdp #(
    parameter DATA_WIDTH = 12,
    parameter ADW = 5,
    parameter INIT_FILE = ""
    )(
    // Port A
    input  wire                     clk_i,    // clock for port A
    input  wire                     we_a,     // write enable for port A
    input  wire [ADW-1:0]           addr_a,   // address for port A
    input  wire [DATA_WIDTH-1:0]    din_a,    // data in for port A
    output reg  [DATA_WIDTH-1:0]    dout_a,   // data out for port A

    // Port B
    input  wire                     we_b,     // write enable for port B
    input  wire [ADW-1:0]           addr_b,   // address for port B
    input  wire [DATA_WIDTH-1:0]    din_b,    // data in for port B
    output reg  [DATA_WIDTH-1:0]    dout_b    // data out for port B
);

    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] blockram [0:31];

    always @(posedge clk) begin
        if (we_a) blockram[addr_a] <= din_a;
        dout_a <= blockram[addr_a];
    end

    always @(posedge clk) begin
        if (we_b) blockram[addr_b] <= din_b;
        dout_b <= blockram[addr_b];
    end

endmodule


