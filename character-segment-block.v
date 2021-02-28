/*
    Pass in i_charselect in the format of a character as:
    A, b, 7, etc etc
*/

module CharacterSelectSegments
    (
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

    always @ (i_charselect)
        begin
            outputBits = 8'b00000000;
            case (i_charselect)
                "A":
                    outputBits = 7'b1110111;
                "b":
                    outputBits = 7'b0011111;
                "B", "8":
                    outputBits = 7'b1111111;
                "c":
                    outputBits = 7'b0001101;
                "C":
                    outputBits = 7'b1001110;
                "d":
                    outputBits = 7'b0011101;
                "E":
                    outputBits = 7'b1001111;
                "F":
                    outputBits = 7'b1000111;
                "g", "9":
                    outputBits = 7'b1111011;
                "G":
                    outputBits = 7'b1001111;
                "h":
                    outputBits = 7'b0010111;
                "H":
                    outputBits = 7'b0110111;
                "i":
                    outputBits = 7'b0010000;
                "I", "1":
                    outputBits = 7'b0110000;
                "j":
                    outputBits = 7'b0111100;
                "J":
                    outputBits = 7'b1111100;
                "l": 
                    outputBits = 7'b0000110;
                "L": 
                    outputBits = 7'b0001110;
                "n":
                    outputBits = 7'b0010101;
                "N":
                    outputBits = 7'b1110110;
                "o":
                    outputBits = 7'b0011101;
                "O", "0":
                    outputBits = 7'b1111110;
                "p", "P":
                    outputBits = 7'b1100111;
                "q":
                    outputBits = 7'b1110011;
                "r":
                    outputBits = 7'b0000101;
                "s", "S", "5":
                    outputBits = 7'b1011011;
                "u":
                    outputBits = 7'b0011100;
                "U":
                    outputBits = 7'b0111110;
                "Y":
                    outputBits = 7'b0111011;
                "Z", "2":
                    outputBits = 7'b1101101;
                "3":
                    outputBits = 7'b1111001;
                "4":
                    outputBits = 7'b0110011;
                "6":
                    outputBits = 7'b1011111;
                "7":
                    outputBits = 7'b1110000;
                default:
                    outputBits = 7'b1001001;
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