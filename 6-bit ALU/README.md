# 6-Bit ALU Using Verilog HDL

## 📌 Project Overview

This project implements a **6-bit Arithmetic Logic Unit (ALU)** using **Verilog HDL**.

An ALU is a digital circuit that performs arithmetic and logical operations on binary data. This 6-bit ALU accepts two 6-bit inputs and uses a 3-bit opcode to select the required operation.

## ⚙️ Features

The ALU supports the following operations:

| Opcode | Operation | Description |
| :----: | :-------: | ----------- |
|  `000` |    ADD    | `A + B`     |
|  `001` |    SUB    | `A - B`     |
|  `010` |    AND    | `A & B`     |
|  `011` |     OR    | `A \| B`    |
|  `100` |    XOR    | `A ^ B`     |
|  `101` |    NOT    | `~A`        |
|  `110` |    INC    | `A + 1`     |
|  `111` |    DEC    | `A - 1`     |

## 🔌 Inputs and Outputs

### Inputs

* `A [5:0]` – 6-bit first operand
* `B [5:0]` – 6-bit second operand
* `opcode [2:0]` – 3-bit operation selector

### Outputs

* `result [5:0]` – 6-bit ALU result
* `carry` – Carry output for arithmetic operations
* `zero` – Indicates whether the result is zero

## 📂 Project Structure

```text
6-bit-ALU/
│
├── alu_6bit.v
├── alu_6bit_tb.v
└── README.md
```

## 💻 Verilog Code

### ALU Module

```verilog
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
            // NOT
            result = ~A;
        end

        3'b110: begin
            // Increment
            result = A + 1'b1;
        end

        3'b111: begin
            // Decrement
            result = A - 1'b1;
        end

    endcase
end

assign zero = (result == 6'b000000);

endmodule