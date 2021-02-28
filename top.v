`include "segment-block.v"
`include "character-segment-block.v"
`include "debounce-input.v"
`include "character-segment-driver.v"

module top 
    (
        input i_Clk,
        output o_Segment1_A,
        output o_Segment1_B,
        output o_Segment1_C,
        output o_Segment1_D,
        output o_Segment1_E,
        output o_Segment1_F,
        output o_Segment1_G,
        output o_Segment2_A,
        output o_Segment2_B,
        output o_Segment2_C,
        output o_Segment2_D,
        output o_Segment2_E,
        output o_Segment2_F,
        output o_Segment2_G,
        input i_Switch_1,
        input i_Switch_4
    );

    reg [6:0] segmentABits;// = 7'b1100000;
    reg [7:0] segmentBBits;// = "F";

    BitSelectSegments SegmentA 
    (
        .i_bitselect(segmentABits),
        .segLED_A(o_Segment1_A),
        .segLED_B(o_Segment1_B),
        .segLED_C(o_Segment1_C),
        .segLED_D(o_Segment1_D),
        .segLED_E(o_Segment1_E),
        .segLED_F(o_Segment1_F),
        .segLED_G(o_Segment1_G)
    );

    CharacterSelectSegments SegmentB
    (
        .i_charselect(segmentBBits),
        .segLED_A(o_Segment2_A),
        .segLED_B(o_Segment2_B),
        .segLED_C(o_Segment2_C),
        .segLED_D(o_Segment2_D),
        .segLED_E(o_Segment2_E),
        .segLED_F(o_Segment2_F),
        .segLED_G(o_Segment2_G)
    );


    CharacterSegmentDriver CharacterDriver
    (
        .i_Clk(i_Clk),
        .i_Switch(i_Switch_4),
        .o_Character(segmentBBits)
    );

    always @(posedge i_Clk)
        begin
            w_Character <= segmentBBits;
        end

    /*wire r_debouncedSwitch;

    DebounceInput debouncer
    (
        .i_Clk(i_Clk),
        .i_Signal(i_Switch_1),
        .o_DebouncedSignal(r_debouncedSwitch)
    );*/

endmodule