# 🔁 Dff8 – 8-bit D Flip-Flop Register

## 📘 Problem Statement

Create **8 D flip-flops** that store an 8-bit input value `d[7:0]`. All flip-flops should be **triggered by the positive edge** of the clock signal `clk`.

---

## ✅ Inputs and Outputs

- **Inputs**:
  - `clk`: Clock signal
  - `d[7:0]`: 8-bit input vector

- **Output**:
  - `q[7:0]`: 8-bit output vector (stored result)

---

## 🔄 Behavior

Each flip-flop in the 8-bit register captures the corresponding bit from `d` on every **posedge of `clk`**:

```
On posedge clk:
    q[i] <= d[i] for i = 0 to 7
```

This forms a basic synchronous 8-bit register.

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input clk,
    input [7:0] d,
    output reg [7:0] q
);
```

---

## 🧩 Concepts Reinforced

- Vectorized register design
- Clocked sequential logic
- Data storage in synchronous systems

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
