`timescale 1ns/1ps

module up_counter_tb;

    parameter WIDTH = 4;

    reg clk;
    reg reset;
    reg enable;

    wire [WIDTH-1:0] count;

    // Instantiate the counter
    up_counter #(
        .WIDTH(WIDTH)
    ) uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        enable = 0;

        // Apply reset
        #10;
        reset = 0;

        // Enable counting
        #10;
        enable = 1;

        // Allow counter to run
        #100;

        // Disable counting
        enable = 0;
        #20;

        // Reset counter again
        reset = 1;
        #10;
        reset = 0;

        #20;

        $finish;
    end

    // Monitor counter
    initial begin
        $monitor("Time = %0t | Reset = %b | Enable = %b | Count = %d",
                 $time, reset, enable, count);
    end

endmodule