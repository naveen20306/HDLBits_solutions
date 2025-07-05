# 🔁 Dff8r – 8-bit D Flip-Flops with Synchronous Reset

## 📘 Problem Statement

Create **8 D flip-flops** with an **active-high, synchronous reset**. All flip-flops should be **triggered by the positive edge** of the clock signal `clk`.

---

## ✅ Inputs and Outputs

- **Inputs**:
  - `clk`: Clock signal
  - `reset`: Active-high synchronous reset
  - `d[7:0]`: 8-bit input vector

- **Output**:
  - `q[7:0]`: 8-bit output vector (stored result)

---

## 🔄 Behavior

On the **positive edge** of `clk`:
- If `reset == 1`, all flip-flops are reset to `0`.
- Else, `q` is updated with the input vector `d`.

```
if (reset)
    q <= 8'b00000000;
else
    q <= d;
```

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output reg [7:0] q
);
```

---

## 🧩 Concepts Reinforced

- Vectorized sequential logic
- Synchronous reset design
- Clock-triggered state updates

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
