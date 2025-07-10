# 🔢 Count15 – 4-bit Binary Counter (0 → 15)

## 📘 Problem Statement
Design a **4-bit binary counter** that counts from **0 to 15** inclusive, then wraps back to 0.  
- The **reset** is **synchronous** and **active-high**, meaning it takes effect on the **next rising edge** of the clock.  
- The counter has a period of 16.

Reference Diagram:  
![Binary Counter](https://i-blog.csdnimg.cn/blog_migrate/57943cffba9888d0a816666065ed7722.png)

---

## 🔧 Module Interface

| Signal  | Direction | Width | Description                       |
|---------|-----------|-------|-----------------------------------|
| `clk`   | Input     | 1     | Clock signal (posedge triggered) |
| `reset` | Input     | 1     | Synchronous, active-high reset    |
| `q`     | Output    | 4     | 4-bit binary count output         |

---

## 🧠 Functional Behavior

| Condition       | Action         |
|-----------------|----------------|
| `reset = 1`     | `q ← 0`        |
| `reset = 0`     | `q ← q + 1`    |
| After `q = 15`  | `q ← 0` wraps  |

This creates a **mod-16 counter** with an output sequence:  
`0 → 1 → 2 → ... → 15 → 0 → ...`

---

## 💡 Design Considerations

- Synchronous reset is handled *inside* the clocked always block.
- Natural binary counting requires a simple increment operation.
- Wrap-around occurs naturally at 4-bit overflow (`4'b1111 + 1 = 4'b0000`).

---

## ✅ Applications

- Frequency division
- Timebase generation
- Addressing in memory or data buffers
- Finite State Machines (FSM) with 16 states

---

## 👨‍💻 Maintained By
**Naveen Kumar B**
