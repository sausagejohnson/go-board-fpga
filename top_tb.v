`timescale 1ns/1ns
`include "top.v"

module top_tb;

    reg r_Clk = 1'b0;
    reg r_switch = 1'b0;

    always
      begin 
        #1 
        r_Clk <= !r_Clk;
        r_switch = ~r_switch;
      end

    top MyTop
    (
        .i_Clk(r_Clk),
        .i_Switch_4(r_switch)
    );

    initial 
      begin
        $dumpfile("top_tb.lxt");
        $dumpvars(0,top_tb);
      end

    

    initial
    begin
      #2500
      $finish;
    end

endmodule