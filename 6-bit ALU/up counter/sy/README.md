# Synchronous Counter in Verilog

## Overview

This project implements a parameterized **synchronous up counter** using Verilog HDL.

A synchronous counter changes its output only on the active edge of the clock. In this design, the counter increments on every positive edge of `clk` when `enable` is high.

## Features

* Synchronous operation
* Positive-edge triggered
* Synchronous reset
* Enable control
* Parameterized counter width
* Includes a Verilog testbench

## Inputs and Outputs

| Signal   | Direction | Description                   |
| -------- | --------- | ----------------------------- |
| `clk`    | Input     | Clock signal                  |
| `reset`  | Input     | Synchronous active-high reset |
| `enable` | Input     | Enables counting              |
| `count`  | Output    | Current counter value         |

## Working Principle

At every positive edge of the clock:

1. If `reset` is high, the counter is cleared to `0`.
2. If `reset` is low and `enable` is high, the counter increments by `1`.
3. If `enable` is low, the counter holds its current value.

The counter automatically rolls over to zero when its maximum value is reached.

For example, with a 4-bit counter:

```text
0000 → 0001 → 0010 → 0011 → ... → 1111 → 0000
```

## File Structure

```text
Synchronous-Counter/
│
├── synchronous_counter.v
├── tb_synchronous_counter.v
└── README.md
```

## Simulation