# ➕ Exams/ece241_2014_q1c – 8-bit Signed Adder with Overflow Detection

## 📘 Problem Statement

You are given two **8-bit 2's complement signed integers**, `a[7:0]` and `b[7:0]`. The goal is to:

- **Add** the two numbers to get an 8-bit result `s[7:0]`.
- **Detect signed overflow** during the addition operation and output it as `overflow`.

---

## ✅ Inputs and Output

- **Inputs**:
  - `a`: 8-bit 2's complement integer
  - `b`: 8-bit 2's complement integer

- **Outputs**:
  - `s`: 8-bit sum of `a + b`
  - `overflow`: High (`1`) if signed overflow occurs

---

## ⚠️ Overflow Explanation

A **signed overflow** occurs if:

- Adding two **positive** numbers results in a **negative** number
- Adding two **negative** numbers results in a **positive** number

In terms of sign bits (`a[7]`, `b[7]`, and `s[7]`):

```text
overflow = (a[7] == b[7]) && (s[7] != a[7])
```

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);
```

---

## 💡 Implementation Insight

```verilog
assign s = a + b;
assign overflow = (a[7] == b[7]) && (s[7] != a[7]);
```

This checks if `a` and `b` have the same sign and whether the result `s` flipped sign unexpectedly, which indicates overflow in signed addition.

---

## 🧩 Concepts Reinforced

- Signed arithmetic in 2's complement
- Overflow detection logic
- Bitwise comparison of sign bits

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
