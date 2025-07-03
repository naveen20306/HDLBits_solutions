# 🎓 Exams/ece241 2013 q2 – SOP & POS Minimization

## 📘 Problem Statement

Design a combinational digital logic system with **four inputs** (`a`, `b`, `c`, `d`) and **two outputs**:
- `out_sop`: Output in **minimum Sum of Products (SOP)** form.
- `out_pos`: Output in **minimum Product of Sums (POS)** form.

The output must be logic-1 when the input corresponds to **2, 7, or 15**.  
It must be logic-0 when the input corresponds to **0, 1, 4, 5, 6, 9, 10, 13, or 14**.  
The inputs **3, 8, 11, and 12** are unspecified and **don’t-care** conditions.

---

## ✅ Inputs and Outputs

- **Inputs**:  
  - `a`, `b`, `c`, `d`: 1-bit inputs representing a 4-bit binary number

- **Outputs**:  
  - `out_sop`: Logic output derived from the minimized **Sum of Products**
  - `out_pos`: Logic output derived from the minimized **Product of Sums**

---

## 🧠 Minterms and Maxterms

| Decimal | Binary  | Output |
|---------|---------|--------|
| 0       | 0000    | 0      |
| 1       | 0001    | 0      |
| 2       | 0010    | 1 ✅   |
| 3       | 0011    | X (don’t-care) |
| 4       | 0100    | 0      |
| 5       | 0101    | 0      |
| 6       | 0110    | 0      |
| 7       | 0111    | 1 ✅   |
| 8       | 1000    | X (don’t-care) |
| 9       | 1001    | 0      |
| 10      | 1010    | 0      |
| 11      | 1011    | X (don’t-care) |
| 12      | 1100    | X (don’t-care) |
| 13      | 1101    | 0      |
| 14      | 1110    | 0      |
| 15      | 1111    | 1 ✅   |

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
);
```
---
## 🧩 Concepts Reinforced

- Karnaugh Map (K-Map) simplification
- Don't-care conditions
- SOP and POS canonical and minimal forms
- Boolean logic design and synthesis

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
