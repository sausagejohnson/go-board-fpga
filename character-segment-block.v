/*
    Pass in i_charselect in the format of a character as:
    A, b, 7, etc etc
*/

module CharacterSelectSegments
    (
        input i_Clk,
        input [7:0] i_charselect,
        output segLED_A,
        output segLED_B,
        output segLED_C,
        output segLED_D,
        output segLED_E,
        output segLED_F,
        output segLED_G
    );

    reg [7:0] outputBits = 8'b00000000;


    /*
        Not working out. Read up at: https://www.verilogpro.com/verilog-case-casez-casex/
    */
    always @ (posedge i_Clk)
        begin
            outputBits = 8'b00000000;
            case (i_charselect)
                "A", "C", "E", "F", "g", "G", "N", "O", "p", "P", "q", "S", "Z", "2", "3", "5", "6", "7", "8", "9", "0": //top
                    outputBits[6] <= 1'b1;
                "A", "B", "d", "H", "I", "j", "J", "N", "O", "p", "P", "q", "U", "Y", "Z", "1", "2", "3", "4", "7", "8", "9", "0": //top-right
                    outputBits[5] <= 1'b1;
                "A", "B", "b", "d", "g", "g", "h", "H", "i", "I", "j", "J", "N", "n", "o", "O", "q", "S", "u", "U", "Y", "1", "3", "4", "5", "6", "7", "8", "9", "0": //bottom-right
                    outputBits[4] <= 1'b1;
                "b", "B", "c", "C", "d", "E", "g", "G", "j", "J", "L", "o", "O", "S", "u", "U", "Y", "Z", "2", "3", "5", "6", "8", "9", "0": //bottom
                    outputBits[3] <= 1'b1;
                "A", "b", "B", "c", "C", "d", "E", "F", "G", "h", "H", "i", "I", "j", "J", "l", "L", "n", "N", "o", "O", "p", "P", "r", "u", "U", "Z", "2", "6", "8", "0": //bottom-left
                    outputBits[2] <= 1'b1;
                "A", "b", "B", "C", "E", "F", "g", "G", "h", "H", "l", "L", "N", "O", "p", "P", "q", "S", "U", "Y", "4", "5", "6", "8", "9", "0": //top-left
                    outputBits[1] <= 1'b1;
                "A", "b", "B", "c", "d", "E", "F", "G", "h", "H", "p", "P", "q", "r", "S", "Y", "Z", "2", "3", "4", "5", "6", "8", "9": //middle
                    outputBits[0] <= 1'b1;
                default:
                    begin
                        outputBits[6] <= 1'b1;
                        outputBits[3] <= 1'b1;
                        outputBits[0] <= 1'b1;
                    end
            endcase
        end


    assign segLED_A = ~outputBits[6]; //segment A (top)
    assign segLED_B = ~outputBits[5]; //segment B
    assign segLED_C = ~outputBits[4]; //segment C
    assign segLED_D = ~outputBits[3]; //segment D (bottom)
    assign segLED_E = ~outputBits[2]; //segment E
    assign segLED_F = ~outputBits[1]; //segment F
    assign segLED_G = ~outputBits[0]; //segment G (middle)

endmodule