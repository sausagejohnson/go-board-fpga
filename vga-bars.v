/*
    Generate the VGA Demo Bars. Every new frame tick, get the next
    sine value to return. Bind this to the vga split line
*/

module VgaBars
    (
        input i_NewFrameTick,
        output reg signed [8:0] o_VerticalSplitLine = 9'b000000000
    );

    reg [7:0] r_index = 8'b00000000;
    reg signed [8:0] a_sineTable [0:119]; //memory for sine table lookups -200 to 200

    always @(posedge i_NewFrameTick)
        begin
            if (r_index >= 119)
                begin
                    r_index <= 0;
                end
            else
                begin
                    r_index <= r_index + 1;
                end

            o_VerticalSplitLine <= a_sineTable[r_index];
        end

    //sine data here
    initial
        begin
            a_sineTable[0] <= 0;
            a_sineTable[1] <= 10;
            a_sineTable[2] <= 21;
            a_sineTable[3] <= 31;
            a_sineTable[4] <= 42;
            a_sineTable[5] <= 52;
            a_sineTable[6] <= 62;
            a_sineTable[7] <= 72;
            a_sineTable[8] <= 81;
            a_sineTable[9] <= 91;
            a_sineTable[10] <= 100;
            a_sineTable[11] <= 109;
            a_sineTable[12] <= 118;
            a_sineTable[13] <= 126;
            a_sineTable[14] <= 134;
            a_sineTable[15] <= 141;
            a_sineTable[16] <= 149;
            a_sineTable[17] <= 155;
            a_sineTable[18] <= 162;
            a_sineTable[19] <= 168;
            a_sineTable[20] <= 173;
            a_sineTable[21] <= 178;
            a_sineTable[22] <= 183;
            a_sineTable[23] <= 187;
            a_sineTable[24] <= 190;
            a_sineTable[25] <= 193;
            a_sineTable[26] <= 196;
            a_sineTable[27] <= 198;
            a_sineTable[28] <= 199;
            a_sineTable[29] <= 200;
            a_sineTable[30] <= 200;
            a_sineTable[31] <= 200;
            a_sineTable[32] <= 199;
            a_sineTable[33] <= 198;
            a_sineTable[34] <= 196;
            a_sineTable[35] <= 193;
            a_sineTable[36] <= 190;
            a_sineTable[37] <= 187;
            a_sineTable[38] <= 183;
            a_sineTable[39] <= 178;
            a_sineTable[40] <= 173;
            a_sineTable[41] <= 168;
            a_sineTable[42] <= 162;
            a_sineTable[43] <= 155;
            a_sineTable[44] <= 149;
            a_sineTable[45] <= 141;
            a_sineTable[46] <= 134;
            a_sineTable[47] <= 126;
            a_sineTable[48] <= 118;
            a_sineTable[49] <= 109;
            a_sineTable[50] <= 100;
            a_sineTable[51] <= 91;
            a_sineTable[52] <= 81;
            a_sineTable[53] <= 72;
            a_sineTable[54] <= 62;
            a_sineTable[55] <= 52;
            a_sineTable[56] <= 42;
            a_sineTable[57] <= 31;
            a_sineTable[58] <= 21;
            a_sineTable[59] <= 10;
            a_sineTable[60] <= 0;
            a_sineTable[61] <= -10;
            a_sineTable[62] <= -21;
            a_sineTable[63] <= -31;
            a_sineTable[64] <= -42;
            a_sineTable[65] <= -52;
            a_sineTable[66] <= -62;
            a_sineTable[67] <= -72;
            a_sineTable[68] <= -81;
            a_sineTable[69] <= -91;
            a_sineTable[70] <= -100;
            a_sineTable[71] <= -109;
            a_sineTable[72] <= -118;
            a_sineTable[73] <= -126;
            a_sineTable[74] <= -134;
            a_sineTable[75] <= -141;
            a_sineTable[76] <= -149;
            a_sineTable[77] <= -155;
            a_sineTable[78] <= -162;
            a_sineTable[79] <= -168;
            a_sineTable[80] <= -173;
            a_sineTable[81] <= -178;
            a_sineTable[82] <= -183;
            a_sineTable[83] <= -187;
            a_sineTable[84] <= -190;
            a_sineTable[85] <= -193;
            a_sineTable[86] <= -196;
            a_sineTable[87] <= -198;
            a_sineTable[88] <= -199;
            a_sineTable[89] <= -200;
            a_sineTable[90] <= -200;
            a_sineTable[91] <= -200;
            a_sineTable[92] <= -199;
            a_sineTable[93] <= -198;
            a_sineTable[94] <= -196;
            a_sineTable[95] <= -193;
            a_sineTable[96] <= -190;
            a_sineTable[97] <= -187;
            a_sineTable[98] <= -183;
            a_sineTable[99] <= -178;
            a_sineTable[100] <= -173;
            a_sineTable[101] <= -168;
            a_sineTable[102] <= -162;
            a_sineTable[103] <= -155;
            a_sineTable[104] <= -149;
            a_sineTable[105] <= -141;
            a_sineTable[106] <= -134;
            a_sineTable[107] <= -126;
            a_sineTable[108] <= -118;
            a_sineTable[109] <= -109;
            a_sineTable[110] <= -100;
            a_sineTable[111] <= -91;
            a_sineTable[112] <= -81;
            a_sineTable[113] <= -72;
            a_sineTable[114] <= -62;
            a_sineTable[115] <= -52;
            a_sineTable[116] <= -42;
            a_sineTable[117] <= -31;
            a_sineTable[118] <= -21;
            a_sineTable[119] <= -10;
            
            /*
                Generated with:
                int index = 0;
                for (double x=0.0; x<6.265732; x+= 0.052359875) {
                    double number = Math.Round(Math.Sin(x) * 200);
                    Console.WriteLine("a_sineTable[" + index + "] <= " + number.ToString() + ";");
                    index++;
                }
            */

        end

endmodule