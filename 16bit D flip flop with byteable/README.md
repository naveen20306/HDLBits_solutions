# 🧮 Dff16e – 16-bit D Flip-Flops with Byte Enable

## 📘 Problem Statement

Create a **16-bit register** using D flip-flops with the following features:

- Triggered on the **positive edge of the clock**
- **Synchronous, active-low reset** (`resetn`)
- **Byte-enable control**:
  - `byteena[1]` enables writing to the upper byte (`d[15:8]`)
  - `byteena[0]` enables writing to the lower byte (`d[7:0]`)

---

## ✅ Inputs and Outputs

- **Inputs**:
  - `clk`: Clock signal
  - `resetn`: Synchronous active-low reset
  - `byteena[1:0]`: Byte-enable control
  - `d[15:0]`: 16-bit data input

- **Output**:
  - `q[15:0]`: 16-bit output (register value)

---

## 🔄 Behavior

- On each **positive clock edge**:
  - If `resetn == 0`: `q` is reset to `16'b0`
  - Else:
    - If `byteena[1] == 1`: `q[15:8] <= d[15:8]`
    - If `byteena[0] == 1`: `q[7:0]  <= d[7:0]`

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
);
```

---

## 🧩 Concepts Reinforced

- Selective register updates with **byte-enable**
- **Synchronous reset** behavior
- Register partitioning and bit masking

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
