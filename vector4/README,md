# Vector4 – Sign Extension Using the Replication Operator

## Overview

This module demonstrates the use of the **replication operator** in Verilog to perform **sign extension** — a common technique in digital systems for preserving the value of signed numbers when increasing their bit-width.

## Functional Requirements

- **Input**: `in[7:0]` — an 8-bit signed number
- **Output**: `out[31:0]` — a 32-bit signed number produced by sign-extending `in`

### Objective:
Replicate the sign bit (`in[7]`) **24 times** and concatenate it with the original 8-bit input to form the 32-bit output.

out = {24 copies of in[7], in[7:0]}


## Key Concepts

- **Replication Operator `{N{vector}}`**:
  - Allows a vector to be repeated `N` times.
  - Reduces verbosity and improves clarity, especially in repetitive assignments.

- **Sign Extension**:
  - Maintains the signed value of a number when increasing its bit-width.
  - Critical in arithmetic operations, data path design, and instruction decoding.

### Example:

| Input (Binary) | Input (Decimal) | Output (Binary)                             | Output (Decimal) |
|----------------|------------------|---------------------------------------------|------------------|
| `8'b01010101`  | 85               | `00000000_00000000_00000000_01010101`       | 85               |
| `8'b11111101`  | -3               | `11111111_11111111_11111111_11111101`       | -3               |

## Applications

- Data path design in processors (e.g., extending immediate values)
- Arithmetic logic units (ALUs)
- Signed/unsigned conversion in embedded systems
- Memory address calculations in instruction sets

## Keywords

Verilog, Sign Extension, Replication Operator, Concatenation, HDLBits, Bit Manipulation, Digital Design
