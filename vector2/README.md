# Vector2 - Byte Reversal in a 32-bit Vector

## Overview

This module implements a byte-reversal operation on a 32-bit input vector. The goal is to reverse the order of the four 8-bit bytes within the word.

### Byte layout transformation:

Input : `[31:24] [23:16] [15:8] [7:0]` → A B C D  
Output: `[31:24] [23:16] [15:8] [7:0]` → D C B A

This operation is commonly required when converting data between systems with different endianness formats, such as between little-endian (used in x86 processors) and big-endian (used in networking protocols and embedded systems).

## Module Definition

```verilog
module top_module (
    input  [31:0] in,
    output [31:0] out
);
