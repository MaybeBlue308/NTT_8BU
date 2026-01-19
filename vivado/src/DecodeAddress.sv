module DecodeAddress #(
    parameter int ADDR_WIDTH = 8 // Tăng lên 8-bit để chứa được giá trị 224
)(
    input logic [7:0] len,
    output logic [ADDR_WIDTH-1:0] addr_core0,
    output logic [ADDR_WIDTH-1:0] addr_core1,
    output logic [ADDR_WIDTH-1:0] addr_core2,
    output logic [ADDR_WIDTH-1:0] addr_core3,
    output logic [ADDR_WIDTH-1:0] addr_core4,
    output logic [ADDR_WIDTH-1:0] addr_core5,
    output logic [ADDR_WIDTH-1:0] addr_core6,
    output logic [ADDR_WIDTH-1:0] addr_core7
);
    always_comb begin
        // Gán giá trị mặc định để tránh tạo Latch
        addr_core0 = '0;
        addr_core1 = '0; addr_core2 = '0; addr_core3 = '0;
        addr_core4 = '0; addr_core5 = '0; addr_core6 = '0; addr_core7 = '0;
        unique case (len)
            8'd2, 8'd4, 8'd8, 8'd16: begin
                addr_core1 = 8'd32; addr_core2 = 8'd64; addr_core3 = 8'd96;
                addr_core4 = 8'd128; addr_core5 = 8'd160; addr_core6 = 8'd192;
                addr_core7 = 8'd224;
            end
            8'd32: begin
                addr_core1 = 8'd16; addr_core2 = 8'd64; addr_core3 = 8'd80;
                addr_core4 = 8'd128; addr_core5 = 8'd144; addr_core6 = 8'd192;
                addr_core7 = 8'd208;
            end
            8'd64: begin
                addr_core1 = 8'd16; addr_core2 = 8'd32; addr_core3 = 8'd48;
                addr_core4 = 8'd128; addr_core5 = 8'd144; addr_core6 = 8'd160;
                addr_core7 = 8'd176;
            end
            8'd128: begin
                addr_core1 = 8'd16; addr_core2 = 8'd32; addr_core3 = 8'd48;
                addr_core4 = 8'd64; addr_core5 = 8'd80; addr_core6 = 8'd96;
                addr_core7 = 8'd112;
            end
            default: ; // Đã có gán mặc định ở trên
        endcase
    end
endmodule
