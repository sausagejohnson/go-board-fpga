`timescale 1ns/1ns
`include "top.v"

module top_tb;

    reg r_Clk = 1'b0;

    always #1 r_Clk <= !r_Clk;

    top MyTop
    (
        .i_Clk(r_Clk)
    );

    initial 
    begin
        $dumpfile("top_tb.lxt");
		$dumpvars(0,top_tb);
    end

    initial
    begin
      #81750000;// #2500000
      $finish;
    end

endmodule