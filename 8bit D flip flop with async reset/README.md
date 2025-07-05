# 🔁 Dff8ar – 8-bit D Flip-Flops with Asynchronous Reset

## 📘 Problem Statement

Create **8 D flip-flops** that meet the following requirements:
- **Triggered on the positive edge** of the clock (`clk`)
- **Active-high asynchronous reset** (`areset`)
- On asynchronous reset, all flip-flops should be set to `0`.

---

## ✅ Inputs and Outputs

- **Inputs**:
  - `clk`: Clock signal (positive edge triggered)
  - `areset`: Asynchronous reset (active high)
  - `d[7:0]`: 8-bit data input

- **Output**:
  - `q[7:0]`: 8-bit stored output

---

## 🔄 Behavior

The flip-flops operate as follows:

- If `areset` is **high** at any time, `q` is immediately reset to `8'b00000000`, **regardless of the clock**.
- Otherwise, on the **positive edge of `clk`**, `q` is updated to `d`.

```
if (areset)
    q <= 8'b0;
else if (posedge clk)
    q <= d;
```

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output reg [7:0] q
);
```

---

## 🧩 Concepts Reinforced

- Asynchronous reset behavior
- Difference between synchronous and asynchronous resets in Verilog
- Register implementation for multi-bit storage

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
