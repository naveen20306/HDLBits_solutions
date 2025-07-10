# 🔟 Count1to10 – Decade Counter (1 → 10)

## 📘 Problem Statement
Design a **decade counter** that counts **from 1 through 10**, then wraps back to 1.  
- The `reset` is **synchronous** and **active-high**: it sets the counter to 1 on the **next rising clock edge**.
- The counter should loop: `1 → 2 → … → 10 → 1 …`

![Counter Diagram](https://i-blog.csdnimg.cn/blog_migrate/3d7b17923d70ef42fce671df15182764.png)

---

## 🔧 Module Interface

| Signal  | Direction | Width | Description                         |
|---------|-----------|-------|-------------------------------------|
| `clk`   | Input     | 1     | Clock signal (posedge triggered)   |
| `reset` | Input     | 1     | Synchronous, active-high reset      |
| `q`     | Output    | 4     | 4-bit counter output (1 to 10)     |

---

## 🔍 Notes

- Unlike a traditional counter starting at 0, this counter starts and wraps at **1**.
- 4-bit output (`q`) is used even though the max value is 10 (`4'b1010`).
- Ideal for **BCD-based** display counters or timers that skip zero.

---

## ✅ Applications

- Digital clocks (1-based indexing)
- Score counters
- Finite State Machines (FSMs) that cycle through 10 active states

---

## 👨‍💻 Maintained By
**Naveen Kumar B**
