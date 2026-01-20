module NTT_TOP #(
    parameter DATA_WIDTH = 12,
    parameter ADDR_WIDTH = 5,
    parameter INPUT_WIDTH = 192,
    parameter BU_LATE = 7,
    parameter MAX_CAL = 8,
    parameter WRITE_BACK_LATE = 2,
    parameter DELAY_ADDR_WRITE = 7,
    parameter BU_DATA_WIDTH = 13
)(
    input logic                     clk_i,
    input logic                     rst_i,
    input logic                     start,
    input logic                     is_NTT,
    input logic                     valid_input,
    input logic [INPUT_WIDTH-1:0]   din,
    
    output logic                    done_all,
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

    // Controller signals
    logic [DATA_WIDTH-1:0]  din_load_a, din_load_b;
    logic [ADDR_WIDTH-1:0]  addr_load_a, addr_load_b;
    logic                   start_decode;
    logic                   start_BU_choose;
    logic                   start_BRAM_chain;
    logic                   start_BRAM_load;
    logic                   start_BRAM_write;
    logic                   is_NTT_decode;
    logic                   is_NTT_BU_choose;
    logic                   is_NTT_output;
    logic                   is_NTT_load;
    logic [7:0]             we;

    // Address decoder signals
    logic [ADDR_WIDTH-1:0]  addr_out0, addr_out1, addr_out2, addr_out3;
    logic [ADDR_WIDTH-1:0]  addr_out4, addr_out5, addr_out6, addr_out7;
    logic [ADDR_WIDTH-1:0]  addr_out0B, addr_out1B, addr_out2B, addr_out3B;
    logic [ADDR_WIDTH-1:0]  addr_out4B, addr_out5B, addr_out6B, addr_out7B;
    logic [7:0]             len_BU;
    logic                   done_gen_addr;

    // BU output signals
    logic [DATA_WIDTH-1:0]  A_NTT0, A_NTT1, A_NTT2, A_NTT3, A_NTT4, A_NTT5, A_NTT6, A_NTT7;
    logic [DATA_WIDTH-1:0]  A_iNTT0, A_iNTT1, A_iNTT2, A_iNTT3, A_iNTT4, A_iNTT5, A_iNTT6, A_iNTT7;
    logic [DATA_WIDTH-1:0]  B_NTT0, B_NTT1, B_NTT2, B_NTT3, B_NTT4, B_NTT5, B_NTT6, B_NTT7;
    logic [DATA_WIDTH-1:0]  B_iNTT0, B_iNTT1, B_iNTT2, B_iNTT3, B_iNTT4, B_iNTT5, B_iNTT6, B_iNTT7;

    // BU write-back data selection
    logic [DATA_WIDTH-1:0]  data_in0, data_in1, data_in2, data_in3;
    logic [DATA_WIDTH-1:0]  data_in4, data_in5, data_in6, data_in7;
    logic [DATA_WIDTH-1:0]  data_in0B, data_in1B, data_in2B, data_in3B;
    logic [DATA_WIDTH-1:0]  data_in4B, data_in5B, data_in6B, data_in7B;

    // Select NTT or iNTT output
    always_comb begin
        if (is_NTT_output) begin
            // NTT mode
            data_in0  = A_NTT0;
            data_in1  = A_NTT1;
            data_in2  = A_NTT2;
            data_in3  = A_NTT3;
            data_in4  = A_NTT4;
            data_in5  = A_NTT5;
            data_in6  = A_NTT6;
            data_in7  = A_NTT7;
            data_in0B = B_NTT0;
            data_in1B = B_NTT1;
            data_in2B = B_NTT2;
            data_in3B = B_NTT3;
            data_in4B = B_NTT4;
            data_in5B = B_NTT5;
            data_in6B = B_NTT6;
            data_in7B = B_NTT7;
        end else begin
            // iNTT mode
            data_in0  = A_iNTT0;
            data_in1  = A_iNTT1;
            data_in2  = A_iNTT2;
            data_in3  = A_iNTT3;
            data_in4  = A_iNTT4;
            data_in5  = A_iNTT5;
            data_in6  = A_iNTT6;
            data_in7  = A_iNTT7;
            data_in0B = B_iNTT0;
            data_in1B = B_iNTT1;
            data_in2B = B_iNTT2;
            data_in3B = B_iNTT3;
            data_in4B = B_iNTT4;
            data_in5B = B_iNTT5;
            data_in6B = B_iNTT6;
            data_in7B = B_iNTT7;
        end
    end

    //========================================
    // Controller Instance
    //========================================
    Controller_NTT #(
        .DATA_WIDTH         (DATA_WIDTH),
        .ADDR_WIDTH         (ADDR_WIDTH),
        .INPUT_WIDTH        (INPUT_WIDTH),
        .BU_LATE            (BU_LATE),
        .MAX_CAL            (MAX_CAL),
        .WRITE_BACK_LATE    (WRITE_BACK_LATE)
    ) controller_inst (
        .clk_i              (clk_i),
        .rst_i              (rst_i),
        .start              (start),
        .done_gen_addr      (done_gen_addr),
        .is_NTT             (is_NTT),
        .valid_input        (valid_input),
        .din                (din),
        .din_load_a         (din_load_a),
        .din_load_b         (din_load_b),
        .addr_load_a        (addr_load_a),
        .addr_load_b        (addr_load_b),
        .start_decode       (start_decode),
        .start_BU_choose    (start_BU_choose),
        .start_BRAM_chain   (start_BRAM_chain),
        .start_BRAM_load    (start_BRAM_load),
        .start_BRAM_write   (start_BRAM_write),
        .is_NTT_decode      (is_NTT_decode),
        .is_NTT_BU_choose   (is_NTT_BU_choose),
        .is_NTT_output      (is_NTT_output),
        .is_NTT_load        (is_NTT_load),
        .we                 (we),
        .done_all           (done_all)
    );

    //========================================
    // Address Decoder Instance
    //========================================
    bram_decode_read #(
        .DATA_WIDTH         (DATA_WIDTH),
        .ADW                (ADDR_WIDTH)
    ) addr_decoder_inst (
        .clk_i              (clk_i),
        .rst_i              (rst_i),
        .start_decode       (start_decode),
        .is_NTT_decode      (is_NTT_decode),
        .addr_out0          (addr_out0),
        .addr_out1          (addr_out1),
        .addr_out2          (addr_out2),
        .addr_out3          (addr_out3),
        .addr_out4          (addr_out4),
        .addr_out5          (addr_out5),
        .addr_out6          (addr_out6),
        .addr_out7          (addr_out7),
        .addr_out_0B        (addr_out0B),
        .addr_out_1B        (addr_out1B),
        .addr_out_2B        (addr_out2B),
        .addr_out_3B        (addr_out3B),
        .addr_out_4B        (addr_out4B),
        .addr_out_5B        (addr_out5B),
        .addr_out_6B        (addr_out6B),
        .addr_out_7B        (addr_out7B),
        .olen               (len_BU),
        .done_decode        (done_gen_addr)
    );

    //========================================
    // BRAM Chain Instance
    //========================================
    BRAM_chain #(
        .DATA_WIDTH         (DATA_WIDTH),
        .INPUT_WIDTH        (DATA_WIDTH * 16),
        .ADDR_WIDTH         (ADDR_WIDTH),
        .DELAY_ADDR_WRITE   (DELAY_ADDR_WRITE)
    ) bram_chain_inst (
        .clk_i              (clk_i),
        .rst_i              (rst_i),
        .start_BRAM_chain   (start_BRAM_chain),
        .start_BRAM_load    (start_BRAM_load),
        .start_BRAM_write   (start_BRAM_write),
        .we                 (we),
        .data_load_a        (din_load_a),
        .data_load_b        (din_load_b),
        .addr_load_a        (addr_load_a),
        .addr_load_b        (addr_load_b),
        .data_in0           (data_in0),
        .data_in1           (data_in1),
        .data_in2           (data_in2),
        .data_in3           (data_in3),
        .data_in4           (data_in4),
        .data_in5           (data_in5),
        .data_in6           (data_in6),
        .data_in7           (data_in7),
        .data_in0B          (data_in0B),
        .data_in1B          (data_in1B),
        .data_in2B          (data_in2B),
        .data_in3B          (data_in3B),
        .data_in4B          (data_in4B),
        .data_in5B          (data_in5B),
        .data_in6B          (data_in6B),
        .data_in7B          (data_in7B),
        .addr_out0          (addr_out0),
        .addr_out1          (addr_out1),
        .addr_out2          (addr_out2),
        .addr_out3          (addr_out3),
        .addr_out4          (addr_out4),
        .addr_out5          (addr_out5),
        .addr_out6          (addr_out6),
        .addr_out7          (addr_out7),
        .addr_out0B         (addr_out0B),
        .addr_out1B         (addr_out1B),
        .addr_out2B         (addr_out2B),
        .addr_out3B         (addr_out3B),
        .addr_out4B         (addr_out4B),
        .addr_out5B         (addr_out5B),
        .addr_out6B         (addr_out6B),
        .addr_out7B         (addr_out7B),
        .data_bram0         (data_bram0),
        .data_bram1         (data_bram1),
        .data_bram2         (data_bram2),
        .data_bram3         (data_bram3),
        .data_bram4         (data_bram4),
        .data_bram5         (data_bram5),
        .data_bram6         (data_bram6),
        .data_bram7         (data_bram7),
        .data_bram0B        (data_bram0B),
        .data_bram1B        (data_bram1B),
        .data_bram2B        (data_bram2B),
        .data_bram3B        (data_bram3B),
        .data_bram4B        (data_bram4B),
        .data_bram5B        (data_bram5B),
        .data_bram6B        (data_bram6B),
        .data_bram7B        (data_bram7B)
    );

    //========================================
    // BU Choose Instance
    //========================================
    BU_chose #(
        .DATA_WIDTH         (BU_DATA_WIDTH)
    ) bu_choose_inst (
        .clk_i              (clk_i),
        .rst_i              (rst_i),
        .len_BU             (len_BU),
        .start_BU_choose    (start_BU_choose),
        .is_NTT_BU_choose   (is_NTT_BU_choose),
        .data_bram0         (data_bram0),
        .data_bram1         (data_bram1),
        .data_bram2         (data_bram2),
        .data_bram3         (data_bram3),
        .data_bram4         (data_bram4),
        .data_bram5         (data_bram5),
        .data_bram6         (data_bram6),
        .data_bram7         (data_bram7),
        .data_bram0B        (data_bram0B),
        .data_bram1B        (data_bram1B),
        .data_bram2B        (data_bram2B),
        .data_bram3B        (data_bram3B),
        .data_bram4B        (data_bram4B),
        .data_bram5B        (data_bram5B),
        .data_bram6B        (data_bram6B),
        .data_bram7B        (data_bram7B),
        .A_NTT0             (A_NTT0),
        .A_NTT1             (A_NTT1),
        .A_NTT2             (A_NTT2),
        .A_NTT3             (A_NTT3),
        .A_NTT4             (A_NTT4),
        .A_NTT5             (A_NTT5),
        .A_NTT6             (A_NTT6),
        .A_NTT7             (A_NTT7),
        .A_iNTT0            (A_iNTT0),
        .A_iNTT1            (A_iNTT1),
        .A_iNTT2            (A_iNTT2),
        .A_iNTT3            (A_iNTT3),
        .A_iNTT4            (A_iNTT4),
        .A_iNTT5            (A_iNTT5),
        .A_iNTT6            (A_iNTT6),
        .A_iNTT7            (A_iNTT7),
        .B_NTT0             (B_NTT0),
        .B_NTT1             (B_NTT1),
        .B_NTT2             (B_NTT2),
        .B_NTT3             (B_NTT3),
        .B_NTT4             (B_NTT4),
        .B_NTT5             (B_NTT5),
        .B_NTT6             (B_NTT6),
        .B_NTT7             (B_NTT7),
        .B_iNTT0            (B_iNTT0),
        .B_iNTT1            (B_iNTT1),
        .B_iNTT2            (B_iNTT2),
        .B_iNTT3            (B_iNTT3),
        .B_iNTT4            (B_iNTT4),
        .B_iNTT5            (B_iNTT5),
        .B_iNTT6            (B_iNTT6),
        .B_iNTT7            (B_iNTT7)
    );

endmodule