# 🔁 Dual-Edge Triggered Flip-Flop (Functional Emulation)

## 📘 Problem Description

FPGAs don't support true dual-edge flip-flops, but we can emulate the behavior by combining **positive** and **negative edge-triggered flip-flops**.

### Objective:
- Output `q` updates on **both** rising and falling edges of the clock.
- Functionally behave like a dual-edge D flip-flop:
  ```
  q ← d on every clk edge
  ```

🔗 [Reference Diagram](https://i-blog.csdnimg.cn/blog_migrate/009a2a09315a4345cbae6666329f7e61.png)

---

## ⚙️ Design Overview

Use:
- One flip-flop (`q_pos`) triggered on **posedge clk**
- Another flip-flop (`q_neg`) triggered on **negedge clk**
- A multiplexer to select which value to output based on the current clock level

This way, the output `q` appears to update on both edges.

---

## 🔌 Interface

- **Inputs**:
  - `clk`: Clock signal
  - `d`: Data input
- **Output**:
  - `q`: Output emulating dual-edge behavior

---

## 🧠 Design Considerations

- This is not a true hardware dual-edge flip-flop.
- Output may experience **glitches** due to mux delay or clk instability.
- Avoid in time-sensitive synchronous paths; suitable for **simulation, test benches**, or non-critical logic.

---

## 💡 Summary

- Useful to **simulate** dual-edge-triggered behavior using standard tools.
- A real FPGA will **synthesize this as logic and registers**, not native flip-flops.
- Always test for **timing correctness** post-synthesis when using this method.

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
