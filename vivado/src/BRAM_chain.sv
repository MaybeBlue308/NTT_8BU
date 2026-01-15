module BRAM_chain #(
    parameter WIDTH = 12,
    parameter INPUT_WIDTH = WIDTH * 16,
    parameter ADDR_WIDTH = 5
    )(
    input   logic                   clk_i,
    input   logic                   rst_i,
    input   logic                   we,
    /*--------------------------------*/
    input   logic [ADDR_WIDTH - 1:0] addr_out0, 
    input   logic [ADDR_WIDTH - 1:0] addr_out1, 
    input   logic [ADDR_WIDTH - 1:0] addr_out2,
    input   logic [ADDR_WIDTH - 1:0] addr_out3,
    input   logic [ADDR_WIDTH - 1:0] addr_out4,
    input   logic [ADDR_WIDTH - 1:0] addr_out5,
    input   logic [ADDR_WIDTH - 1:0] addr_out6,
    input   logic [ADDR_WIDTH - 1:0] addr_out7,
    input   logic [ADDR_WIDTH - 1:0] addr_out0B, 
    input   logic [ADDR_WIDTH - 1:0] addr_out1B, 
    input   logic [ADDR_WIDTH - 1:0] addr_out2B,
    input   logic [ADDR_WIDTH - 1:0] addr_out3B,
    input   logic [ADDR_WIDTH - 1:0] addr_out4B,
    input   logic [ADDR_WIDTH - 1:0] addr_out5B,
    input   logic [ADDR_WIDTH - 1:0] addr_out6B,
    input   logic [ADDR_WIDTH - 1:0] addr_out7B

    input   logic [INPUT_WIDTH-1:0] din,
    /*--------------------------------*/
    output  logic [WIDTH - 1:0] data_bram0, 
    output  logic [WIDTH - 1:0] data_bram1, 
    output  logic [WIDTH - 1:0] data_bram2,
    output  logic [WIDTH - 1:0] data_bram3, 
    output  logic [WIDTH - 1:0] data_bram4, 
    output  logic [WIDTH - 1:0] data_bram5, 
    output  logic [WIDTH - 1:0] data_bram6,
    output  logic [WIDTH - 1:0] data_bram7, 
    output  logic [WIDTH - 1:0] data_bram0B, 
    output  logic [WIDTH - 1:0] data_bram1B, 
    output  logic [WIDTH - 1:0] data_bram2B,
    output  logic [WIDTH - 1:0] data_bram3B,
    output  logic [WIDTH - 1:0] data_bram4B,
    output  logic [WIDTH - 1:0] data_bram5B,
    output  logic [WIDTH - 1:0] data_bram6B,
    output  logic [WIDTH - 1:0] data_bram7B,

    output logic done_o
    );

    
    
endmodule