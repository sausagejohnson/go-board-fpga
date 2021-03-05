module VgaProcessor
    (
        input i_Clk,
        output reg o_HSync,
        output reg o_VSync,
        output reg o_Colour_On
    );

    localparam TOTAL_WIDTH = 800;
    localparam TOTAL_HEIGHT = 525;
    localparam ACTIVE_WIDTH = 640;
    localparam ACTIVE_HEIGHT = 480;
    localparam H_SYNC_COLUMN = 680;
    localparam V_SYNC_LINE = 500;

    reg [11:0] r_HPos = 0;
    reg [11:0] r_VPos = 0;

    //step pixel position throughout the screen
    always @(posedge i_Clk)
        begin
          if (r_HPos > TOTAL_WIDTH)
            begin
                r_HPos <= 0;
                r_VPos <= r_VPos + 1;
            end
          else
            begin
                r_HPos <= r_HPos + 1;
            end  
        end

    //Horizontal sync
    always @(posedge i_Clk)
        begin
          if (r_HPos > H_SYNC_COLUMN)
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
          if (r_VPos > V_SYNC_LINE)
            begin
                o_VSync = 1'b1;
            end
          else
            begin
                o_VSync = 1'b0;
            end  
        end

    //Colour On/Off
    always @(posedge i_Clk)
        begin
          if (r_HPos < ACTIVE_WIDTH & r_VPos < ACTIVE_HEIGHT)
            begin
                o_Colour_On = 1'b1;
            end
          else
            begin
                o_Colour_On = 1'b0;
            end  
        end

endmodule