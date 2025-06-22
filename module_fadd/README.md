```markdown
# Module fadd – 32-bit Adder Using Hierarchical Full Adders

## 🧠 Overview

This exercise deepens the concept of **hierarchical design in Verilog** by constructing a **32-bit ripple-carry adder** using three levels of modules. You will implement a basic 1-bit **full adder (`add1`)**, which will be used to build a 16-bit adder (`add16`), and then use two `add16` instances in a `top_module` to complete the full 32-bit addition.

## 🔧 Functional Requirements

### ✅ Provided Module

```verilog
module add16 (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output [15:0] sum,
    output        cout
);
```

This module internally uses 16 instances of a **1-bit full adder**, which **you must define** as `add1`.

---

### ✅ Your Tasks

#### 1. `add1` – Full Adder Module

```verilog
module add1 (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
```

- Computes: `sum = a ^ b ^ cin`
- Computes: `cout = (a & b) | (b & cin) | (a & cin)`

#### 2. `add16` – 16-bit Adder

- Already provided.
- Internally instantiates **16 instances of `add1`**.
- Performs `a + b + cin` for 16-bit vectors.

#### 3. `top_module` – 32-bit Adder

- Instantiates two `add16` modules:
  - First `add16` computes the **lower 16 bits** of the sum.
  - Second `add16` computes the **upper 16 bits**, using the carry-out from the first as carry-in.

---

### Signal Summary

| Module     | Input A          | Input B          | Carry-in     | Output Sum     | Carry-out |
|------------|------------------|------------------|--------------|----------------|-----------|
| `add16_l`  | a[15:0]          | b[15:0]          | 1'b0         | sum[15:0]      | carry     |
| `add16_h`  | a[31:16]         | b[31:16]         | carry        | sum[31:16]     | ignored   |

### Example Wire Declarations:

```verilog
wire [15:0] sum_low, sum_high;
wire carry;
```

---

## 📚 Key Concepts

- **Full Adder Logic**:
  - The building block of binary addition: computes one-bit sum and carry-out.

- **Module Reusability & Nesting**:
  - Demonstrates how small logic units (add1) can be scaled into large systems (32-bit adder).

- **Hierarchical Design**:
  - `add1` → `add16` → `top_module` reflects scalable, layered design principles.

- **Carry Propagation**:
  - Essential for ripple-carry adder correctness across module boundaries.

---

## 🖼️ Diagram

Hierarchical view of full adder-based 32-bit design:  
![Module fadd Diagram](https://hdlbits.01xz.net/mw/images/f/f3/Module_fadd.png)

---

## 💡 Applications

- Designing arithmetic units (ALUs) from the ground up  
- Understanding digital hierarchy and reuse  
- Practical implementation of full adders and multi-bit addition

---

## 🔑 Keywords

Verilog, Full Adder, add1, add16, 32-bit Adder, Ripple-Carry, Hierarchical Design, Module Instantiation, HDLBits
```
