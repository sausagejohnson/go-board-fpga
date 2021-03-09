`timescale 1ns/1ns
`include "vga-bars.v"

module vgabars_tb;

    reg r_newFrameTick = 0;
    wire [8:0] w_splitBarYPos;

    VgaBars vgaBars 
    (
        .i_NewFrameTick(r_newFrameTick),
        .o_VerticalSplitLine(w_splitBarYPos)
    );

    initial
    repeat(200)
    begin
        #10;
        r_newFrameTick <= 1;
        #1;
        r_newFrameTick <= 0;
    end

    initial 
    begin
        $dumpfile("vga-bars_tb.lxt");
		$dumpvars(0,vgabars_tb);
    end

    initial
    begin
      #3000
      $finish;
    end


endmodule