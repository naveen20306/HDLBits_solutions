# Gates4 – Multi-Input Logic Gates

## Overview

This module implements three fundamental logic gate operations — AND, OR, and XOR — across a 4-bit input vector. It demonstrates how multiple input signals can be combined using reduction operators.

## Functional Requirements

Given a 4-bit input vector `in[3:0]`, the circuit generates three outputs:

- **out_and**: Logical AND of all 4 input bits  
- **out_or**: Logical OR of all 4 input bits  
- **out_xor**: Logical XOR of all 4 input bits

These outputs are computed using 4-input logic gates, which reduce the vector into a single-bit result.

## Key Concepts

- **Reduction AND (`&`)**: Produces `1` only if all bits are `1`.
- **Reduction OR (`|`)**: Produces `1` if at least one bit is `1`.
- **Reduction XOR (`^`)**: Produces `1` if there is an odd number of `1`s.

These operations are essential in hardware design for condition checking, parity computation, and logic optimization.

## Applications

- Parity generation and error detection (using XOR)
- Control logic for enabling or disabling subsystems
- Aggregated signal evaluation in combinational circuits

## Keywords

Verilog, Reduction Operators, AND, OR, XOR, Multi-input Logic, HDLBits, Digital Circuits
