module PModDAC
    (
        input [7:0] i_byte, //eg b01000110
        output o_PMOD_1, //MSB
        output o_PMOD_2, 
        output o_PMOD_3, 
        output o_PMOD_4, 
        output o_PMOD_7, 
        output o_PMOD_8, 
        output o_PMOD_9, 
        output o_PMOD_10  //LSB
    );

    assign o_PMOD_1 = i_byte[7];    //MSB
    assign o_PMOD_2 = i_byte[6];
    assign o_PMOD_3 = i_byte[5];
    assign o_PMOD_4 = i_byte[4];
    assign o_PMOD_7 = i_byte[3];
    assign o_PMOD_8 = i_byte[2];
    assign o_PMOD_9 = i_byte[1];
    assign o_PMOD_10 = i_byte[0];    //LSB

endmodule