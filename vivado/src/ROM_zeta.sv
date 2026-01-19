module ROM_zeta #(
    parameters DATA_WIDTH = 13
) (
    input logic         clk_i,
    input logic         rst_i,
    input logic [7:0]   len_i;


    output logic [DATA_WIDTH-2:0] zeta0;
    output logic [DATA_WIDTH-2:0] zeta1;
    output logic [DATA_WIDTH-2:0] zeta2;
    output logic [DATA_WIDTH-2:0] zeta3;
    output logic [DATA_WIDTH-2:0] zeta4;
    output logic [DATA_WIDTH-2:0] zeta5;
    output logic [DATA_WIDTH-2:0] zeta6;
    output logic [DATA_WIDTH-2:0] zeta7;     
);
    logic [DATA_WIDTH-2:0] rom0 [0:17];
    logic [DATA_WIDTH-2:0] rom1 [0:17];
    logic [DATA_WIDTH-2:0] rom2 [0:17];
    logic [DATA_WIDTH-2:0] rom3 [0:17];
    logic [DATA_WIDTH-2:0] rom4 [0:17];
    logic [DATA_WIDTH-2:0] rom5 [0:17];
    logic [DATA_WIDTH-2:0] rom6 [0:17];
    logic [DATA_WIDTH-2:0] rom7 [0:17];

    always @(posedge clk_i) begin
        if (rst_i) begin
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
            rom0[0]      <= 12'd1729;
            rom0[1]      <= 12'd2580;
            rom0[2]      <= 12'd2642;
            rom0[3]      <= 12'd1919;
            rom0[4]      <= 12'd1339;
            rom0[5]      <= 12'd1476;
            rom0[6]      <= 12'd1197;
            rom0[7]      <= 12'd2304;
            rom0[8]      <= 12'd2277;
            rom0[9]      <= 12'd2055;
            rom0[10]     <= 12'd1409;
            rom0[11]     <= 12'd2662;
            rom0[12]     <= 12'd3281;
            rom0[13]     <= 12'd233;
            rom0[14]     <= 12'd756;
            rom0[15]     <= 12'd2156;
            rom0[16]     <= 12'd3015;
            rom0[17]     <= 12'd3050;
            ////////ROM2/////////
            rom0[0]      <= 12'd1729;
            rom0[1]      <= 12'd2580;
            rom0[2]      <= 12'd630;
            rom0[3]      <= 12'd193;
            rom0[4]      <= 12'd3046;
            rom0[5]      <= 12'd56;
            rom0[6]      <= 12'd650;
            rom0[7]      <= 12'd1977;
            rom0[8]      <= 12'd2513;
            rom0[9]      <= 12'd632;
            rom0[10]     <= 12'd1703;
            rom0[11]     <= 12'd1651;
            rom0[12]     <= 12'd2789;
            rom0[13]     <= 12'd1789;
            rom0[14]     <= 12'd1847;
            rom0[15]     <= 12'd952;
            rom0[16]     <= 12'd1461;
            rom0[17]     <= 12'd2687;
            ////////ROM3/////////
            rom0[0]      <= 12'd1729;
            rom0[1]      <= 12'd2580;
            rom0[2]      <= 12'd630;
            rom0[3]      <= 12'd797;
            rom0[4]      <= 12'd2240;
            rom0[5]      <= 12'd1333;
            rom0[6]      <= 12'd2865;
            rom0[7]      <= 12'd33;
            rom0[8]      <= 12'd1320;
            rom0[9]      <= 12'd1915;
            rom0[10]     <= 12'd939;
            rom0[11]     <= 12'd2308;
            rom0[12]     <= 12'd2437;
            rom0[13]     <= 12'd2388;
            rom0[14]     <= 12'd733;
            rom0[15]     <= 12'd2337;
            rom0[16]     <= 12'd268;
            rom0[17]     <= 12'd641;
            ////////ROM4/////////
            rom0[0]      <= 12'd1729;
            rom0[1]      <= 12'd3289;
            rom0[2]      <= 12'd1897;
            rom0[3]      <= 12'd2786;
            rom0[4]      <= 12'd1426;
            rom0[5]      <= 12'd2094;
            rom0[6]      <= 12'd2319;
            rom0[7]      <= 12'd1435;
            rom0[8]      <= 12'd807;
            rom0[9]      <= 12'd452;
            rom0[10]     <= 12'd1584;
            rom0[11]     <= 12'd2298;
            rom0[12]     <= 12'd2037;
            rom0[13]     <= 12'd3220;
            rom0[14]     <= 12'd375;
            rom0[15]     <= 12'd2549;
            rom0[16]     <= 12'd2090;
            rom0[17]     <= 12'd1645;
            ////////ROM5/////////
            rom0[0]      <= 12'd1729;
            rom0[1]      <= 12'd3289;
            rom0[2]      <= 12'd1897;
            rom0[3]      <= 12'd3260;
            rom0[4]      <= 12'd535;
            rom0[5]      <= 12'd2882;
            rom0[6]      <= 12'd1438;
            rom0[7]      <= 12'd2868;
            rom0[8]      <= 12'd1534;
            rom0[9]      <= 12'd2402;
            rom0[10]     <= 12'd1063;
            rom0[11]     <= 12'd319;
            rom0[12]     <= 12'd2773;
            rom0[13]     <= 12'd757;
            rom0[14]     <= 12'd2099;
            rom0[15]     <= 12'd561;
            rom0[16]     <= 12'd2466;
            rom0[17]     <= 12'd2594;
            ////////ROM6/////////
            rom0[0]      <= 12'd1729;
            rom0[1]      <= 12'd3289;
            rom0[2]      <= 12'd848;
            rom0[3]      <= 12'd569;
            rom0[4]      <= 12'd2393;
            rom0[5]      <= 12'd2879;
            rom0[6]      <= 12'd2647;
            rom0[7]      <= 12'd2617;
            rom0[8]      <= 12'd1481;
            rom0[9]      <= 12'd648;
            rom0[10]     <= 12'd2804;
            rom0[11]     <= 12'd1092;
            rom0[12]     <= 12'd403;
            rom0[13]     <= 12'd1026;
            rom0[14]     <= 12'd1143;
            rom0[15]     <= 12'd2150;
            rom0[16]     <= 12'd2775;
            rom0[17]     <= 12'd886;
            ////////ROM7/////////
            rom0[0]      <= 12'd1729;
            rom0[1]      <= 12'd3289;
            rom0[2]      <= 12'd848;
            rom0[3]      <= 12'd1746;
            rom0[4]      <= 12'd1974;
            rom0[5]      <= 12'd821;
            rom0[6]      <= 12'd2474;
            rom0[7]      <= 12'd3110;
            rom0[8]      <= 12'd1227;
            rom0[9]      <= 12'd910;
            rom0[10]     <= 12'd1722;
            rom0[11]     <= 12'd1212;
            rom0[12]     <= 12'd1874;
            rom0[13]     <= 12'd1029;
            rom0[14]     <= 12'd2110;
            rom0[15]     <= 12'd2935;
            rom0[16]     <= 12'd885;
            rom0[17]     <= 12'd2154;            
        end
    end
endmodule