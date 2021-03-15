`timescale 1ns/1ns
`include "counter-segments-driver.v"

module CounterSegmentsDriver_tb;

    reg [7:0] r_Counter = 8'b00000000;
    reg r_debouncedInputSwitch = 1'b0;
    
    wire w_segLED_1A;
    wire w_segLED_1B;
    wire w_segLED_1C; 
    wire w_segLED_1D;
    wire w_segLED_1E;
    wire w_segLED_1F;
    wire w_segLED_1G;
    wire w_segLED_2A;
    wire w_segLED_2B;
    wire w_segLED_2C; 
    wire w_segLED_2D;
    wire w_segLED_2E;
    wire w_segLED_2F;
    wire w_segLED_2G;

    CounterSegmentsDriver driver
    (
        .i_debouncedSignal(r_debouncedInputSwitch),
        .segLED_1A(w_segLED_1A),
        .segLED_1B(w_segLED_1B),
        .segLED_1C(w_segLED_1C),
        .segLED_1D(w_segLED_1D),
        .segLED_1E(w_segLED_1E),
        .segLED_1F(w_segLED_1F),
        .segLED_1G(w_segLED_1G),
        .segLED_2A(w_segLED_2A),
        .segLED_2B(w_segLED_2B),
        .segLED_2C(w_segLED_2C),
        .segLED_2D(w_segLED_2D),
        .segLED_2E(w_segLED_2E),
        .segLED_2F(w_segLED_2F),
        .segLED_2G(w_segLED_2G)
    );

    // always 
    //   begin
    //       #2;
    //       r_debouncedInputSwitch = ~r_debouncedInputSwitch;
    //       #2;
    //       r_debouncedInputSwitch = ~r_debouncedInputSwitch;
    //       #2;
    //       r_Counter <= r_Counter + 1;
    //   end

    initial 
      repeat(300)
      begin
          #2;
          r_debouncedInputSwitch <= 1;
          #2;
          r_debouncedInputSwitch <= 0;
          #2;
          r_Counter <= r_Counter + 1;
      end

    initial
        begin
          $dumpfile("counter-segments-driver_tb.lxt");
          $dumpvars(0, CounterSegmentsDriver_tb);
        end



    initial
        begin
          #4000
          $finish;
        end

endmodule