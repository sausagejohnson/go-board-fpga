//`include "segment-block.v"
//`include "character-segment-block.v"
`include "debounce-input.v"
//`include "character-segment-driver.v"
`include "counter-segments-driver.v"
`include "vgaprocessor.v"
`include "pmod-dac.v"

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
        output o_VGA_Grn_0,
        output o_VGA_Grn_1,
        output o_VGA_Grn_2,
        output o_VGA_Blu_0,
        output o_VGA_Blu_1,
        output o_VGA_Blu_2,
        output o_VGA_HSync,
        output o_VGA_VSync,
        output io_PMOD_1,
        output io_PMOD_2,
        output io_PMOD_3,
        output io_PMOD_4,
        output io_PMOD_7,
        output io_PMOD_8,
        output io_PMOD_9,
        output io_PMOD_10
    );

    reg [6:0] r_segmentABits;
    reg [7:0] r_segmentBBits;
    wire [7:0] w_segmentBBits;

    // BitSelectSegments SegmentA 
    // (
    //     .i_bitselect(r_segmentABits),
    //     .segLED_A(o_Segment1_A),
    //     .segLED_B(o_Segment1_B),
    //     .segLED_C(o_Segment1_C),
    //     .segLED_D(o_Segment1_D),
    //     .segLED_E(o_Segment1_E),
    //     .segLED_F(o_Segment1_F),
    //     .segLED_G(o_Segment1_G)
    // );

    // BitSelectSegments SegmentB
    // (
    //     .i_bitselect(r_segmentABits),
    //     .segLED_A(o_Segment1_A),
    //     .segLED_B(o_Segment1_B),
    //     .segLED_C(o_Segment1_C),
    //     .segLED_D(o_Segment1_D),
    //     .segLED_E(o_Segment1_E),
    //     .segLED_F(o_Segment1_F),
    //     .segLED_G(o_Segment1_G)
    // );

    // CharacterSelectSegments SegmentB
    // (
    //     .i_charselect(w_segmentBBits),
    //     .segLED_A(o_Segment2_A),
    //     .segLED_B(o_Segment2_B),
    //     .segLED_C(o_Segment2_C),
    //     .segLED_D(o_Segment2_D),
    //     .segLED_E(o_Segment2_E),
    //     .segLED_F(o_Segment2_F),
    //     .segLED_G(o_Segment2_G)
    // );

    wire w_debouncedSwitch;

    DebounceInput debouncer
    (
        .i_Clk(i_Clk),
        .i_Signal(i_Switch_4),
        .o_DebouncedSignal(w_debouncedSwitch)
    );

    // CharacterSegmentDriver CharacterDriver
    // (
    //     .i_Clk(i_Clk),
    //     .i_Switch(w_debouncedSwitch),
    //     .o_Character(w_segmentBBits)
    // );

    CounterSegmentsDriver driver
    (
        .i_debouncedSignal(w_debouncedSwitch),
        .segLED_1A(o_Segment1_A),
        .segLED_1B(o_Segment1_B),
        .segLED_1C(o_Segment1_C),
        .segLED_1D(o_Segment1_D),
        .segLED_1E(o_Segment1_E),
        .segLED_1F(o_Segment1_F),
        .segLED_1G(o_Segment1_G),
        .segLED_2A(o_Segment2_A),
        .segLED_2B(o_Segment2_B),
        .segLED_2C(o_Segment2_C),
        .segLED_2D(o_Segment2_D),
        .segLED_2E(o_Segment2_E),
        .segLED_2F(o_Segment2_F),
        .segLED_2G(o_Segment2_G)
    );

    wire [2:0] w_redColourPin;
    wire [2:0] w_greenColourPin;
    wire [2:0] w_blueColourPin;

    VgaProcessor redVgaProcessor
    (
        .i_Clk(i_Clk),
        .o_HSync(o_VGA_HSync),
        .o_VSync(o_VGA_VSync),
        .o_Red_Colour_On(w_redColourPin),
        .o_Green_Colour_On(w_greenColourPin),
        .o_Blue_Colour_On(w_blueColourPin)
    );

    assign o_VGA_Red_0 = w_redColourPin[0]; 
    assign o_VGA_Red_1 = w_redColourPin[1];
    assign o_VGA_Red_2 = w_redColourPin[2];
    assign o_VGA_Grn_0 = w_greenColourPin[0]; 
    assign o_VGA_Grn_1 = w_greenColourPin[1];
    assign o_VGA_Grn_2 = w_greenColourPin[2];
    assign o_VGA_Blu_0 = w_blueColourPin[0]; 
    assign o_VGA_Blu_1 = w_blueColourPin[1];
    assign o_VGA_Blu_2 = w_blueColourPin[2];

    reg [7:0] dacByte = 8'b10100111;

    PModDAC dac
    (
        .i_byte(dacByte),
        .o_PMOD_1(io_PMOD_1), //MSB
        .o_PMOD_2(io_PMOD_2),
        .o_PMOD_3(io_PMOD_3),
        .o_PMOD_4(io_PMOD_4),
        .o_PMOD_7(io_PMOD_5),
        .o_PMOD_8(io_PMOD_6),
        .o_PMOD_9(io_PMOD_7),
        .o_PMOD_10(io_PMOD_8)  //LSB
    );

endmodule