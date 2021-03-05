`timescale 1ns/1ns
`include "vgaprocessor.v"

module vgaprocessor_tb;

    reg i_Clk = 1'b0;
    wire o_HSync;
    wire o_VSync;
    wire o_Colour_On;

    VgaProcessor processor 
    (
        .i_Clk(i_Clk),
        .o_HSync(o_HSync),
        .o_VSync(o_VSync),
        .o_Colour_On(o_Colour_On)
    );

    always #2 i_Clk <= !i_Clk;

    initial 
    begin
      $dumpfile("vgaprocessor_tb.lxt");
		  $dumpvars(0,vgaprocessor_tb);
    end

    initial
    begin
      #5000000
      $finish;
    end


endmodule