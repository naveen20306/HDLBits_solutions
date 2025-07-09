# 📉 Edge Capture (1→0 Transition Detector with Sticky Output)

## 📘 Problem Description

Build a **32-bit edge-capturing circuit** that detects **1→0 transitions** on each input bit and "captures" the event:

- Output bit `out[i]` becomes `1` after a **falling edge** (`in[i]` goes from 1 to 0).
- Output remains **latched at 1** until reset.
- Reset is **synchronous**, active high, and clears all output bits on the next rising edge of the clock.
- If both reset and a falling edge occur in the same cycle, **reset takes priority**.

📊 Visual Reference:  
![EdgeCapture Waveform](https://i.sstatic.net/mcMXt.png)

---

## 🔧 Interface

- **Inputs**:
  - `clk`: Clock signal
  - `reset`: Synchronous reset signal (active high)
  - `in[31:0]`: 32-bit input vector

- **Output**:
  - `out[31:0]`: Captured falling-edge status bits (sticky SR behavior)

---

## 🧠 Functional Behavior

### Each bit behaves like an **SR latch**:

| Event                  | Action       |
|------------------------|--------------|
| `in[i]`: 1 → 0         | `out[i] ← 1` |
| `reset == 1`           | `out ← 0`    |
| Otherwise              | Maintain     |

---

## ⚙️ Design Summary

- Use a register `prev_in` to store `in` from the previous clock cycle.
- Detect falling edges: `falling = prev_in & ~in`
- On each clock cycle:
  - If `reset` is high: clear `out`
  - Else: `out ← out | falling`

---


## 👨‍💻 Maintained By

**Naveen Kumar B**
