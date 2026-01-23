`timescale 1ns/1ps

module tb_NTT_TOP;
    localparam DATA_WIDTH = 13;
    localparam INPUT_WIDTH = 192;
    localparam ADDR_WIDTH = 8;
    localparam ADDR_ZETA = 7;

    logic clk_i;
    logic rst_i;
    logic start;
    logic is_NTT;
    logic valid_input;

    logic done_all;
    logic [191:0] in_mem[15:0];
    logic [191:0] din;

    integer i;

    NTT_TOP u_top (
        .clk_i (clk_i),
        .rst_i (rst_i),
        .start (start),
        .is_NTT (is_NTT),
        .valid_input (valid_input),
        .din (din),
        .done_all (done_all)
    );

    initial begin
        clk_i = 0;
        forever #5 clk_i = ~clk_i;
    end

    initial begin
        in_mem[0] = 192'h002cff000001d00d00001000000cff001000001000d00001;
        in_mem[1] = 192'hd00001cff001000000d00000001001000001d00001001001;
        in_mem[2] = 192'h000001002d00002000000000001cff000001001000001d00;
        in_mem[3] = 192'h002d00cffcff000000001002cffcfe001cffd00000001d00;
        in_mem[4] = 192'hcff001002d00d00000000000001d00cffd00d00d00d00cff;
        in_mem[5] = 192'hcffd00001001cff001000000000000d00002001001000cff;
        in_mem[6] = 192'h000cffd00d00000d00001000001cffd00000cff001003002;
        in_mem[7] = 192'hd00000000000002002002002001cff002001001cfe002002;
        in_mem[8] = 192'hd00cff001d00002000001002001001cff000001000000d00;
        in_mem[9] = 192'h001000001001001cff000d00d00000001002000001cff003;
        in_mem[10] = 192'hd00d00001d00001001000001002000000001002d00000000;
        in_mem[11] = 192'h001d00cff000002d00d00d00002000002001003001000d00;
        in_mem[12] = 192'h002cffd00002000000000000cffcffd00cff003003cffd00;
        in_mem[13] = 192'h001002000000d00cff000001cffd00001001000d00001001;
        in_mem[14] = 192'hcff001000cfecffd00001d00001000002000d00d00d00d00;
        in_mem[15] = 192'h001002000000d00cfe002d00000001d00001001001d00003;

    end
    initial begin
        $$display("START");
        rst_i = 1;
        start = 0;
        is_NTT = 1;
        valid_input = 0;
        din = 0;
        i = 0;
        #50;
        rst_i = 0;
        #20;
        start = 1;
        #10;
        start = 0;

        @(posedge clk_i);
        for (i = 0;i < 16 ;i = i + 1 ) begin
            din = in_mem[i];
            #5;
            valid_input = 1;
            @(posedge clk_i);
            #75;
        end

        wait (done_all == 1);
        #50;
        $display("Done");
        $stop;
    end

    always @(posedge clk_i) begin
        if (done_all) begin
            $$display("Time");
        end
    end
endmodule