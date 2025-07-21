# 🔄 100-bit Left/Right Rotator

## 📌 Description

This module implements a **100-bit rotator** that performs **circular left** or **right rotation by one bit**, based on a 2-bit `ena` input. It also supports **synchronous parallel load** from input data.

---

## 🧮 Functionality

| Signal   | Direction | Width     | Description |
|----------|-----------|-----------|-------------|
| `clk`    | Input     | 1         | Clock signal |
| `load`   | Input     | 1         | Synchronously loads `data` into `q` if high |
| `ena`    | Input     | 2         | Rotation control:<br/>• `2'b01`: Right rotate<br/>• `2'b10`: Left rotate<br/>• `2'b00`, `2'b11`: No operation |
| `data`   | Input     | 100       | Data to load |
| `q`      | Output    | 100       | Current value of rotator |

---

## 🔁 Rotation Behavior

- **Right rotate (ena = 2'b01):**
  - `q <= {q[0], q[99:1]}`
- **Left rotate (ena = 2'b10):**
  - `q <= {q[98:0], q[99]}`
- **No operation (ena = 2'b00 or 2'b11):**
  - `q <= q`

If `load` is high, the `data` input is loaded into `q` on the next rising edge of `clk`, **regardless of `ena` value**.

---

## ⌛ Timing Example

| clk ↑ | load | ena   | Action              | Result (`q`) |
|-------|------|-------|---------------------|---------------|
|   ↑   | 1    | XX    | Load data           | `q <= data`   |
|   ↑   | 0    | 2'b01 | Rotate right by 1   | `q <= {q[0], q[99:1]}` |
|   ↑   | 0    | 2'b10 | Rotate left by 1    | `q <= {q[98:0], q[99]}` |
|   ↑   | 0    | 2'b00 | Hold                | `q <= q`      |

---

## 🧠 Notes

- Prioritize `load` over rotation.
- Rotation is circular; no bits are lost or zero-padded.
- Can be used in bit permutation applications or circular buffers.

---
```
