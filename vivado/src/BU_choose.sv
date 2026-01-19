module BU_chose #(
    parameter DATA_WIDTH = 12
    )(
    input logic                  clk_i,    
    input logic                  rst_i,
    input logic [7:0]            len_i,
    input logic                  start_i,
    input logic [DATA_WIDTH-1:0] data_bram0, 
    input logic [DATA_WIDTH-1:0] data_bram1, 
    input logic [DATA_WIDTH-1:0] data_bram2,
    input logic [DATA_WIDTH-1:0] data_bram3,
    input logic [DATA_WIDTH-1:0] data_bram4,
    input logic [DATA_WIDTH-1:0] data_bram5,
    input logic [DATA_WIDTH-1:0] data_bram6,
    input logic [DATA_WIDTH-1:0] data_bram7,
    input logic [DATA_WIDTH-1:0] data_bram0B, 
    input logic [DATA_WIDTH-1:0] data_bram1B, 
    input logic [DATA_WIDTH-1:0] data_bram2B,
    input logic [DATA_WIDTH-1:0] data_bram3B,
    input logic [DATA_WIDTH-1:0] data_bram4B,
    input logic [DATA_WIDTH-1:0] data_bram5B,
    input logic [DATA_WIDTH-1:0] data_bram6B,
    input logic [DATA_WIDTH-1:0] data_bram7B

    output logic [DATA_WIDTH-1:0] A_NTT0, 
    output logic [DATA_WIDTH-1:0] A_NTT1, 
    output logic [DATA_WIDTH-1:0] A_NTT2,
    output logic [DATA_WIDTH-1:0] A_NTT3,
    output logic [DATA_WIDTH-1:0] A_NTT4,
    output logic [DATA_WIDTH-1:0] A_NTT5,
    output logic [DATA_WIDTH-1:0] A_NTT6,
    output logic [DATA_WIDTH-1:0] A_NTT7,
    output logic [DATA_WIDTH-1:0] A_iNTT0, 
    output logic [DATA_WIDTH-1:0] A_iNTT1, 
    output logic [DATA_WIDTH-1:0] A_iNTT2,
    output logic [DATA_WIDTH-1:0] A_iNTT3,
    output logic [DATA_WIDTH-1:0] A_iNTT4,
    output logic [DATA_WIDTH-1:0] A_iNTT5,
    output logic [DATA_WIDTH-1:0] A_iNTT6,
    output logic [DATA_WIDTH-1:0] A_iNTT7,

    output logic [DATA_WIDTH-1:0] B_NTT0, 
    output logic [DATA_WIDTH-1:0] B_NTT1, 
    output logic [DATA_WIDTH-1:0] B_NTT2,
    output logic [DATA_WIDTH-1:0] B_NTT3,
    output logic [DATA_WIDTH-1:0] B_NTT4,
    output logic [DATA_WIDTH-1:0] B_NTT5,
    output logic [DATA_WIDTH-1:0] B_NTT6,
    output logic [DATA_WIDTH-1:0] B_NTT7,
    output logic [DATA_WIDTH-1:0] B_iNTT0, 
    output logic [DATA_WIDTH-1:0] B_iNTT1, 
    output logic [DATA_WIDTH-1:0] B_iNTT2,
    output logic [DATA_WIDTH-1:0] B_iNTT3,
    output logic [DATA_WIDTH-1:0] B_iNTT4,
    output logic [DATA_WIDTH-1:0] B_iNTT5,
    output logic [DATA_WIDTH-1:0] B_iNTT6,
    output logic [DATA_WIDTH-1:0] B_iNTT7        
);

    logic [DATA_WIDTH-1:0] 













endmodule