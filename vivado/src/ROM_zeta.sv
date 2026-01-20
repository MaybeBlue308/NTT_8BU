module ROM_zeta #(
    parameter DATA_WIDTH = 13
) (
    input logic         clk_i,
    input logic         rst_i,
    input logic         start_i,
    input logic [7:0]   len_i,

    output logic [DATA_WIDTH-2:0] zeta0,
    output logic [DATA_WIDTH-2:0] zeta1,
    output logic [DATA_WIDTH-2:0] zeta2,
    output logic [DATA_WIDTH-2:0] zeta3,
    output logic [DATA_WIDTH-2:0] zeta4,
    output logic [DATA_WIDTH-2:0] zeta5,
    output logic [DATA_WIDTH-2:0] zeta6,
    output logic [DATA_WIDTH-2:0] zeta7     
);
    logic [DATA_WIDTH-2:0] rom0 [0:17];
    logic [DATA_WIDTH-2:0] rom1 [0:17];
    logic [DATA_WIDTH-2:0] rom2 [0:17];
    logic [DATA_WIDTH-2:0] rom3 [0:17];
    logic [DATA_WIDTH-2:0] rom4 [0:17];
    logic [DATA_WIDTH-2:0] rom5 [0:17];
    logic [DATA_WIDTH-2:0] rom6 [0:17];
    logic [DATA_WIDTH-2:0] rom7 [0:17];

    initial begin
            ////////ROM0/////////
            rom0[0]      <= 12'd1729;
            rom0[1]      <= 12'd2580;
            rom0[2]      <= 12'd2642;
            rom0[3]      <= 12'd1062;
            rom0[4]      <= 12'd296;
            rom0[5]      <= 12'd2447;
            rom0[6]      <= 12'd289;
            rom0[7]      <= 12'd331;
            rom0[8]      <= 12'd3253;
            rom0[9]      <= 12'd1756;
            rom0[10]     <= 12'd17;
            rom0[11]     <= 12'd2761;
            rom0[12]     <= 12'd583;
            rom0[13]     <= 12'd2649;
            rom0[14]     <= 12'd1637;
            rom0[15]     <= 12'd723;
            rom0[16]     <= 12'd2288;
            rom0[17]     <= 12'd1100;
            ////////ROM1/////////
            rom1[0]      <= 12'd1729;
            rom1[1]      <= 12'd2580;
            rom1[2]      <= 12'd2642;
            rom1[3]      <= 12'd1919;
            rom1[4]      <= 12'd1339;
            rom1[5]      <= 12'd1476;
            rom1[6]      <= 12'd1197;
            rom1[7]      <= 12'd2304;
            rom1[8]      <= 12'd2277;
            rom1[9]      <= 12'd2055;
            rom1[10]     <= 12'd1409;
            rom1[11]     <= 12'd2662;
            rom1[12]     <= 12'd3281;
            rom1[13]     <= 12'd233;
            rom1[14]     <= 12'd756;
            rom1[15]     <= 12'd2156;
            rom1[16]     <= 12'd3015;
            rom1[17]     <= 12'd3050;
            ////////ROM2/////////
            rom2[0]      <= 12'd1729;
            rom2[1]      <= 12'd2580;
            rom2[2]      <= 12'd630;
            rom2[3]      <= 12'd193;
            rom2[4]      <= 12'd3046;
            rom2[5]      <= 12'd56;
            rom2[6]      <= 12'd650;
            rom2[7]      <= 12'd1977;
            rom2[8]      <= 12'd2513;
            rom2[9]      <= 12'd632;
            rom2[10]     <= 12'd1703;
            rom2[11]     <= 12'd1651;
            rom2[12]     <= 12'd2789;
            rom2[13]     <= 12'd1789;
            rom2[14]     <= 12'd1847;
            rom2[15]     <= 12'd952;
            rom2[16]     <= 12'd1461;
            rom2[17]     <= 12'd2687;
            ////////ROM3/////////
            rom3[0]      <= 12'd1729;
            rom3[1]      <= 12'd2580;
            rom3[2]      <= 12'd630;
            rom3[3]      <= 12'd797;
            rom3[4]      <= 12'd2240;
            rom3[5]      <= 12'd1333;
            rom3[6]      <= 12'd2865;
            rom3[7]      <= 12'd33;
            rom3[8]      <= 12'd1320;
            rom3[9]      <= 12'd1915;
            rom3[10]     <= 12'd939;
            rom3[11]     <= 12'd2308;
            rom3[12]     <= 12'd2437;
            rom3[13]     <= 12'd2388;
            rom3[14]     <= 12'd733;
            rom3[15]     <= 12'd2337;
            rom3[16]     <= 12'd268;
            rom3[17]     <= 12'd641;
            ////////ROM4/////////
            rom4[0]      <= 12'd1729;
            rom4[1]      <= 12'd3289;
            rom4[2]      <= 12'd1897;
            rom4[3]      <= 12'd2786;
            rom4[4]      <= 12'd1426;
            rom4[5]      <= 12'd2094;
            rom4[6]      <= 12'd2319;
            rom4[7]      <= 12'd1435;
            rom4[8]      <= 12'd807;
            rom4[9]      <= 12'd452;
            rom4[10]     <= 12'd1584;
            rom4[11]     <= 12'd2298;
            rom4[12]     <= 12'd2037;
            rom4[13]     <= 12'd3220;
            rom4[14]     <= 12'd375;
            rom4[15]     <= 12'd2549;
            rom4[16]     <= 12'd2090;
            rom4[17]     <= 12'd1645;
            ////////ROM5/////////
            rom5[0]      <= 12'd1729;
            rom5[1]      <= 12'd3289;
            rom5[2]      <= 12'd1897;
            rom5[3]      <= 12'd3260;
            rom5[4]      <= 12'd535;
            rom5[5]      <= 12'd2882;
            rom5[6]      <= 12'd1438;
            rom5[7]      <= 12'd2868;
            rom5[8]      <= 12'd1534;
            rom5[9]      <= 12'd2402;
            rom5[10]     <= 12'd1063;
            rom5[11]     <= 12'd319;
            rom5[12]     <= 12'd2773;
            rom5[13]     <= 12'd757;
            rom5[14]     <= 12'd2099;
            rom5[15]     <= 12'd561;
            rom5[16]     <= 12'd2466;
            rom5[17]     <= 12'd2594;
            ////////ROM6/////////
            rom6[0]      <= 12'd1729;
            rom6[1]      <= 12'd3289;
            rom6[2]      <= 12'd848;
            rom6[3]      <= 12'd569;
            rom6[4]      <= 12'd2393;
            rom6[5]      <= 12'd2879;
            rom6[6]      <= 12'd2647;
            rom6[7]      <= 12'd2617;
            rom6[8]      <= 12'd1481;
            rom6[9]      <= 12'd648;
            rom6[10]     <= 12'd2804;
            rom6[11]     <= 12'd1092;
            rom6[12]     <= 12'd403;
            rom6[13]     <= 12'd1026;
            rom6[14]     <= 12'd1143;
            rom6[15]     <= 12'd2150;
            rom6[16]     <= 12'd2775;
            rom6[17]     <= 12'd886;
            ////////ROM7/////////
            rom7[0]      <= 12'd1729;
            rom7[1]      <= 12'd3289;
            rom7[2]      <= 12'd848;
            rom7[3]      <= 12'd1746;
            rom7[4]      <= 12'd1974;
            rom7[5]      <= 12'd821;
            rom7[6]      <= 12'd2474;
            rom7[7]      <= 12'd3110;
            rom7[8]      <= 12'd1227;
            rom7[9]      <= 12'd910;
            rom7[10]     <= 12'd1722;
            rom7[11]     <= 12'd1212;
            rom7[12]     <= 12'd1874;
            rom7[13]     <= 12'd1029;
            rom7[14]     <= 12'd2110;
            rom7[15]     <= 12'd2935;
            rom7[16]     <= 12'd885;
            rom7[17]     <= 12'd2154;            
        end

    logic [3:0] cnt;
    logic       running;
    logic [4:0] b_index;

    always_ff @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            cnt     <= 4'd0;
            running <= 1'b0;
        end else begin
            if (start_i) begin
                running <= 1'b1;
                cnt     <= 4'd0;
            end else if (len_i == 1) begin
                running <= '0;
                cnt     <= 0; 
            end else if (running) begin
                if (cnt == 4'd15) begin
                    cnt <= 4'd0;
                end else begin
                    cnt <= cnt + 1'b1;
                end
            end
        end  
    end
    always_comb begin
        case (len_i) 
            8'd128: b_index = 5'd0;
            8'd64:  b_index = 5'd1;
            8'd32:  b_index = 5'd2;
            8'd16:  b_index = 5'd3;

            8'd8: begin
                b_index = 5'd4 + {4'd0,cnt[3]};
            end

            8'd4: begin
                b_index = 5'd6 + {3'd0, cnt [3:2]};
            end

            8'd2: begin
                b_index = 5'd10 + {2'd0, cnt[3:1]};
            end

            default: b_index = 5'b0;
        endcase
    end

    assign zeta0 = (start_i || running) ? rom0[b_index] : 0;
    assign zeta1 = (start_i || running) ? rom1[b_index] : 0;
    assign zeta2 = (start_i || running) ? rom2[b_index] : 0;
    assign zeta3 = (start_i || running) ? rom3[b_index] : 0;
    assign zeta4 = (start_i || running) ? rom4[b_index] : 0;
    assign zeta5 = (start_i || running) ? rom5[b_index] : 0;
    assign zeta6 = (start_i || running) ? rom6[b_index] : 0;
    assign zeta7 = (start_i || running) ? rom7[b_index] : 0;

endmodule