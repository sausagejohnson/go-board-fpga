`include "segment-block.v"

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
        input i_Switch_1
    );

    reg [6:0] segmentABits;// = 7'b1100000;
    reg [6:0] segmentBBits;// = 7'b0000011;

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

    BitSelectSegments SegmentB
    (
        .i_bitselect(segmentBBits),
        .segLED_A(o_Segment2_A),
        .segLED_B(o_Segment2_B),
        .segLED_C(o_Segment2_C),
        .segLED_D(o_Segment2_D),
        .segLED_E(o_Segment2_E),
        .segLED_F(o_Segment2_F),
        .segLED_G(o_Segment2_G)
    );

    //assign o_Segment1_G = test;

    always @(posedge i_Clk)
        begin
            if (i_Switch_1 == 0'b1)
                begin
                    segmentABits <= 7'b1110000; 
                end
            else
                begin
                    segmentABits <= 7'b0000111; 
                end
        end

endmodule