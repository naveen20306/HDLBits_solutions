```markdown
# Module add – Building a 32-bit Adder Using Two 16-bit Adders

## 🧠 Overview

This exercise focuses on **hierarchical module design** by creating a **32-bit adder** using two instances of a provided **16-bit adder module**. You will chain the two `add16` modules together so that the lower 16 bits are calculated first, and their carry-out is passed to the upper 16-bit stage.

## 🔧 Functional Requirements

You are provided with the following 16-bit adder module:

```verilog
module add16 (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output [15:0] sum,
    output        cout
);
```

### Your Task:

- Instantiate **two `add16` modules**.
- The **first adder** (low) adds the **lower 16 bits** of the inputs `a[15:0]` and `b[15:0]` with `cin = 0`.
- The **second adder** (high) adds the **upper 16 bits** of `a[31:16]` and `b[31:16]`, using the **carry-out** from the first adder as `cin`.
- Combine both results to produce a full **32-bit sum** output.
- Final carry-out can be ignored.

### Internal Wiring:

```verilog
wire [15:0] sum_low, sum_high;
wire carry;
```

### Connection Summary:

| Stage         | Inputs                      | Output       |
|---------------|-----------------------------|--------------|
| Adder #1 (low)| a[15:0], b[15:0], cin = 0    | sum_low, carry |
| Adder #2 (high)| a[31:16], b[31:16], cin = carry | sum_high     |
| Final Output  | sum = {sum_high, sum_low}   |              |

## 📚 Key Concepts

- **Hierarchical Module Reuse**:
  - Breaking down a larger operation using smaller reusable units.

- **Carry Propagation**:
  - Essential when chaining adders in multi-bit arithmetic.

- **Bit Slicing**:
  - Operate on specific ranges of bit vectors using `a[15:0]` and `a[31:16]`.

- **Wire Declarations**:
  - Required for interconnecting submodules internally.

## 🖼️ Diagram

Visual structure of the chained 16-bit adders forming a 32-bit adder:  
![Module Add Diagram](https://hdlbits.01xz.net/mw/images/a/a3/Module_add.png)

## 💡 Applications

- Scalable arithmetic design in ALUs and CPUs  
- Understanding carry-chaining in ripple carry adders  
- Practicing structural Verilog with modular components

## 🔑 Keywords

Verilog, 32-bit Adder, add16, Ripple-Carry Adder, Module Instantiation, Hierarchical Design, Bit-Slicing, HDLBits
```
