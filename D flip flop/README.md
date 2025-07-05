# 🔁 Dff – Single D Flip-Flop

## 📘 Problem Statement

Create a **single D flip-flop** that updates its output `q` on the **positive edge** of a clock signal `clk`. The value stored is simply whatever is on the input `d`.

🖼️ Reference Diagram:  
![D Flip-Flop](https://hdlbits.01xz.net/mw/images/6/6c/Dff.png)

---

## ✅ Inputs and Outputs

- **Inputs**:
  - `clk`: Clock signal
  - `d`: Data input

- **Output**:
  - `q`: Stored output bit

---

## 🔄 Behavior

A D flip-flop is a basic memory element. It captures the input `d` only on the rising edge of `clk`:

```
On posedge clk:
    q <= d
```

This structure is fundamental in sequential digital design.

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input clk,
    input d,
    output reg q
);
```

---

## 🧩 Concepts Reinforced

- Sequential logic basics
- Clocked `always` blocks in Verilog
- Flip-flop memory elements

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
