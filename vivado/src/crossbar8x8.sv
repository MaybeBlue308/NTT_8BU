module crossbar_8x8 #(
    parameter ADW = 5
)(
    input logic [ADW-1:0] addr_in0,
    input logic [ADW-1:0] addr_in1,
    input logic [ADW-1:0] addr_in2,
    input logic [ADW-1:0] addr_in3,
    input logic [ADW-1:0] addr_in4,
    input logic [ADW-1:0] addr_in5,
    input logic [ADW-1:0] addr_in6,
    input logic [ADW-1:0] addr_in7,
    input logic [ADW-1:0] addr_in0B,
    input logic [ADW-1:0] addr_in1B,
    input logic [ADW-1:0] addr_in2B,
    input logic [ADW-1:0] addr_in3B,
    input logic [ADW-1:0] addr_in4B,
    input logic [ADW-1:0] addr_in5B,
    input logic [ADW-1:0] addr_in6B,
    input logic [ADW-1:0] addr_in7B,
    input logic [2:0] index0,
    input logic [2:0] index1,
    input logic [2:0] index2,
    input logic [2:0] index3,
    input logic [2:0] index4,
    input logic [2:0] index5,
    input logic [2:0] index6,
    input logic [2:0] index7,
    input logic [2:0] index0_B,
    input logic [2:0] index1_B,
    input logic [2:0] index2_B,
    input logic [2:0] index3_B,
    input logic [2:0] index4_B,
    input logic [2:0] index5_B,
    input logic [2:0] index6_B,
    input logic [2:0] index7_B,

    output logic [ADW-1:0] addr_out0,
    output logic [ADW-1:0] addr_out1,
    output logic [ADW-1:0] addr_out2,
    output logic [ADW-1:0] addr_out3,
    output logic [ADW-1:0] addr_out4,
    output logic [ADW-1:0] addr_out5,
    output logic [ADW-1:0] addr_out6,
    output logic [ADW-1:0] addr_out7,
    output logic [ADW-1:0] addr_out0B,
    output logic [ADW-1:0] addr_out1B,
    output logic [ADW-1:0] addr_out2B,
    output logic [ADW-1:0] addr_out3B,
    output logic [ADW-1:0] addr_out4B,
    output logic [ADW-1:0] addr_out5B,
    output logic [ADW-1:0] addr_out6B,
    output logic [ADW-1:0] addr_out7B
);
    // each output is 1 mux 8:1
