module ZetaDecoder #(
parameter int ADDR_WIDTH = 7
)(
    input   logic [7:0] len,
    input   logic is_NTT
    output  logic [ADDR_WIDTH-1:0] addr_zeta0,
    output  logic [ADDR_WIDTH-1:0] addr_zeta1,
    output  logic [ADDR_WIDTH-1:0] addr_zeta2,
    output  logic [ADDR_WIDTH-1:0] addr_zeta3,
    output  logic [ADDR_WIDTH-1:0] addr_zeta4,
    output  logic [ADDR_WIDTH-1:0] addr_zeta5,
    output  logic [ADDR_WIDTH-1:0] addr_zeta6,
    output  logic [ADDR_WIDTH-1:0] addr_zeta7
);
    // Sử dụng always_comb cho logic tổ hợp
    always_comb begin
        // unique case giúp tối ưu mạch chọn và báo lỗi nếu thiếu trường hợp
        if (is_NTT) begin
            unique case (len)
                8'd128: begin
                    addr_zeta0 = 7'd1; addr_zeta1 = 7'd1; addr_zeta2 = 7'd1; addr_zeta3 = 7'd1;
                    addr_zeta4 = 7'd1; addr_zeta5 = 7'd1; addr_zeta6 = 7'd1; addr_zeta7 = 7'd1;
                end
                    8'd64: begin
                    addr_zeta0 = 7'd2; addr_zeta1 = 7'd2; addr_zeta2 = 7'd2; addr_zeta3 = 7'd2;
                    addr_zeta4 = 7'd3; addr_zeta5 = 7'd3; addr_zeta6 = 7'd3; addr_zeta7 = 7'd3;
                end
                8'd32: begin
                    addr_zeta0 = 7'd4; addr_zeta1 = 7'd4; addr_zeta2 = 7'd5; addr_zeta3 = 7'd5;
                    addr_zeta4 = 7'd6; addr_zeta5 = 7'd6; addr_zeta6 = 7'd7; addr_zeta7 = 7'd7;
                end
                8'd16: begin
                    addr_zeta0 = 7'd8; addr_zeta1 = 7'd9; addr_zeta2 = 7'd10; addr_zeta3 = 7'd11;
                    addr_zeta4 = 7'd12; addr_zeta5 = 7'd13; addr_zeta6 = 7'd14; addr_zeta7 = 7'd15;
                end
                8'd8: begin
                    addr_zeta0 = 7'd16; addr_zeta1 = 7'd18; addr_zeta2 = 7'd20; addr_zeta3 = 7'd22;
                    addr_zeta4 = 7'd24; addr_zeta5 = 7'd26; addr_zeta6 = 7'd28; addr_zeta7 = 7'd30;
                end
                8'd4: begin
                    addr_zeta0 = 7'd32; addr_zeta1 = 7'd36; addr_zeta2 = 7'd40; addr_zeta3 = 7'd44;
                    addr_zeta4 = 7'd48; addr_zeta5 = 7'd52; addr_zeta6 = 7'd56; addr_zeta7 = 7'd60;
                end
                8'd2: begin
                    addr_zeta0 = 7'd64; addr_zeta1 = 7'd72; addr_zeta2 = 7'd80; addr_zeta3 = 7'd88;
                    addr_zeta4 = 7'd96; addr_zeta5 = 7'd104;addr_zeta6 = 7'd112;addr_zeta7 = 7'd120;
                end
                default: begin
                // Tránh tạo ra chốt (latch) bằng cách gán giá trị mặc định
                    addr_zeta0 = '0; addr_zeta1 = '0; addr_zeta2 = '0; addr_zeta3 = '0;
                    addr_zeta4 = '0; addr_zeta5 = '0; addr_zeta6 = '0; addr_zeta7 = '0;
                end
            endcase
        end else begin
        unique case (len)
                8'd128: begin
                    addr_zeta0 = 7'd64; addr_zeta1 = 7'd72; addr_zeta2 = 7'd80; addr_zeta3 = 7'd88;
                    addr_zeta4 = 7'd96; addr_zeta5 = 7'd104;addr_zeta6 = 7'd112;addr_zeta7 = 7'd120;
                end
                    8'd64: begin
                    addr_zeta0 = 7'd32; addr_zeta1 = 7'd36; addr_zeta2 = 7'd40; addr_zeta3 = 7'd44;
                    addr_zeta4 = 7'd48; addr_zeta5 = 7'd52; addr_zeta6 = 7'd56; addr_zeta7 = 7'd60;
                end
                8'd32: begin
                    addr_zeta0 = 7'd16; addr_zeta1 = 7'd18; addr_zeta2 = 7'd20; addr_zeta3 = 7'd22;
                    addr_zeta4 = 7'd24; addr_zeta5 = 7'd26; addr_zeta6 = 7'd28; addr_zeta7 = 7'd30;
                end
                8'd16: begin
                    addr_zeta0 = 7'd8; addr_zeta1 = 7'd9; addr_zeta2 = 7'd10; addr_zeta3 = 7'd11;
                    addr_zeta4 = 7'd12; addr_zeta5 = 7'd13; addr_zeta6 = 7'd14; addr_zeta7 = 7'd15;
                end
                8'd8: begin
                    addr_zeta0 = 7'd4; addr_zeta1 = 7'd4; addr_zeta2 = 7'd5; addr_zeta3 = 7'd5;
                    addr_zeta4 = 7'd6; addr_zeta5 = 7'd6; addr_zeta6 = 7'd7; addr_zeta7 = 7'd7;
                end
                8'd4: begin
                    addr_zeta0 = 7'd2; addr_zeta1 = 7'd2; addr_zeta2 = 7'd2; addr_zeta3 = 7'd2;
                    addr_zeta4 = 7'd3; addr_zeta5 = 7'd3; addr_zeta6 = 7'd3; addr_zeta7 = 7'd3;
                end
                8'd2: begin
                    addr_zeta0 = 7'd1; addr_zeta1 = 7'd1; addr_zeta2 = 7'd1; addr_zeta3 = 7'd1;
                    addr_zeta4 = 7'd1; addr_zeta5 = 7'd1; addr_zeta6 = 7'd1; addr_zeta7 = 7'd1;
                end
                default: begin
                // Tránh tạo ra chốt (latch) bằng cách gán giá trị mặc định
                    addr_zeta0 = '0; addr_zeta1 = '0; addr_zeta2 = '0; addr_zeta3 = '0;
                    addr_zeta4 = '0; addr_zeta5 = '0; addr_zeta6 = '0; addr_zeta7 = '0;
                end
            endcase
        end
    end
endmodule
