
module bram_decode_read #(
    parameter DATA_WIDTH = 12,
    parameter ADW = 5
    )(
    //Ports
    input  logic            clk_i,
    input  logic            rst_i,
    input  logic            start_decode,
    input  logic            is_NTT_decode,

    output logic [ADW-1:0]  addr_out0,
    output logic [ADW-1:0]  addr_out1,
    output logic [ADW-1:0]  addr_out2,
    output logic [ADW-1:0]  addr_out3,
    output logic [ADW-1:0]  addr_out4,
    output logic [ADW-1:0]  addr_out5,
    output logic [ADW-1:0]  addr_out6,
    output logic [ADW-1:0]  addr_out7,
    output logic [ADW-1:0]  addr_out0B,
    output logic [ADW-1:0]  addr_out1B,
    output logic [ADW-1:0]  addr_out2B,
    output logic [ADW-1:0]  addr_out3B,
    output logic [ADW-1:0]  addr_out4B,
    output logic [ADW-1:0]  addr_out5B,
    output logic [ADW-1:0]  addr_out6B,
    output logic [ADW-1:0]  addr_out7B,

    output logic [7:0]      olen,
    output logic            done_decode
);

    logic [7:0] addr_core0, addr_core1, addr_core2, addr_core3, addr_core4, addr_core5, addr_core6, addr_core7; 
    logic [6:0] addr_zeta0, addr_zeta1, addr_zeta2, addr_zeta3, addr_zeta4, addr_zeta5, addr_zeta6, addr_zeta7;
    logic done;
    GenAddress # (
    .ADDR_WIDTH(8),
    .ADDR_ZETA(7)
    )
    GenAddress_inst (
        .clk_i          (clk_i),
        .rst_i          (rst_i),
        .start_decode   (start_decode),
        .is_NTT         (is_NTT),
        .addr_core0     (addr_core0),
        .addr_core1     (addr_core1),
        .addr_core2     (addr_core2),
        .addr_core3     (addr_core3),
        .addr_core4     (addr_core4),
        .addr_core5     (addr_core5),
        .addr_core6     (addr_core6),
        .addr_core7     (addr_core7),
        .olen           (olen),
        .addr_zeta0     (addr_zeta0),
        .addr_zeta1     (addr_zeta1),
        .addr_zeta2     (addr_zeta2),
        .addr_zeta3     (addr_zeta3),
        .addr_zeta4     (addr_zeta4),
        .addr_zeta5     (addr_zeta5),
        .addr_zeta6     (addr_zeta6),
        .addr_zeta7     (addr_zeta7),
        .done_o         (done)
    );

    logic [7:0] addr_core0_B, addr_core1_B, addr_core2_B, addr_core3_B, addr_core4_B, addr_core5_B, addr_core6_B, addr_core7_B; 
    logic [4:0] addr_bram0, addr_bram1, addr_bram2, addr_bram3, addr_bram4, addr_bram5, addr_bram6, addr_bram7;         //addr_bram0: in__BU0 port A
    logic [4:0] addr_bram0_B, addr_bram1_B, addr_bram2_B, addr_bram3_B, addr_bram4_B, addr_bram5_B, addr_bram6_B, addr_bram7_B; //addr_bram0_B: in__BU0 port _B
    logic [2:0] index0, index1, index2, index3, index4, index5, index6, index7;
    logic [2:0] index0_B, index1_B, index2_B, index3_B, index4_B, index5_B, index6_B, index7_B;

    //////////////////////Decode Address////////////////////////

    always_comb begin
        addr_core0_B = addr_core0 + olen; 
        addr_core1_B = addr_core1 + olen;
        addr_core2_B = addr_core2 + olen;
        addr_core3_B = addr_core3 + olen;
        addr_core4_B = addr_core4 + olen;
        addr_core5_B = addr_core5 + olen;
        addr_core6_B = addr_core6 + olen;
        addr_core7_B = addr_core7 + olen;
    end

    always_comb begin
        // ---------------- ADDR 0 ----------------
        case (addr_core0[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index0     = addr_core0[7:5];
                addr_bram0 = addr_core0[4:0];
            end
            default: begin
                index0     = 3'd0;
                addr_bram0 = 5'd0;
            end
        endcase
        // ---------------- ADDR 1 ----------------
        case (addr_core1[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index1     = addr_core1[7:5];
                addr_bram1 = addr_core1[4:0];
            end
            default: begin
                index1     = 3'd0;
                addr_bram1 = 5'd0;
            end
        endcase
        // ---------------- ADDR 2 ----------------
        case (addr_core2[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index2     = addr_core2[7:5];
                addr_bram2 = addr_core2[4:0];
            end
            default: begin
                index2     = 3'd0;
                addr_bram2 = 5'd0;
            end
        endcase
        // ---------------- ADDR 3 ----------------
        case (addr_core3[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index3     = addr_core3[7:5];
                addr_bram3 = addr_core3[4:0];
            end
            default: begin
                index3     = 3'd0;
                addr_bram3 = 5'd0;
            end
        endcase
        // ---------------- ADDR 4 ----------------
        case (addr_core4[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index4     = addr_core4[7:5];
                addr_bram4 = addr_core4[4:0];
            end
            default: begin
                index4     = 3'd0;
                addr_bram4 = 5'd0;
            end
        endcase
        // ---------------- ADDR 5 ----------------
        case (addr_core5[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index5     = addr_core5[7:5];
                addr_bram5 = addr_core5[4:0];
            end
            default: begin
                index5     = 3'd0;
                addr_bram5 = 5'd0;
            end
        endcase
        // ---------------- ADDR 6 ----------------
        case (addr_core6[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index6     = addr_core6[7:5];
                addr_bram6 = addr_core6[4:0];
            end
            default: begin
                index6     = 3'd0;
                addr_bram6 = 5'd0;
            end
        endcase
        // ---------------- ADDR 7 ----------------
        case (addr_core7[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index7     = addr_core7[7:5];
                addr_bram7 = addr_core7[4:0];
            end
            default: begin
                index7     = 3'd0;
                addr_bram7 = 5'd0;
            end
        endcase
    end

    always_comb begin
        // ---------------- ADDR 0 ----------------
        case (addr_core0_B[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index0_B     = addr_core0_B[7:5];
                addr_bram0_B = addr_core0_B[4:0];
            end
            default: begin
                index0_B     = 3'd0;
                addr_bram0_B = 5'd0;
            end
        endcase
        // ---------------- ADDR 1 ----------------
        case (addr_core1_B[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index1_B     = addr_core1_B[7:5];
                addr_bram1_B = addr_core1_B[4:0];
            end
            default: begin
                index1_B     = 3'd0;
                addr_bram1_B = 5'd0;
            end
        endcase
        // ---------------- ADDR 2 ----------------
        case (addr_core2_B[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index2_B     = addr_core2_B[7:5];
                addr_bram2_B = addr_core2_B[4:0];
            end
            default: begin
                index2_B     = 3'd0;
                addr_bram2_B = 5'd0;
            end
        endcase
        // ---------------- ADDR 3 ----------------
        case (addr_core3_B[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index3_B     = addr_core3_B[7:5];
                addr_bram3_B = addr_core3_B[4:0];
            end
            default: begin
                index3_B     = 3'd0;
                addr_bram3_B = 5'd0;
            end
        endcase
        // ---------------- ADDR 4 ----------------
        case (addr_core4_B[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index4_B     = addr_core4_B[7:5];
                addr_bram4_B = addr_core4_B[4:0];
            end
            default: begin
                index4_B     = 3'd0;
                addr_bram4_B = 5'd0;
            end
        endcase
        // ---------------- ADDR 5 ----------------
        case (addr_core5_B[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index5_B     = addr_core5_B[7:5];
                addr_bram5_B = addr_core5_B[4:0];
            end
            default: begin
                index5_B     = 3'd0;
                addr_bram5_B = 5'd0;
            end
        endcase
        // ---------------- ADDR 6 ----------------
        case (addr_core6_B[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index6_B     = addr_core6_B[7:5];
                addr_bram6_B = addr_core6_B[4:0];
            end
            default: begin
                index6_B     = 3'd0;
                addr_bram6_B = 5'd0;
            end
        endcase
        // ---------------- ADDR 7 ----------------
        case (addr_core7_B[7:5])
            3'd0,3'd1,3'd2,3'd3,
            3'd4,3'd5,3'd6,3'd7: begin
                index7_B     = addr_core7_B[7:5];
                addr_bram7_B = addr_core7_B[4:0];
            end
            default: begin
                index7_B     = 3'd0;
                addr_bram7_B = 5'd0;
            end
        endcase
    end

    crossbar_8x8 #(
    .ADW (5)
    )
    crossbar_8x8_inst (
        .addr_in0         (addr_bram0),        
        .addr_in1         (addr_bram1),
        .addr_in2         (addr_bram2),
        .addr_in3         (addr_bram3),
        .addr_in4         (addr_bram4),
        .addr_in5         (addr_bram5),
        .addr_in6         (addr_bram6),  
        .addr_in7         (addr_bram7),
        .addr_in0B        (addr_bram0_B),
        .addr_in1B        (addr_bram1_B),
        .addr_in2B        (addr_bram2_B),
        .addr_in3B        (addr_bram3_B),
        .addr_in4B        (addr_bram4_B),
        .addr_in5B        (addr_bram5_B),
        .addr_in6B        (addr_bram6_B),
        .addr_in7B        (addr_bram7_B),
        .index0           (index0),
        .index1           (index1),
        .index2           (index2),
        .index3           (index3),
        .index4           (index4),
        .index5           (index5),
        .index6           (index6),
        .index7           (index7),
        .index0B          (index0B),
        .index1B          (index1B),
        .index2B          (index2B),
        .index3B          (index3B),
        .index4B          (index4B),
        .index5B          (index5B),
        .index6B          (index6B),
        .index7B          (index7B),
        .addr_out0        (addr_out0),        
        .addr_out1        (addr_out1),
        .addr_out2        (addr_out2),
        .addr_out3        (addr_out3),
        .addr_out4        (addr_out4),
        .addr_out5        (addr_out5),
        .addr_out6        (addr_out6),
        .addr_out7        (addr_out7),
        .addr_out0B       (addr_out0B),
        .addr_out1B       (addr_out1B),
        .addr_out2B       (addr_out2B),
        .addr_out3B       (addr_out3B),
        .addr_out4B       (addr_out4B),
        .addr_out5B       (addr_out5B),
        .addr_out6B       (addr_out6B),
        .addr_out7B       (addr_out7B),         
    );
    always_ff @(posedge clk_i) begin
        done_decode          <= done;
    end

endmodule

