`timescale 1ns/1ns
`include "character-segment-driver.v"

module characterDriverInput_tb;

    reg r_Clk = 1'b0;
    reg r_inputSwitch = 1'b0;
    wire [31:0] w_outputChar;

    always #2 r_Clk = ~r_Clk;

    CharacterSegmentDriver #(10) driver
    (
        .i_Clk(r_Clk),
        .i_Switch(r_inputSwitch),
        .o_Character(w_outputChar)
    );

    initial
        begin
          $dumpfile("character-segment-driver_tb.lxt");
          $dumpvars(0, characterDriverInput_tb);
        end

    initial //simulate a few quick bounces both on an off
        repeat(20)
        begin
          #4;
          r_inputSwitch = 1'b1;
          #8;
          r_inputSwitch = 1'b0;
        end

    initial
        begin
          #1000;
          $finish;
        end

endmodule