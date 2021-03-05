`include "segment-block.v"
`include "character-segment-block.v"
`include "debounce-input.v"
`include "character-segment-driver.v"
`include "vgaprocessor.v"

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
        input i_Switch_4,
        output o_VGA_Red_0,
        output o_VGA_Red_1,
        output o_VGA_Red_2,
        output o_VGA_HSync,
        output o_VGA_VSync
    );

    reg [6:0] r_segmentABits;
    reg [7:0] r_segmentBBits;
    wire [7:0] w_segmentBBits;

    BitSelectSegments SegmentA 
    (
        .i_bitselect(r_segmentABits),
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
        .i_charselect(w_segmentBBits),
        .segLED_A(o_Segment2_A),
        .segLED_B(o_Segment2_B),
        .segLED_C(o_Segment2_C),
        .segLED_D(o_Segment2_D),
        .segLED_E(o_Segment2_E),
        .segLED_F(o_Segment2_F),
        .segLED_G(o_Segment2_G)
    );

    wire w_debouncedSwitch;

    DebounceInput debouncer
    (
        .i_Clk(i_Clk),
        .i_Signal(i_Switch_4),
        .o_DebouncedSignal(w_debouncedSwitch)
    );

    CharacterSegmentDriver CharacterDriver
    (
        .i_Clk(i_Clk),
        .i_Switch(w_debouncedSwitch),
        .o_Character(w_segmentBBits)
    );

    wire w_colourPin;

    VgaProcessor redVgaProcessor
    (
        .i_Clk(i_Clk),
        .o_HSync(o_HSync),
        .o_VSync(o_VSync),
        .o_Colour_On(w_colourPin)
    );

    assign o_Red_Pin_1 = w_colourPin; //set all colour red pins to highest red for every pixel in the 640x480 displayable range
    assign o_Red_Pin_2 = w_colourPin;
    assign o_Red_Pin_3 = w_colourPin;

endmodule