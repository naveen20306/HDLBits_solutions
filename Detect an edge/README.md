# ⚡ 8-bit Positive Edge Detector – Exams/ece241_2013_q7

## 📘 Problem Statement

You are given an 8-bit input signal and asked to **detect rising edges (0 → 1)** for **each individual bit**. When a rising edge is detected on a bit, the corresponding output bit is set **high for one clock cycle**.

🖼️ **Waveform Diagram**:  
[Click to view waveform](https://img2020.cnblogs.com/blog/1260162/202006/1260162-20200617155816947-793231186.png)

This exercise reinforces bitwise state tracking and signal edge detection using flip-flops.

---

## 🔑 Inputs and Output

- **Inputs**:
  - `clk`: Clock signal (positive edge triggered)
  - `in [7:0]`: 8-bit input signal vector

- **Output**:
  - `pedge [7:0]`: 8-bit output vector indicating rising edges

---

## ⚙️ Behavior and Implementation

- Store previous state of `in` using a register.
- On each positive clock edge, detect if current `in[i]` is `1` and previous `in[i]` was `0`.
- If so, assert `pedge[i]` for that cycle.

---

## 🧩 Concepts Reinforced

- Bitwise positive edge detection
- Vector signal handling in sequential circuits
- Use of registers to hold prior state
- Synchronous design patterns

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
