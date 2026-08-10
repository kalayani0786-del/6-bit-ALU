# Verilog Up Counter

A parameterized synchronous up counter designed using Verilog HDL.

## Features

* Synchronous active-high reset
* Enable control
* Parameterized counter width
* Synthesizable RTL
* Includes a Verilog testbench

## Project Structure

```text
verilog-up-counter/
├── rtl/
│   └── up_counter.v
├── tb/
│   └── up_counter_tb.v
└── README.md
```

## Module Interface

| Signal   | Direction | Description                   |
| -------- | --------- | ----------------------------- |
| `clk`    | Input     | Clock signal                  |
| `reset`  | Input     | Active-high synchronous reset |
| `enable` | Input     | Enables counting              |
| `count`  | Output    | Current counter value         |

## Operation

When `reset` is high, the counter is set to zero on the next rising clock edge.

When `reset` is low and `enable` is high, the counter increments by one on every rising clock edge.

When `enable` is low, the counter holds its current value.

For a 4-bit counter, the sequence is:

```text
0000 → 0001 → 0010 → 0011 → ... → 1111 → 0000
```

The counter naturally wraps around when the maximum value is reached.

## Example

For `WIDTH = 4`:

```text
Reset = 1  → Count = 0
Reset = 0
Enable = 1 → Count increments every clock
Enable = 0 → Count holds
```

## Simulation