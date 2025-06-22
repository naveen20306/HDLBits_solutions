# Vectorr – Bit Reversal in an 8-bit Vector

## Overview

This module performs a **bit-level reversal** of an 8-bit input vector. That is, the most significant bit becomes the least significant, and vice versa.

## Functional Requirements

- **Input**: `in[7:0]` — an 8-bit input vector
- **Output**: `out[7:0]` — an 8-bit output vector with reversed bit order

### Bit Mapping:

| Input Bit | Output Bit |
|-----------|-------------|
| in[7]     | out[0]      |
| in[6]     | out[1]      |
| in[5]     | out[2]      |
| in[4]     | out[3]      |
| in[3]     | out[4]      |
| in[2]     | out[5]      |
| in[1]     | out[6]      |
| in[0]     | out[7]      |

## Key Concepts

- **Bit Reversal**:
  - Often used in signal processing, communication protocols, and bitstream manipulation.
  - Verilog does not allow reversing vector indices directly (e.g., `in[0:7]` is invalid), so explicit rearrangement is required.

- **Concatenation Operator**:
  - Enables efficient reordering of bits in a single assignment using `{}` notation.

## Applications

- Bitstream transformations in hardware accelerators
- Endianness and bit-order conversions
- Hardware implementations of algorithms like FFT or CRC

## Keywords

Verilog, Bit Reversal, Vector Manipulation, Concatenation, HDLBits, Digital Design
