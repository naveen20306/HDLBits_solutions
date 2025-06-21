# Wire4

## Problem Description

Create a Verilog module with 3 inputs and 4 outputs that behaves like direct wire connections:

- `a` → `w`
- `b` → `x` and `y`
- `c` → `z`

### Diagram:
![Wire4 Diagram](https://hdlbits.01xz.net/mw/images/1/15/Wire4.png)

## Verilog Specification

- **Inputs**: `a`, `b`, `c`
- **Outputs**: `w`, `x`, `y`, `z`
- **Behavior**: Simple continuous assignments using `assign` statements

## Notes

- `assign` statements define **permanent wire connections**.
- All `input` and `output` ports are implicitly of type `wire`.
- The **order** of assign statements does not matter in Verilog.

