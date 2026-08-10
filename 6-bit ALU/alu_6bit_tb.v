`timescale 1ns/1ps

module alu_6bit_tb;

    reg  [5:0] A;
    reg  [5:0] B;
    reg  [2:0] opcode;

    wire [5:0] result;
    wire       carry;
    wire       zero;

    // Instantiate ALU
    alu_6bit uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .carry(carry),
        .zero(zero)
    );

    initial begin

        $monitor("Time=%0t | A=%d | B=%d | Opcode=%b | Result=%d | Carry=%b | Zero=%b",
                 $time, A, B, opcode, result, carry, zero);

        // Addition: 10 + 5 = 15
        A = 6'd10;
        B = 6'd5;
        opcode = 3'b000;
        #10;

        // Subtraction: 10 - 5 = 5
        opcode = 3'b001;
        #10;

        // AND
        A = 6'b101010;
        B = 6'b110011;
        opcode = 3'b010;
        #10;

        // OR
        opcode = 3'b011;
        #10;

        // XOR
        opcode = 3'b100;
        #10;

        // NOT A
        opcode = 3'b101;
        #10;

        // Increment
        A = 6'd20;
        opcode = 3'b110;
        #10;

        // Decrement
        A = 6'd20;
        opcode = 3'b111;
        #10;

        $finish;
    end

endmodule