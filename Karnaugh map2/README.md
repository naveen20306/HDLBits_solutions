# 🧮 Exams/2012 q1g – K-Map Logic Function Simplification

## 📘 Problem Statement

You are provided with a Karnaugh map that defines a function `f`. Your task is to implement the simplified logic expression corresponding to this K-map.

🗺️ View the Karnaugh Map:  
![K-map](https://hdlbits.01xz.net/mw/thumb.php?f=Exams_2012q1g.png&width=195)

> 📝 *Note*: Pay close attention to the **ordering of bits** in the 4-bit input vector `x[4:1]`, as the K-map arrangement is sensitive to correct bit placement.

---

## ✅ Inputs and Outputs

- **Inputs**:  
  `x[4:1]`: 4-bit input vector (MSB = x[4], LSB = x[1])

- **Output**:  
  `f`: Output logic value based on the K-map logic

---

## 🎯 Goal

- Analyze the given K-map
- Derive **simplified SOP and/or POS expressions**
- Implement the simplified logic using Verilog

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

- Karnaugh map analysis
- SOP and POS logic expression synthesis
- Handling non-standard input bit ordering in logic design

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
