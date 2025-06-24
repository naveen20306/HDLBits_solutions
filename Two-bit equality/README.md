# 🔁 mt2015_eq2 – 2-bit Equality Comparison

## 📘 Problem Statement

This problem is based on a **2015 midterm exam** question.  
You are required to build a combinational circuit that compares **two 2-bit inputs** and sets the output high if they are **equal**.

### 🎯 Objective

- Inputs:  
  - `A[1:0]`: First 2-bit input  
  - `B[1:0]`: Second 2-bit input  
- Output:  
  - `z = 1` if `A == B`  
  - `z = 0` otherwise  

---

## 💡 Concept Used

- **Bitwise comparison** using **XOR**:
  - XOR outputs `0` if two bits are equal.
  
---

## 🖥️ Module Declaration

```verilog
module top_module (
    input  [1:0] A,
    input  [1:0] B,
    output       z
);
```

---

## 🔗 HDLBits Page

[HDLBits – mt2015_eq2](https://hdlbits.01xz.net/wiki/Mt2015_eq2)

---

## 💡 Applications

- Digital comparator design  
- Base logic for ALUs and decision-making logic  
- Practice with **bitwise** operations in Verilog  

---

## 👨‍💻 Author

**Naveen Kumar B**
