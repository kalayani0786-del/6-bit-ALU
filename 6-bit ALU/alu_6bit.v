module alu_6bit (
    input  [5:0] A,
    input  [5:0] B,
    input  [2:0] opcode,
    output reg [5:0] result,
    output reg       carry,
    output          zero
);

always @(*) begin
    result = 6'b000000;
    carry  = 1'b0;

    case (opcode)

        3'b000: begin
            // Addition
            {carry, result} = A + B;
        end

        3'b001: begin
            // Subtraction
            result = A - B;
        end

        3'b010: begin
            // AND
            result = A & B;
        end

        3'b011: begin
            // OR
            result = A | B;
        end

        3'b100: begin
            // XOR
            result = A ^ B;
        end

        3'b101: begin
            // NOT A
            result = ~A;
        end

        3'b110: begin
            // Increment A
            result = A + 1'b1;
        end

        3'b111: begin
            // Decrement A
            result = A - 1'b1;
        end

    endcase
end

// Zero flag
assign zero = (result == 6'b000000);

endmodule