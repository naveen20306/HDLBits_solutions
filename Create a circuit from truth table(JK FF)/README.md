# 🔁 JK Flip-Flop using D Flip-Flop and Logic Gates

## 📘 Problem Statement

You are required to **implement a JK flip-flop** using only a **D-type flip-flop** and logic gates. The JK flip-flop follows this truth table:

| J | K | Q (next) |
|---|---|----------|
| 0 | 0 | Qold     |
| 0 | 1 | 0        |
| 1 | 0 | 1        |
| 1 | 1 | ~Qold    |

---

## 🔧 Inputs and Output

- **Inputs**:
  - `clk`: Clock signal
  - `j`, `k`: Control inputs

- **Output**:
  - `Q`: Output of the JK flip-flop

---

## 💡 Key Concepts

- JK Flip-Flop emulation via combinational logic
- D Flip-Flop as base storage element
- Logic simplification to reduce gate count
- XOR-like toggling using `J & K` when both are 1

---

## 🏗️ Typical Usage

Use this module in cases where JK behavior is desired but the FPGA or synthesis tool provides only D-type flip-flops.

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
