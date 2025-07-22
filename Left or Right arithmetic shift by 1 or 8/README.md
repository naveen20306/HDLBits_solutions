# ↔️ 64-bit Arithmetic Shift Register

## 📌 Description

This Verilog module implements a **64-bit arithmetic shift register** with synchronous load. It supports **left** and **arithmetic right shifts** by either **1 bit** or **8 bits**, controlled via the `amount` signal.

---

## 🧮 I/O Ports

| Signal   | Direction | Width     | Description |
|----------|-----------|-----------|-------------|
| `clk`    | Input     | 1         | Clock signal |
| `load`   | Input     | 1         | Loads input `data` into `q` |
| `ena`    | Input     | 1         | Enables shift operation |
| `amount` | Input     | 2         | Shift control: |
|          |           |           | `2'b00` – Shift left by 1 |
|          |           |           | `2'b01` – Shift left by 8 |
|          |           |           | `2'b10` – Arithmetic right shift by 1 |
|          |           |           | `2'b11` – Arithmetic right shift by 8 |
| `data`   | Input     | 64        | Input data for load |
| `q`      | Output    | 64        | Current value of the shift register |

---

## 🧠 Behavior

- **Priority**: `load` takes precedence over `ena`.
- **Left shifts** (by 1 or 8) fill in with `0` from the right.
- **Arithmetic right shifts** replicate the sign bit (`q[63]`) on the left.

### Arithmetic Right Shift Example

| Input (q[4:0]) | Shift | Output (q[4:0]) |
|----------------|--------|-----------------|
| `5'b11000`     | >>1    | `5'b11100` (AR) |
| `5'b01000`     | >>1    | `5'b00100` (AR) |

---

## ⏱️ Timing Example

| clk ↑ | load | ena | amount | Action                     |
|-------|------|-----|--------|----------------------------|
| 1     | 1    | X   | XX     | q ← data                   |
| 2     | 0    | 1   | 00     | q ← q << 1                 |
| 3     | 0    | 1   | 11     | q ← q >>> 8 (arithmetic)   |
| 4     | 0    | 0   | XX     | q holds                    |

---

## ✅ Use Cases

- Shift operations in ALUs
- Signed division via shifting
- Emulation of CPU-like behavior in RTL

---
```
