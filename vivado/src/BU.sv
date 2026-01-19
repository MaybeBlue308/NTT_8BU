module BU #(
    parameter int DATA_WIDTH = 13
)(
    input   logic                       clk_i,
    input   logic                       rst_i, // Reset đồng bộ mức cao
    input   logic                       is_NTT,
    input   logic   [DATA_WIDTH-1:0]    A ,
    input   logic   [DATA_WIDTH-1:0]    B,
    input   logic   [DATA_WIDTH-2:0]    Zeta,
    output  logic   [DATA_WIDTH-2:0]    A_NTT,
    output  logic   [DATA_WIDTH-2:0]    B_NTT,
    output  logic   [DATA_WIDTH-2:0]    A_iNTT,
    output  logic   [DATA_WIDTH-2:0]    B_iNTT
);
    localparam logic [12:0] Q = 13'd3329;
    localparam int OUTW = DATA_WIDTH * 2;
    logic [DATA_WIDTH-1:0] chooseB, addAB, sub_res, add_res;
    logic [OUTW-1:0] oMul;
    logic [12:0] oBarretAdd, oBarretMul;
    // Pipeline Registers
    logic [DATA_WIDTH-1:0] RegA, RegB, RegZ;
    logic [DATA_WIDTH-1:0] hold_a [0:3];
    logic [DATA_WIDTH-1:0] reg_chooseB, reg_Z;
    logic [DATA_WIDTH-1:0] hold_add_0;
    logic [DATA_WIDTH-1:0] RegA_NTT_out, RegB_NTT_out, RegA_iNTT_out, RegB_iNTT_out;
    // 1. Giai đoạn Input
    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            RegA <= '0; 
            RegB <= '0; 
            RegZ <= '0;
        end else begin
            RegA <= A; 
            RegB <= B; 
            RegZ <= {1'b0, Zeta};
        end
    end
    // 2. Delay line cho A
    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            for (int i = 0; i < 4; i++) hold_a[i] <= '0;
        end else begin
            hold_a[0] <= RegA;
            hold_a[1] <= hold_a[0];
            hold_a[2] <= hold_a[1];
            hold_a[3] <= hold_a[2];
        end
    end
    // 3. Logic chọn đầu vào
    assign chooseB = (is_NTT) 
                    ? RegB 
                    : (   (RegB < RegA) 
                        ? (RegB + Q - RegA) 
                        : (RegB - RegA) );
                    
    assign addAB = (RegA + RegB >= Q) ? (RegA + RegB - Q) : (RegA + RegB);
    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            reg_chooseB <= '0; 
            reg_Z <= '0;
        end else begin
            reg_chooseB <= chooseB;
            reg_Z <= RegZ;
        end
    end
    // 4. Booth Multiplier Instance (Đã cập nhật reset đồng bộ)
    BoothMul_R8 #(
        .DATA_WIDTH(DATA_WIDTH)
    ) mul_inst (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .a(reg_chooseB),
        .b(reg_Z),
        .R(oMul)
    );
    // 5. Barrett Reduction (Lưu ý: Bạn cũng cần sửa module barret sang rst_i mức cao)
    Barret Barret_inst0(
        .clk_i(clk_i),
        .rst_i(rst_i), // Ở đây nối vào rst_i, nhưng hãy kiểm tra cực tính bên trong module Barret
        .C({ { (32-DATA_WIDTH){1'b0} }, addAB }),
        .R(oBarretAdd)
    );
    Barret Barret_inst1(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .C({ { (32-OUTW){oMul[OUTW-1]} }, oMul }),
        .R(oBarretMul)
    );
    // 6. Giai đoạn tính toán cuối cùng
    assign add_res = hold_a[3] + oBarretMul[DATA_WIDTH-1:0];
    assign sub_res =  (hold_a[3] < oBarretMul[DATA_WIDTH-1:0]) 
                    ? (hold_a[3] + Q - oBarretMul[DATA_WIDTH-1:0]) 
                    : (hold_a[3] - oBarretMul[DATA_WIDTH-1:0]);
    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            hold_add_0 <= '0;

            RegA_NTT_out <= '0; 
            RegB_NTT_out <= '0;

            RegA_iNTT_out <= '0; 
            RegB_iNTT_out <= '0;
        end else begin
            hold_add_0 <= oBarretAdd[DATA_WIDTH-1:0];
            RegA_NTT_out <= (add_res >= Q) ? (add_res - Q) : add_res;
            RegB_NTT_out <= sub_res;
            RegA_iNTT_out <= hold_add_0[0] ? (hold_add_0 + Q) >> 1 : hold_add_0 >> 1;
            RegB_iNTT_out <= oBarretMul[0] ? (oBarretMul[DATA_WIDTH-1:0] + Q) >> 1 :
            oBarretMul[DATA_WIDTH-1:0] >> 1;
        end
    end
    assign A_NTT = (RegA_NTT_out[DATA_WIDTH-1]) ? RegA_NTT_out[DATA_WIDTH-2:0] : RegA_NTT_out[DATA_WIDTH-2:0];
    assign B_NTT =  (RegB_NTT_out[DATA_WIDTH-1]) ? RegB_NTT_out[DATA_WIDTH-2:0] : RegB_NTT_out[DATA_WIDTH-2:0];
    assign A_iNTT = (RegA_iNTT_out[DATA_WIDTH-1]) ? RegA_iNTT_out[DATA_WIDTH-2:0] : RegA_iNTT_out[DATA_WIDTH-2:0];
    assign B_iNTT = (RegB_iNTT_out[DATA_WIDTH-1]) ? RegB_iNTT_out[DATA_WIDTH-2:0] : RegB_iNTT_out[DATA_WIDTH-2:0];
endmodule
