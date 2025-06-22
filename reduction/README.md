# 🧠 Reduction – Even Parity Bit Generator

## 🔍 Overview

This exercise introduces the use of **Verilog reduction operators** to efficiently perform logic operations across all bits of a vector. Rather than chaining individual bitwise operations like `a[0] & a[1] & ...`, you can reduce a vector using a single operator like `&a`, `|a`, or `^a`.

You will design a circuit that computes an **even parity bit** for an 8-bit input using the **XOR (`^`) reduction operator**.

---

## 📐 Functional Requirements

- **Input:**  
  - `in`: 8-bit input vector (a byte)

- **Output:**  
  - `parity`: 1-bit even parity output

- **Behavior:**  
  - The `parity` output is the XOR of all bits in `in`  
  - In **even parity**, the total number of 1s in `{in, parity}` is even  
  - That means:
    - If `in` has an **odd** number of 1s → `parity = 1`  
    - If `in` has an **even** number of 1s → `parity = 0`

---

## 📥 Port Definition

```verilog
input  [7:0] in;
output       parity;
```

---

## ✅ Implementation Example

```verilog
module top_module (
    input  [7:0] in,
    output       parity
);

    assign parity = ^in;  // XOR reduction across all 8 bits

endmodule
```

> ✅ The `^in` is a **reduction XOR**, computing the parity of all bits in the vector. It's concise, efficient, and synthesizes cleanly in hardware.

---

## 📚 Key Concepts

- **Reduction Operators in Verilog:**
  - `&a[3:0]` → AND reduction → `a[0] & a[1] & a[2] & a[3]`
  - `|b[3:0]` → OR reduction  → `b[0] | b[1] | b[2] | b[3]`
  - `^c[2:0]` → XOR reduction → `c[0] ^ c[1] ^ c[2]`

- **Even Parity:**
  - Ensures total 1s in the data (including the parity bit) is even
  - Common in communication protocols for simple error detection

- **Unary Operator Use:**
  - `^in` is short for "reduction XOR across all bits of `in`"
  - You can also negate results for NOR, NAND, XNOR using `~&`, `~|`, `~^`

---

## 💡 Applications

- Error detection in serial communication  
- Parity checkers and generators  
- Hamming codes and ECC  
- Digital fault-tolerant designs

---

## 🔑 Keywords

Verilog, Reduction Operators, XOR, Even Parity, Bitwise Logic, Error Detection, HDLBits, Data Integrity, Unary Operators
