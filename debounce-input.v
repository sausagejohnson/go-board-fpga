module DebounceInput
    (
        input i_Clk,
        input i_Signal,
        output reg o_DebouncedSignal
    );

    localparam integer THRESHOLD = 100000;
    reg [31:0] count = 0;
    reg lastSignal = 0;
    reg r_DebouncedSignal = 1'b0;

    always @ (posedge i_Clk)
        begin
            if (lastSignal != i_Signal)
                begin
                    if (count < THRESHOLD)
                        begin
                            count <= count + 1;
                        end
                    else
                        begin
                            count <= 0;
                            lastSignal = i_Signal;
                            r_DebouncedSignal = i_Signal;
                        end
                end 
            else 
                begin
                    count <= 0;
                end
        end

    assign o_DebouncedSignal = r_DebouncedSignal;

endmodule