# 🔄 8-bit Any-Edge Detector – `edgedetect2`

## 📘 Problem Statement

This task extends simple edge detection by asking you to detect **any transitions (0→1 or 1→0)** on an 8-bit input signal. For each input bit, when its value changes between two consecutive clock cycles, the corresponding output bit (`anyedge[i]`) should be set **high for one clock cycle**.

📊 **Waveform Reference**  
📎 [Click to view waveform](https://img2020.cnblogs.com/blog/1260162/202006/1260162-20200617161354648-2023863599.png)

---

## 🔧 Inputs and Output

- **Inputs**:
  - `clk`: Clock signal
  - `in [7:0]`: 8-bit input vector

- **Output**:
  - `anyedge [7:0]`: 8-bit output that goes high for one cycle on any edge

---

## ⚙️ Behavior and Implementation

Track the previous state of each input bit using a register. Compare the current and previous values to detect any change (either rising or falling edge).


## 💡 Key Concepts

- XOR-based edge detection
- Register-based history tracking
- Bitwise operations for parallel signal processing
- Clean synchronous design with clocked `always` block

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
