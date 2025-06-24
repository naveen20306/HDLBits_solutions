# 🔁 mt2015_q4a – XOR-AND Logic

## 📘 Problem Statement

This problem is adapted from the **2015 midterm exam**, Question 4.

You are asked to implement a **simple combinational logic function** using basic gates.

### 🎯 Objective

Design a module that performs the following logic:

```
z = (x ^ y) & x
```

### 📥 Inputs:
- `x`: 1-bit input  
- `y`: 1-bit input

### 📤 Output:
- `z`: Output of the logic expression `(x XOR y) AND x`

---

## 💡 Concept Used

- **XOR Gate (`^`)** returns 1 if inputs differ
- **AND Gate (`&`)** returns 1 if both inputs are 1

So:
- `z = 1` only when `x = 1` and `y = 0`

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input x,
    input y,
    output z
);
```

---

## 🔗 HDLBits Page

[HDLBits – mt2015_q4a](https://hdlbits.01xz.net/wiki/Mt2015_q4a)

---

## 💡 Applications

- Gate-level analysis
- Logic simplification practice
- Exam preparation (bitwise operations)

---

## 👨‍💻 Author

**Naveen Kumar B**
