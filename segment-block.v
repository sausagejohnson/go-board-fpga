/*
    Pass in i_bitselect in the format of bits as:
    ABCDEFG
*/

module BitSelectSegments
    (
        input [6:0] i_bitselect,
        output segLED_A,
        output segLED_B,
        output segLED_C,
        output segLED_D,
        output segLED_E,
        output segLED_F,
        output segLED_G
    );

    assign segLED_A = ~i_bitselect[6];
    assign segLED_B = ~i_bitselect[5];
    assign segLED_C = ~i_bitselect[4];
    assign segLED_D = ~i_bitselect[3];
    assign segLED_E = ~i_bitselect[2];
    assign segLED_F = ~i_bitselect[1];
    assign segLED_G = ~i_bitselect[0];

endmodule