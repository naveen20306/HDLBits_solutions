# 🧠 mt2015_q4b – Equality from Waveform

## 📘 Problem Statement

Taken from **2015 midterm – Question 4 (Circuit B)**.

You are given a **simulation waveform** that describes how a combinational circuit behaves over time based on two inputs, `x` and `y`. Your task is to deduce the logic and implement the corresponding Verilog module.

![Waveform – mt2015_q4b](https://hdlbits.01xz.net/mw/thumb.php?f=Mt2015_q4b.png&width=1200)

---

## 📥 Inputs:
- `x`: 1-bit input  
- `y`: 1-bit input  

## 📤 Output:
- `z`: 1 if `x == y`, else 0

---

## 🧠 Inferred Logic

From the waveform analysis:
- Output `z` is high (1) **when `x` equals `y`**, whether both are 0 or 1.
- This matches the behavior of an **XNOR gate**.

So the logic function is:

```verilog
assign z = ~(x ^ y);
```

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

## 🔗 HDLBits Problem Link

[HDLBits – mt2015_q4b](https://hdlbits.01xz.net/wiki/Mt2015_q4b)

---

## 🎯 Concepts Reinforced

- Logic function from waveform analysis  
- XNOR behavior and equality detection  
- Waveform to truth table deduction  

---

## 👨‍💻 Author

**Naveen Kumar B**
