# 4-Bit Shift Register Using Verilog HDL

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![Digital Design](https://img.shields.io/badge/Design-Digital%20Logic-green)
![Simulation](https://img.shields.io/badge/Simulation-Verified-success)

## 📌 Overview

This project implements a **4-bit Serial-In Parallel-Out (SIPO) Shift Register** using **Verilog HDL**.

A shift register is a sequential logic circuit used to store and shift binary data. In this design, serial input data is shifted into the register on every rising edge of the clock, and the stored data is available as a 4-bit parallel output.

The project contains both the **RTL design** and a **Verilog testbench** for simulation and verification.

## ✨ Features

* 4-bit shift register
* Serial data input
* 4-bit parallel output
* Clock-based shifting
* Reset functionality
* Verilog RTL implementation
* Simulation testbench included

## 🧩 Block Diagram

```text
                  Serial Input
                       │
                       ▼
                 ┌───────────┐
          CLK ──►│   FF0     │
                 └─────┬─────┘
                       │
                       ▼
                 ┌───────────┐
          CLK ──►│   FF1     │
                 └─────┬─────┘
                       │
                       ▼
                 ┌───────────┐
          CLK ──►│   FF2     │
                 └─────┬─────┘
                       │
                       ▼
                 ┌───────────┐
          CLK ──►│   FF3     │
                 └─────┬─────┘
                       │
                       ▼
                Parallel Output
                    Q[3:0]
```

## ⚙️ Working Principle

The shift register operates on the **positive edge of the clock**.

On every rising edge of `clk`, the register shifts its existing data by one position and accepts the new serial input:

```verilog
q <= {q[2:0], serial_in};
```

When `reset` is active, the register is cleared:

```verilog
q <= 4'b0000;
```

### Example

If the serial input sequence is:

```text
1 → 0 → 1 → 1
```

the register output changes as follows:

| Clock Cycle | Serial Input | Register Output |
| ----------: | -----------: | --------------: |
|       Reset |            0 |          `0000` |
|           1 |            1 |          `0001` |
|           2 |            0 |          `0010` |
|           3 |            1 |          `0101` |
|           4 |            1 |          `1011` |

Final output:

```text
Q = 1011
```

## 📂 Project Structure

```text
shift-register/
│
├── rtl/
│   └── shift_register.v
│
├── tb/
│   └── shift_register_tb.v
│
└── README.md
```

## 🧪 Simulation