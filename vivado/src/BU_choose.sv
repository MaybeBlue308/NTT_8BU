module BU_chose #(
    parameter DATA_WIDTH = 13
    )(
    input logic                  clk_i,    
    input logic                  rst_i,
    input logic [7:0]            len_i,
    input logic                  start_BU_choose,
    input logic                  is_NTT_BU_choose,
    input logic [DATA_WIDTH-2:0] data_bram0, 
    input logic [DATA_WIDTH-2:0] data_bram1, 
    input logic [DATA_WIDTH-2:0] data_bram2,
    input logic [DATA_WIDTH-2:0] data_bram3,
    input logic [DATA_WIDTH-2:0] data_bram4,
    input logic [DATA_WIDTH-2:0] data_bram5,
    input logic [DATA_WIDTH-2:0] data_bram6,
    input logic [DATA_WIDTH-2:0] data_bram7,
    input logic [DATA_WIDTH-2:0] data_bram0B, 
    input logic [DATA_WIDTH-2:0] data_bram1B, 
    input logic [DATA_WIDTH-2:0] data_bram2B,
    input logic [DATA_WIDTH-2:0] data_bram3B,
    input logic [DATA_WIDTH-2:0] data_bram4B,
    input logic [DATA_WIDTH-2:0] data_bram5B,
    input logic [DATA_WIDTH-2:0] data_bram6B,
    input logic [DATA_WIDTH-2:0] data_bram7B

    output logic [DATA_WIDTH-2:0] A_NTT0, 
    output logic [DATA_WIDTH-2:0] A_NTT1, 
    output logic [DATA_WIDTH-2:0] A_NTT2,
    output logic [DATA_WIDTH-2:0] A_NTT3,
    output logic [DATA_WIDTH-2:0] A_NTT4,
    output logic [DATA_WIDTH-2:0] A_NTT5,
    output logic [DATA_WIDTH-2:0] A_NTT6,
    output logic [DATA_WIDTH-2:0] A_NTT7,
    output logic [DATA_WIDTH-2:0] A_iNTT0, 
    output logic [DATA_WIDTH-2:0] A_iNTT1, 
    output logic [DATA_WIDTH-2:0] A_iNTT2,
    output logic [DATA_WIDTH-2:0] A_iNTT3,
    output logic [DATA_WIDTH-2:0] A_iNTT4,
    output logic [DATA_WIDTH-2:0] A_iNTT5,
    output logic [DATA_WIDTH-2:0] A_iNTT6,
    output logic [DATA_WIDTH-2:0] A_iNTT7,

    output logic [DATA_WIDTH-2:0] B_NTT0, 
    output logic [DATA_WIDTH-2:0] B_NTT1, 
    output logic [DATA_WIDTH-2:0] B_NTT2,
    output logic [DATA_WIDTH-2:0] B_NTT3,
    output logic [DATA_WIDTH-2:0] B_NTT4,
    output logic [DATA_WIDTH-2:0] B_NTT5,
    output logic [DATA_WIDTH-2:0] B_NTT6,
    output logic [DATA_WIDTH-2:0] B_NTT7,
    output logic [DATA_WIDTH-2:0] B_iNTT0, 
    output logic [DATA_WIDTH-2:0] B_iNTT1, 
    output logic [DATA_WIDTH-2:0] B_iNTT2,
    output logic [DATA_WIDTH-2:0] B_iNTT3,
    output logic [DATA_WIDTH-2:0] B_iNTT4,
    output logic [DATA_WIDTH-2:0] B_iNTT5,
    output logic [DATA_WIDTH-2:0] B_iNTT6,
    output logic [DATA_WIDTH-2:0] B_iNTT7        
);

    logic [DATA_WIDTH-2:0] in_BU0, in_BU1, in_BU2, in_BU3, in_BU4, in_BU5, in_BU6, in_BU7;
    logic [DATA_WIDTH-2:0] in_BU0_B, in_BU1_B, in_BU2_B, in_BU3_B, in_BU4_B, in_BU5_B, in_BU6_B, in_BU7_B;
    
    always_comb begin
        in_BU0      = '0;
        in_BU1      = '0;
        in_BU2      = '0;
        in_BU3      = '0;
        in_BU4      = '0;
        in_BU5      = '0;
        in_BU6      = '0;
        in_BU7      = '0;
        in_BU0_B    = '0;
        in_BU1_B    = '0;
        in_BU2_B    = '0;
        in_BU3_B    = '0;
        in_BU4_B    = '0;
        in_BU5_B    = '0;
        in_BU6_B    = '0;
        in_BU7_B    = '0;
        case (len_BU)
            8'd128 : begin
                in_BU0      = data_bram0;
                in_BU1      = data_bram2;
                in_BU2      = data_bram4;
                in_BU3      = data_bram6;
                in_BU4      = data_bram0B;
                in_BU5      = data_bram2B;
                in_BU6      = data_bram4B;
                in_BU7      = data_bram6B;
                in_BU0_B    = data_bram1;
                in_BU1_B    = data_bram3;
                in_BU2_B    = data_bram5;
                in_BU3_B    = data_bram7;
                in_BU4_B    = data_bram1B;
                in_BU5_B    = data_bram3B;
                in_BU6_B    = data_bram5B;
                in_BU7_B    = data_bram7B;
            end
            8'd64 : begin
                in_BU0      = data_bram0;
                in_BU1      = data_bram2;
                in_BU2      = data_bram0B;
                in_BU3      = data_bram2B;
                in_BU4      = data_bram4;
                in_BU5      = data_bram6;
                in_BU6      = data_bram4B;
                in_BU7      = data_bram6B;
                in_BU0_B    = data_bram1;
                in_BU1_B    = data_bram3;
                in_BU2_B    = data_bram1B;
                in_BU3_B    = data_bram3B;
                in_BU4_B    = data_bram5;
                in_BU5_B    = data_bram7;
                in_BU6_B    = data_bram5B;
                in_BU7_B    = data_bram7B;
            end
            8'd32 : begin
                in_BU0      = data_bram0;
                in_BU1      = data_bram0B;
                in_BU2      = data_bram2;
                in_BU3      = data_bram2B;
                in_BU4      = data_bram4;
                in_BU5      = data_bram4B;
                in_BU6      = data_bram6;
                in_BU7      = data_bram6B;
                in_BU0_B    = data_bram1;
                in_BU1_B    = data_bram1B;
                in_BU2_B    = data_bram3;
                in_BU3_B    = data_bram3B;
                in_BU4_B    = data_bram5;
                in_BU5_B    = data_bram5B;
                in_BU6_B    = data_bram7;
                in_BU7_B    = data_bram7B;
            end
            8'd16, 8'd8, 8'd4, 8'd2 : begin
                in_BU0      = data_bram0;
                in_BU1      = data_bram1;
                in_BU2      = data_bram2;
                in_BU3      = data_bram2B;
                in_BU4      = data_bram4;
                in_BU5      = data_bram4B;
                in_BU6      = data_bram6;
                in_BU7      = data_bram6B;
                in_BU0_B    = data_bram0B;
                in_BU1_B    = data_bram1B;
                in_BU2_B    = data_bram3;
                in_BU3_B    = data_bram3B;
                in_BU4_B    = data_bram5;
                in_BU5_B    = data_bram5B;
                in_BU6_B    = data_bram7;
                in_BU7_B    = data_bram7B;
            end
        endcase
    end

    logic [DATA_WIDTH-2:0] zeta0, zeta1, zeta2, zeta3, zeta4, zeta5, zeta6, zeta7;
    //zeta value
    ROM_zeta #(.DATA_WIDTH(DATA_WIDTH)) Zeta_value (
        .clk_i(clk_i),     .rst_i(rst_i),   .len_i (len_BU),    .start_i (start_BU_choose),
        .zeta0(zeta0),     .zeta1(zeta1),   .zeta2(zeta2),      .zeta3(zeta3),      .zeta4(zeta4),      .zeta5(zeta5),      .zeta6(zeta6),      .zeta7(zeta7)
    );
    //BU chain
    BU #(.DATA_WIDTH(DATA_WIDTH)) BU0 (
        .clk_i(clk_i),  .rst_i(rst_i),  .is_NTT(is_NTT_BU_choose),
        .A({1'b0, in_BU0}),     .B({1'b0,inBU0_B}),     .Zeta(zeta0),
        .A_NTT(A_NTT0),     .B_NTT(B_NTT0),     .A_iNTT(A_iNTT0),   .B_iNTT(B_iNTT0)
    );

    BU #(.DATA_WIDTH(DATA_WIDTH)) BU1 (
        .clk_i(clk_i),  .rst_i(rst_i),  .is_NTT(is_NTT_BU_choose),
        .A({1'b0, in_BU1}),     .B({1'b0,inBU1_B}),     .Zeta(zeta1),
        .A_NTT(A_NTT1),     .B_NTT(B_NTT1),     .A_iNTT(A_iNTT1),   .B_iNTT(B_iNTT1)
    );

    BU #(.DATA_WIDTH(DATA_WIDTH)) BU2 (
        .clk_i(clk_i),  .rst_i(rst_i),  .is_NTT(is_NTT_BU_choose),
        .A({1'b0, in_BU2}),     .B({1'b0,inBU2_B}),     .Zeta(zeta2),
        .A_NTT(A_NTT2),     .B_NTT(B_NTT2),     .A_iNTT(A_iNTT2),   .B_iNTT(B_iNTT2)
    );

    BU #(.DATA_WIDTH(DATA_WIDTH)) BU3 (
        .clk_i(clk_i),  .rst_i(rst_i),  .is_NTT(is_NTT_BU_choose),
        .A({1'b0, in_BU3}),     .B({1'b0,inBU3_B}),     .Zeta(zeta3),
        .A_NTT(A_NTT3),     .B_NTT(B_NTT3),     .A_iNTT(A_iNTT3),   .B_iNTT(B_iNTT3)
    );

    BU #(.DATA_WIDTH(DATA_WIDTH)) BU4 (
        .clk_i(clk_i),  .rst_i(rst_i),  .is_NTT(is_NTT_BU_choose),
        .A({1'b0, in_BU4}),     .B({1'b0,inBU4_B}),     .Zeta(zeta4),
        .A_NTT(A_NTT4),     .B_NTT(B_NTT4),     .A_iNTT(A_iNTT4),   .B_iNTT(B_iNTT4)
    );

    BU #(.DATA_WIDTH(DATA_WIDTH)) BU5 (
        .clk_i(clk_i),  .rst_i(rst_i),  .is_NTT(is_NTT_BU_choose),
        .A({1'b0, in_BU5}),     .B({1'b0,inBU5_B}),     .Zeta(zeta5),
        .A_NTT(A_NTT5),     .B_NTT(B_NTT5),     .A_iNTT(A_iNTT5),   .B_iNTT(B_iNTT5)
    );

    BU #(.DATA_WIDTH(DATA_WIDTH)) BU6 (
        .clk_i(clk_i),  .rst_i(rst_i),  .is_NTT(is_NTT_BU_choose),
        .A({1'b0, in_BU6}),     .B({1'b0,inBU6_B}),     .Zeta(zeta6),
        .A_NTT(A_NTT6),     .B_NTT(B_NTT6),     .A_iNTT(A_iNTT6),   .B_iNTT(B_iNTT6)
    );

    BU #(.DATA_WIDTH(DATA_WIDTH)) BU7 (
        .clk_i(clk_i),  .rst_i(rst_i),  .is_NTT(is_NTT_BU_choose),
        .A({1'b0, in_BU7}),     .B({1'b0,inBU7_B}),     .Zeta(zeta7),
        .A_NTT(A_NTT7),     .B_NTT(B_NTT7),     .A_iNTT(A_iNTT7),   .B_iNTT(B_iNTT7)
    );
endmodule








