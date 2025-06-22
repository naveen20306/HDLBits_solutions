# Vector5 – Pairwise Bit Comparisons Using Replication and Concatenation

## Overview

This module performs **pairwise equality checks** among five 1-bit input signals using a compact and systematic approach enabled by Verilog's **replication** and **concatenation** operators.

## Functional Requirements

- **Inputs**: Five 1-bit signals — `a`, `b`, `c`, `d`, `e`
- **Output**: A 25-bit output vector `out[24:0]`, where each bit represents the result of comparing two of the inputs.

Each `out[i]` is set to `1` if the corresponding pair of bits are equal, and `0` otherwise.

### Output Structure:

The output vector stores all 25 possible comparisons between the inputs in the following layout:

out[24] = (a == a)
out[23] = (a == b)
out[22] = (a == c)
...
out[1] = (e == d)
out[0] = (e == e)


This results in a total of 5 × 5 = 25 comparisons.

## Key Concepts

- **Equality Check**: Performed using bitwise XOR (`^`) and inversion (`~`), since `(x == y)` is logically equivalent to `~(x ^ y)`.
- **Concatenation `{}`**: Used to group inputs or results into a larger vector.
- **Replication `{N{...}}`**: Enables repeating a signal or vector `N` times efficiently.

## Diagram

Visual representation of the signal comparison layout:  
![Vector5 Diagram](https://hdlbits.01xz.net/mw/images/a/ac/Vector5.png)

## Applications

- Logic validation and signal comparison in verification tasks
- Generating match matrices for signal correlation
- Foundations for building equality-checking hardware blocks

## Keywords

Verilog, Bit Comparison, Replication, Concatenation, Equality Check, HDLBits, Digital Design
