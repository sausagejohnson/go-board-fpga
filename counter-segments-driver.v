/*
    Pass in a debounced signal, and the counter will be split in two nibbles.
    Use the character-segment-block to convert to hex character as a binary wires
*/

`include "character-segment-block.v"

module CounterSegmentsDriver
    (
        input i_debouncedSignal,
        output segLED_1A,
        output segLED_1B,
        output segLED_1C, 
        output segLED_1D,
        output segLED_1E,
        output segLED_1F,
        output segLED_1G,
        output segLED_2A,
        output segLED_2B,
        output segLED_2C, 
        output segLED_2D,
        output segLED_2E,
        output segLED_2F,
        output segLED_2G,
        output reg [7:0] r_counter = 8'b00000000
    );

    reg [7:0] charA = "0"; //A is on the left
    reg [7:0] charB = "0"; //B is on the right

    always @(posedge i_debouncedSignal)
        begin
            if (r_counter > 255)
                begin
                    r_counter <= 0;
                end
            else
                begin
                    r_counter <= r_counter + 1;
                end

            if (r_counter[3:0] <= 9 ) 
                begin
                    charB = r_counter[3:0] + 48;
                end
            else
                begin
                    charB = r_counter[3:0] + 55;
                end

            if (r_counter[7:4] <= 9 ) 
                begin
                    charA = r_counter[7:4] + 48;
                end
            else
                begin
                    charA = r_counter[7:4] + 55;
                end
                
        end
    
    CharacterSelectSegments segLED_A
    (
        .i_charselect(charA),
        .segLED_A(segLED_1A),
        .segLED_B(segLED_1B),
        .segLED_C(segLED_1C),
        .segLED_D(segLED_1D),
        .segLED_E(segLED_1E),
        .segLED_F(segLED_1F),
        .segLED_G(segLED_1G)
    );

    CharacterSelectSegments segLED_B
    (
        .i_charselect(charB),
        .segLED_A(segLED_2A),
        .segLED_B(segLED_2B),
        .segLED_C(segLED_2C),
        .segLED_D(segLED_2D),
        .segLED_E(segLED_2E),
        .segLED_F(segLED_2F),
        .segLED_G(segLED_2G)
    );

endmodule