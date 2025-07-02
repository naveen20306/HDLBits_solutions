# 🧮 Kmap1 – 3-Variable Karnaugh Map Logic

## 📘 Problem Statement

Implement a combinational circuit described by the following **3-variable Karnaugh map**:

![K-map](https://hdlbits.01xz.net/mw/images/2/20/Kmap1.png)

You're encouraged to simplify the function using **Sum of Products (SOP)** or **Product of Sums (POS)** forms. The goal is to derive a minimal expression that replicates the K-map behavior and implement it using basic logic gates.

---

## ✅ Inputs and Output

- **Inputs**:
  - `a`, `b`, `c`: Single-bit inputs

- **Output**:
  - `out`: Output derived from the logic equation

---

## 🖥️ Module Declaration

```verilog
module top_module(
    input a,
    input b,
    input c,
    output out
);
```
---

## 🧠 Concepts Reinforced

- Karnaugh map simplification
- SOP/POS form analysis
- Using minimal logic in Verilog

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
