`timescale 1ns/1ns
`include "debounce-input.v"

module debounceInput_tb;

    reg r_Clk = 1'b0;
    reg r_inputSignal = 1'b0;
    wire w_debouncedSignal;

    always #2 r_Clk = ~r_Clk;

    DebounceInput #(10) debouncer
    (
        .i_Clk(r_Clk),
        .i_Signal(r_inputSignal),
        .o_DebouncedSignal(w_debouncedSignal)
    );

    initial
        begin
          $dumpfile("debounce-input_tb.lxt");
          $dumpvars(0, debounceInput_tb);
        end

    initial //simulate a few quick bounces both on an off
        begin
          #1;
          r_inputSignal = 1'b1;
          #9;
          r_inputSignal = 1'b0;
          #2;
          r_inputSignal = 1'b1;
          #9;
          r_inputSignal = 1'b0;
          #9;
          r_inputSignal = 1'b1;
          #20;
          r_inputSignal = 1'b1; //last signal should be what holds on o_DebouncedSignal
          #200;
          r_inputSignal = 1'b0;
          #9;
          r_inputSignal = 1'b1;
          #9;
          r_inputSignal = 1'b0;
          #9;
          r_inputSignal = 1'b1;
          #2;
          r_inputSignal = 1'b0; //last signal should be what holds on o_DebouncedSignal
          #20;
        end

    initial
        begin
          #1000;
          $finish;
        end

endmodule