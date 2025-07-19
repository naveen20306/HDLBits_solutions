# 🕒 Countslow – Decade Counter with Enable

## 📘 Problem Statement
Design a **decade counter** (0 to 9) that only increments **when `slowena` is high**.  
- The counter should increment **on the rising edge of `clk`**.
- The `reset` is **synchronous and active-high**, and resets the count to **0**.
- When `slowena = 0`, the counter **holds its current value**.

![Timing Diagram](https://i-blog.csdnimg.cn/blog_migrate/ce2a6dfa81852fd7d0f514f8e7d01b6b.png)

---

## 🔧 Module Interface

| Signal     | Direction | Width | Description                            |
|------------|-----------|-------|----------------------------------------|
| `clk`      | Input     | 1     | System clock (posedge)                 |
| `slowena`  | Input     | 1     | Enable signal: count only when high   |
| `reset`    | Input     | 1     | Synchronous active-high reset          |
| `q`        | Output    | 4     | Current 4-bit decade count (0 to 9)    |

---

## 🧠 Functional Behavior

| Condition              | Action         |
|------------------------|----------------|
| `reset = 1`            | `q ← 0`        |
| `reset = 0`, `slowena = 1` | `q ← q + 1` (mod 10) |
| `reset = 0`, `slowena = 0` | `q ← q` (no change) |

The counter **wraps from 9 to 0**, giving it a **period of 10 cycles** (when `slowena = 1` consistently).

---

## 💡 Use Case

This counter is commonly used in **frequency dividers** or **slow clocks**, where an external logic selectively enables counting to create a **slower pulse stream** from a fast system clock.

---

## ✅ Applications

- Timebase generation (e.g., 1Hz from 100MHz)
- Debouncing logic
- LED sequencers
- Score or digit counters with gated counting

---

## 👨‍💻 Maintained By
**Naveen Kumar B**
