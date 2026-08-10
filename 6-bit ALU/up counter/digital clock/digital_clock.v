//============================================================
// Digital Clock - Verilog
// Clock Frequency : 50 MHz
// Time Format     : HH:MM:SS (24-hour)
//============================================================

module digital_clock (
    input  wire clk,
    input  wire reset,

    output reg [3:0] hour_tens,
    output reg [3:0] hour_ones,
    output reg [3:0] min_tens,
    output reg [3:0] min_ones,
    output reg [3:0] sec_tens,
    output reg [3:0] sec_ones
);

    // 50 MHz input clock
    parameter CLK_FREQ = 50_000_000;

    reg [25:0] counter;

    //========================================================
    // Clock Divider: 50 MHz -> 1 Hz
    //========================================================

    always @(posedge clk) begin
        if (reset) begin
            counter <= 26'd0;
        end
        else if (counter == CLK_FREQ - 1) begin
            counter <= 26'd0;
        end
        else begin
            counter <= counter + 1'b1;
        end
    end

    //========================================================
    // Digital Clock
    //========================================================

    always @(posedge clk) begin

        if (reset) begin
            hour_tens <= 4'd0;
            hour_ones <= 4'd0;
            min_tens  <= 4'd0;
            min_ones  <= 4'd0;
            sec_tens  <= 4'd0;
            sec_ones  <= 4'd0;
        end

        else if (counter == CLK_FREQ - 1) begin

            // Seconds
            if (sec_ones < 4'd9) begin
                sec_ones <= sec_ones + 1'b1;
            end
            else begin
                sec_ones <= 4'd0;

                if (sec_tens < 4'd5) begin
                    sec_tens <= sec_tens + 1'b1;
                end
                else begin
                    sec_tens <= 4'd0;

                    // Minutes
                    if (min_ones < 4'd9) begin
                        min_ones <= min_ones + 1'b1;
                    end
                    else begin
                        min_ones <= 4'd0;

                        if (min_tens < 4'd5) begin
                            min_tens <= min_tens + 1'b1;
                        end
                        else begin
                            min_tens <= 4'd0;

                            // Hours
                            if ((hour_tens == 4'd2) &&
                                (hour_ones == 4'd3)) begin

                                // 23:59:59 -> 00:00:00
                                hour_tens <= 4'd0;
                                hour_ones <= 4'd0;

                            end
                            else if (hour_ones < 4'd9) begin

                                hour_ones <= hour_ones + 1'b1;

                            end
                            else begin

                                hour_ones <= 4'd0;
                                hour_tens <= hour_tens + 1'b1;

                            end
                        end
                    end
                end
            end
        end
    end

endmodule