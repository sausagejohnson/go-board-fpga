`timescale 1ns/1ns
`include "pmod-dac.v"

module PModDAC_tb;

    reg [7:0] inputForDAC = 8'b01000110;

    wire pmod_128;
    wire pmod_64;
    wire pmod_32;
    wire pmod_16;
    wire pmod_8;
    wire pmod_4;
    wire pmod_2;
    wire pmod_1;


    PModDAC dac
    (
        .i_byte(inputForDAC),
        .o_PMOD_1(pmod_128),
        .o_PMOD_2(pmod_64),
        .o_PMOD_3(pmod_32),
        .o_PMOD_4(pmod_16),
        .o_PMOD_5(pmod_8),
        .o_PMOD_6(pmod_4),
        .o_PMOD_7(pmod_2),
        .o_PMOD_8(pmod_1)
    );


    initial 
    begin
        $dumpfile("pmod-dac_tb.lxt");
	    $dumpvars(0,PModDAC_tb);
    end

    initial
    begin
      #5000000
      $finish;
    end

endmodule