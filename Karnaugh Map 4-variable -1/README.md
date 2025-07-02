# 🧮 Kmap2 – 4-Variable Karnaugh Map Logic

## 📘 Problem Statement

Implement a combinational circuit described by the following **4-variable Karnaugh map**:

![K-map](https://hdlbits.01xz.net/mw/images/4/4d/Kmap2.png)

You are expected to simplify the Boolean function from the map using **Sum of Products (SOP)** or **Product of Sums (POS)**. The implementation should match the logical behavior of the map, not necessarily the minimal form.

---

## ✅ Inputs and Output

- **Inputs**:
  - `a`, `b`, `c`, `d`: Single-bit inputs

- **Output**:
  - `out`: Output derived from the logic function

---

## 🖥️ Module Declaration

```verilog
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out
);
```

## 🧩 Concepts Reinforced

- 4-variable K-map interpretation
- SOP and POS Boolean simplification
- Efficient logic implementation using `assign`

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
