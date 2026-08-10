`timescale 1ns/1ps

module tb_synchronous_counter;

    parameter WIDTH = 4;

    reg clk;
    reg reset;
    reg enable;

    wire [WIDTH-1:0] count;

    // Instantiate the counter
    synchronous_counter #(
        .WIDTH(WIDTH)
    ) uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        reset  = 1'b1;
        enable = 1'b0;

        // Reset counter
        #10;
        reset = 1'b0;

        // Enable counting
        enable = 1'b1;
        #50;

        // Disable counting
        enable = 1'b0;
        #20;

        // Enable counting again
        enable = 1'b1;
        #30;

        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t | Reset = %b | Enable = %b | Count = %d",
                 $time, reset, enable, count);
    end

endmodule