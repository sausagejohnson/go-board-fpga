/*
    This module takes a clock and input switch signal.
    When the input is high, it returns the next character (as binary)
    But will not return another character until input resets to low.
    Intended to take a debounced input.
*/

module CharacterSegmentDriver
    (
        input i_Clk,
        input i_Switch,
        output reg [7:0] o_Character = 8'b00000000
    );

    reg r_lastSwitch = 1'b0;
    reg [3:0] r_charIndex = 4'b0000;

    always @ (posedge i_Clk)
        begin
            if (i_Switch == 1'b1 && r_lastSwitch == 1'b0)
                begin
                    r_lastSwitch <= i_Switch;
                    
                    if (r_charIndex == 9)
                        begin
                            r_charIndex <= 0;
                        end
                    else 
                        begin
                            r_charIndex <= r_charIndex + 1;
                        end

                    case (r_charIndex)
                        0: o_Character <= "1";
                        1: o_Character <= "2";
                        2: o_Character <= "3";
                        3: o_Character <= "4";
                        4: o_Character <= "5";
                        5: o_Character <= "6";
                        6: o_Character <= "7";
                        7: o_Character <= "8";
                        8: o_Character <= "9";
                        9: o_Character <= "0";
                        default: o_Character <= "n";
                    endcase

                
                end
            else
                begin
                    r_lastSwitch <= i_Switch;
                end
        end

endmodule
