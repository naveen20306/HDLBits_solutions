# Vector3 – Vector Concatenation and Splitting

## Overview

This module provides practice with Verilog's **concatenation** and **bit slicing** features. It demonstrates how multiple smaller input vectors can be combined into a wider vector, then distributed into fixed-size output vectors.

## Functional Requirements

- **Inputs**: Six 5-bit input vectors: `a`, `b`, `c`, `d`, `e`, and `f` (total: 30 bits)
- **Outputs**: Four 8-bit output vectors: `w`, `x`, `y`, and `z` (total: 32 bits)

The outputs must represent the concatenation of all six input vectors followed by two `1` bits, split into four 8-bit segments:

{w, x, y, z} = {a, b, c, d, e, f, 2'b11}


## Key Concepts

- **Concatenation Operator `{}`**:
  - Used to merge multiple smaller vectors into a single wider vector.
  - Each component must have a clearly defined width.

- **Bit Slicing**:
  - Assigning portions of a larger vector to smaller output vectors using part-select or indexed concatenation.

- **Assignment Symmetry**:
  - Be cautious when assigning vectors of different sizes — left-hand and right-hand sides must align in bit-width.

## Applications

- Rearranging or packaging data across modules
- Designing serializers or deserializers
- Memory-mapped register formatting
- Building structured bitstreams for communication interfaces

## Reference

Problem Source: [HDLBits – Vector3](https://hdlbits.01xz.net/wiki/Vector3)  
Diagram: ![Vector3 Diagram](https://hdlbits.01xz.net/mw/images/0/0c/Vector3.png)

## Keywords

Verilog, Concatenation, Bit Slicing, Vector Packing, HDLBits, Digital Design

