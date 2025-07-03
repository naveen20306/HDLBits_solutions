# 🧮 Exams/m2014 q3 – K-Map Logic Function Implementation

## 📘 Problem Statement

You are given a logic function `f` defined by the following **Karnaugh map**:  
📸 [View K-map](https://hdlbits.01xz.net/mw/images/a/a2/Exams_m2014q3.png)

The inputs `x[4:1]` represent a 4-bit input. Some cells in the K-map are marked as **don’t-cares (`d`)**, allowing optimization flexibility. You are required to derive and implement a simplified logic expression for `f` using the K-map.

---

## ✅ Inputs and Outputs

- **Inputs**:  
  `x[4:1]`: 4-bit input vector (x[4] is MSB, x[1] is LSB)

- **Output**:  
  `f`: Output logic value computed from the K-map simplification

---

## 🎯 Goal

- Simplify the given K-map using **Sum of Products (SOP)** form, leveraging **don’t-cares** for optimal grouping
- Implement the minimized logic in Verilog

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input [4:1] x, 
    output f
);
```

---

## 🧩 Concepts Reinforced

- K-map simplification with don't-care conditions
- Efficient logic design using SOP
- Handling vector inputs (`[4:1]`) in Verilog

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
