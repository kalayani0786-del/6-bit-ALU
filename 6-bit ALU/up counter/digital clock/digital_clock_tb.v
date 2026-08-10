`timescale 1ns/1ps

module digital_clock_tb;

    reg clk;
    reg reset;

    wire [3:0] hour_tens;
    wire [3:0] hour_ones;
    wire [3:0] min_tens;
    wire [3:0] min_ones;
    wire [3:0] sec_tens;
    wire [3:0] sec_ones;

    //========================================================
    // Instantiate Digital Clock
    //========================================================

    digital_clock #(
        .CLK_FREQ(10)
    ) uut (
        .clk(clk),
        .reset(reset),

        .hour_tens(hour_tens),
        .hour_ones(hour_ones),
        .min_tens(min_tens),
        .min_ones(min_ones),
        .sec_tens(sec_tens),
        .sec_ones(sec_ones)
    );

    //========================================================
    // Clock Generation
    //========================================================

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    //========================================================
    // Test
    //========================================================

    initial begin

        reset = 1;

        #20;

        reset = 0;

        // Run simulation
        #10000;

        $finish;

    end

    //========================================================
    // Display Time
    //========================================================

    always @(posedge clk) begin
        $display(
            "Time = %d%d:%d%d:%d%d",
            hour_tens,
            hour_ones,
            min_tens,
            min_ones,
            sec_tens,
            sec_ones
        );
    end

endmodule