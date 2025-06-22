# VectorGates - Bitwise and Logical Operations on Vectors

## Overview

This module performs multiple logical operations on two 3-bit input vectors. It demonstrates the distinction between **bitwise** and **logical** operations in Verilog when applied to vectors.

## Functional Requirements

Given two 3-bit input vectors `a` and `b`, the module performs the following:

- Computes the **bitwise OR** (`a | b`), resulting in a 3-bit output.
- Computes the **logical OR** (`a || b`), treating each vector as a single boolean value and producing a 1-bit output.
- Computes the **bitwise NOT** (inversion) of both vectors.
  - The inverse of `b` is placed in the upper half of a 6-bit output (`out_not[5:3]`).
  - The inverse of `a` is placed in the lower half (`out_not[2:0]`).

## Key Concepts

- **Bitwise OR (`|`)**:
  - Operates on corresponding bits of two vectors.
  - Output is a vector of the same size.
- **Logical OR (`||`)**:
  - Evaluates whether either vector is non-zero.
  - Output is a single-bit value (1 or 0).
- **Bitwise NOT (`~`)**:
  - Inverts each bit in the vector.

These operations are fundamental in digital logic and Verilog-based hardware design.

## Applications

- Understanding how vectors behave in bitwise vs. logical expressions.
- Demonstrating how partial vector manipulation is done using slicing and concatenation.
- Building foundational logic for ALUs and control circuits.

## Reference

Problem Source: [HDLBits – VectorGates](https://hdlbits.01xz.net/wiki/Vectorgates)  
Diagram: ![Vectorgates Diagram](https://hdlbits.01xz.net/mw/images/1/1b/Vectorgates.png)

## Keywords

Verilog, Bitwise OR, Logical OR, Vector Inversion, HDLBits, Digital Logic