/////////////////BRAM0////////////////////
    always_comb begin
        case (index0)
        3'd0: addr_out0 = addr_in0;
        3'd1: addr_out0 = addr_in1;
        3'd2: addr_out0 = addr_in2;
        3'd3: addr_out0 = addr_in3;
        3'd4: addr_out0 = addr_in4;
        3'd5: addr_out0 = addr_in5;
        3'd6: addr_out0 = addr_in6;
        3'd7: addr_out0 = addr_in7;
        endcase
    end
    /////////////////BRAM1////////////////////
    always_comb begin
        case (index1)
        3'd0: addr_out1 = addr_in0;
        3'd1: addr_out1 = addr_in1;
        3'd2: addr_out1 = addr_in2;
        3'd3: addr_out1 = addr_in3;
        3'd4: addr_out1 = addr_in4;
        3'd5: addr_out1 = addr_in5;
        3'd6: addr_out1 = addr_in6;
        3'd7: addr_out1 = addr_in7;
        endcase
    end
    /////////////////BRAM2////////////////////
        always_comb begin
        case (index2)
        3'd0: addr_out2 = addr_in0;
        3'd1: addr_out2 = addr_in1;
        3'd2: addr_out2 = addr_in2;
        3'd3: addr_out2 = addr_in3;
        3'd4: addr_out2 = addr_in4;
        3'd5: addr_out2 = addr_in5;
        3'd6: addr_out2 = addr_in6;
        3'd7: addr_out2 = addr_in7;
        endcase
    end
    /////////////////BRAM3////////////////////
        always_comb begin
        case (index3)
        3'd0: addr_out3 = addr_in0;
        3'd1: addr_out3 = addr_in1;
        3'd2: addr_out3 = addr_in2;
        3'd3: addr_out3 = addr_in3;
        3'd4: addr_out3 = addr_in4;
        3'd5: addr_out3 = addr_in5;
        3'd6: addr_out3 = addr_in6;
        3'd7: addr_out3 = addr_in7;
        endcase
    end
    /////////////////BRAM4////////////////////
        always_comb begin
        case (index4)
        3'd0: addr_out4 = addr_in0;
        3'd1: addr_out4 = addr_in1;
        3'd2: addr_out4 = addr_in2;
        3'd3: addr_out4 = addr_in3;
        3'd4: addr_out4 = addr_in4;
        3'd5: addr_out4 = addr_in5;
        3'd6: addr_out4 = addr_in6;
        3'd7: addr_out4 = addr_in7;
        endcase
    end
    /////////////////BRAM5////////////////////
        always_comb begin
        case (index5)
        3'd0: addr_out5 = addr_in0;
        3'd1: addr_out5 = addr_in1;
        3'd2: addr_out5 = addr_in2;
        3'd3: addr_out5 = addr_in3;
        3'd4: addr_out5 = addr_in4;
        3'd5: addr_out5 = addr_in5;
        3'd6: addr_out5 = addr_in6;
        3'd7: addr_out5 = addr_in7;
        endcase
    end
    /////////////////BRAM6////////////////////
        always_comb begin
        case (index6)
        3'd0: addr_out6 = addr_in0;
        3'd1: addr_out6 = addr_in1;
        3'd2: addr_out6 = addr_in2;
        3'd3: addr_out6 = addr_in3;
        3'd4: addr_out6 = addr_in4;
        3'd5: addr_out6 = addr_in5;
        3'd6: addr_out6 = addr_in6;
        3'd7: addr_out6 = addr_in7;
        endcase
    end
    /////////////////BRAM7////////////////////
        always_comb begin
        case (index7)
        3'd0: addr_out7 = addr_in0;
        3'd1: addr_out7 = addr_in1;
        3'd2: addr_out7 = addr_in2;
        3'd3: addr_out7 = addr_in3;
        3'd4: addr_out7 = addr_in4;
        3'd5: addr_out7 = addr_in5;
        3'd6: addr_out7 = addr_in6;
        3'd7: addr_out7 = addr_in7;
        endcase
    end

    /////////////////BRAM0////////////////////
    always_comb begin
        case (index0_B)
        3'd0: addr_out0B = addr_in0B;
        3'd1: addr_out0B = addr_in1B;
        3'd2: addr_out0B = addr_in2B;
        3'd3: addr_out0B = addr_in3B;
        3'd4: addr_out0B = addr_in4B;
        3'd5: addr_out0B = addr_in5B;
        3'd6: addr_out0B = addr_in6B;
        3'd7: addr_out0B = addr_in7B;
        endcase
    end
    /////////////////BRAM1////////////////////
    always_comb begin
        case (index1_B)
        3'd0: addr_out1B = addr_in0B;
        3'd1: addr_out1B = addr_in1B;
        3'd2: addr_out1B = addr_in2B;
        3'd3: addr_out1B = addr_in3B;
        3'd4: addr_out1B = addr_in4B;
        3'd5: addr_out1B = addr_in5B;
        3'd6: addr_out1B = addr_in6B;
        3'd7: addr_out1B = addr_in7B;
        endcase
    end
    /////////////////BRAM2////////////////////
        always_comb begin
        case (index2_B)
        3'd0: addr_out2B = addr_in0B;
        3'd1: addr_out2B = addr_in1B;
        3'd2: addr_out2B = addr_in2B;
        3'd3: addr_out2B = addr_in3B;
        3'd4: addr_out2B = addr_in4B;
        3'd5: addr_out2B = addr_in5B;
        3'd6: addr_out2B = addr_in6B;
        3'd7: addr_out2B = addr_in7B;
        endcase
    end
    /////////////////BRAM3////////////////////
        always_comb begin
        case (index3_B)
        3'd0: addr_out3B = addr_in0B;
        3'd1: addr_out3B = addr_in1B;
        3'd2: addr_out3B = addr_in2B;
        3'd3: addr_out3B = addr_in3B;
        3'd4: addr_out3B = addr_in4B;
        3'd5: addr_out3B = addr_in5B;
        3'd6: addr_out3B = addr_in6B;
        3'd7: addr_out3B = addr_in7B;
        endcase
    end
    /////////////////BRAM4////////////////////
        always_comb begin
        case (index4_B)
        3'd0: addr_out4B = addr_in0B;
        3'd1: addr_out4B = addr_in1B;
        3'd2: addr_out4B = addr_in2B;
        3'd3: addr_out4B = addr_in3B;
        3'd4: addr_out4B = addr_in4B;
        3'd5: addr_out4B = addr_in5B;
        3'd6: addr_out4B = addr_in6B;
        3'd7: addr_out4B = addr_in7B;
        endcase
    end
    /////////////////BRAM5////////////////////
        always_comb begin
        case (index5_B)
        3'd0: addr_out5B = addr_in0B;
        3'd1: addr_out5B = addr_in1B;
        3'd2: addr_out5B = addr_in2B;
        3'd3: addr_out5B = addr_in3B;
        3'd4: addr_out5B = addr_in4B;
        3'd5: addr_out5B = addr_in5B;
        3'd6: addr_out5B = addr_in6B;
        3'd7: addr_out5B = addr_in7B;
        endcase
    end
    /////////////////BRAM6////////////////////
        always_comb begin
        case (index6_B)
        3'd0: addr_out6B = addr_in0B;
        3'd1: addr_out6B = addr_in1B;
        3'd2: addr_out6B = addr_in2B;
        3'd3: addr_out6B = addr_in3B;
        3'd4: addr_out6B = addr_in4B;
        3'd5: addr_out6B = addr_in5B;
        3'd6: addr_out6B = addr_in6B;
        3'd7: addr_out6B = addr_in7B;
        endcase
    end
    /////////////////BRAM7////////////////////
        always_comb begin
        case (index7_B)
            3'd0: addr_out7B = addr_in0B;
            3'd1: addr_out7B = addr_in1B;
            3'd2: addr_out7B = addr_in2B;
            3'd3: addr_out7B = addr_in3B;
            3'd4: addr_out7B = addr_in4B;
            3'd5: addr_out7B = addr_in5B;
            3'd6: addr_out7B = addr_in6B;
            3'd7: addr_out7B = addr_in7B;
        endcase
    end

endmodule


