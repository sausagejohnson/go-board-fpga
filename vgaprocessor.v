`include "vga-bars.v"

module VgaProcessor
    (
        input i_Clk,
        output reg o_HSync = 0,
        output reg o_VSync = 0,
        output reg [2:0] o_Red_Colour_On = 3'b000,
        output reg [2:0] o_Green_Colour_On = 3'b000,
        output reg [2:0] o_Blue_Colour_On = 3'b000
    );

    localparam TOTAL_WIDTH = 800;
    localparam TOTAL_HEIGHT = 525;
    localparam ACTIVE_WIDTH = 640;
    localparam ACTIVE_HEIGHT = 480;
    localparam H_SYNC_COLUMN = 704;
    localparam V_SYNC_LINE = 523;

    reg [11:0] r_HPos = 0;
    reg signed [11:0] r_VPos = 0;

    reg r_NewFrame = 1'b0; //flagged when a new frame can be drawn. Update params here.

    //step pixel position throughout the screen
    always @(posedge i_Clk)
        begin
          if (r_HPos < TOTAL_WIDTH-1)
            begin
                r_HPos <= r_HPos + 1;
            end
          else
            begin
                r_HPos <= 0;
                if (r_VPos < TOTAL_HEIGHT-1)
                  begin
                    r_VPos <= r_VPos + 1;
                  end
                else
                  begin
                    r_VPos <= 0;
                  end

            end  
        end

    //Horizontal sync
    always @(posedge i_Clk)
        begin
          if (r_HPos < H_SYNC_COLUMN)//> H_SYNC_COLUMN)
            begin
                o_HSync = 1'b1;
            end
          else
            begin
                o_HSync = 1'b0;
            end  
        end

    //Vertical sync
    always @(posedge i_Clk)
        begin
          if (r_VPos < V_SYNC_LINE)
            begin
                o_VSync = 1'b1;
            end
          else
            begin
                o_VSync = 1'b0;
            end  
        end

    always @(posedge i_Clk)
        begin
          if (r_HPos == 0 & r_VPos == 0)
              begin
                r_NewFrame <= 1'b1;
              end
          else
              begin
                r_NewFrame <= 1'b0;
              end
        end

    wire signed [8:0] w_SineAbsoluteYPos;

    VgaBars vgaBars 
    (
        .i_NewFrameTick(r_NewFrame),
        .o_VerticalSplitLine(w_SineAbsoluteYPos)
    );

    //Colour On/Off
    always @(posedge i_Clk)
        begin
          if ((r_HPos >= 50 & r_HPos < 690) & (r_VPos >= 33 & r_VPos < 513)) 
            begin
                if (r_VPos < (w_SineAbsoluteYPos + 273)) //273 is midpoint in 480 pixel y-range
                  begin
                    o_Red_Colour_On = 3'b010;
                    o_Green_Colour_On = 3'b010;
                    o_Blue_Colour_On = 3'b111;
                  end
                else
                  begin
                    o_Red_Colour_On = 3'b111;
                    o_Green_Colour_On = 3'b100;
                    o_Blue_Colour_On = 3'b000;
                  end

            end
          else
            begin
                o_Red_Colour_On = 3'b000;
                o_Green_Colour_On = 3'b000;
                o_Blue_Colour_On = 3'b000;
            end  
        end


endmodule