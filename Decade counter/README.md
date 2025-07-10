# 🔢 Count10 – Decade Counter (0 → 9)

## 📘 Problem Statement
Design a **decade counter** that cycles through values **0 to 9** (inclusive) and then wraps back to 0.  
- **Clock‑synchronous** operation  
- **Synchronous, active‑high reset** sets the count back to 0 on the next rising clock edge  

Reference diagram:  
![Decade Counter](https://i-blog.csdnimg.cn/blog_migrate/bdf98fb01f923dcb39b5efc29702ca87.png)

---

## 🔧 Interface

| Signal | Direction | Width | Description                              |
|--------|-----------|-------|------------------------------------------|
| `clk`  | Input     | 1     | Clock (positive‑edge triggered)          |
| `reset`| Input     | 1     | Synchronous active‑high reset            |
| `q`    | Output    | 4     | 4‑bit binary count (0 → 9)               |

---

## 💡 Design Notes
- Implement as a 4‑bit synchronous counter with comparison logic.  
- Ensure reset has **priority** over the normal counting logic.  
- Suitable for time‑base generation, decimal digit display drivers, etc.

---

## 🧩 Concepts Reinforced
- Synchronous reset vs. asynchronous reset  
- Modular counter design with state wrapping  
- Binary‑coded decimal (BCD) counting sequences

---

## 👨‍💻 Maintained By
**Naveen Kumar B**
