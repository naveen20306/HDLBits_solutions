# 🔄 D Flip-Flop with Feedback Logic – Exams/m2014_q4d

## 📘 Problem Statement

Implement the sequential circuit shown in the diagram:

🖼️ [Circuit Diagram](https://hdlbits.01xz.net/mw/images/f/f2/Exams_m2014q4d.png)

The system is a **D flip-flop** with feedback and logic gates creating its input. It combines the external `in` signal with the current state using combinational logic before passing it into the flip-flop.

---

## ✅ Inputs and Output

- **Inputs**:
  - `clk`: Clock input (positive edge triggered)
  - `in`: External input signal

- **Output**:
  - `out`: Flip-flop output, updated on clock edge

---

## 🧠 Behavior

The D flip-flop input is derived from:
```
D = (~out & in) | (out & ~in) = out ^ in
```

So effectively:
```
out <= out ^ in;  // toggles when in == 1
```

This acts like a **toggle flip-flop** controlled by `in`.

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input clk,
    input in, 
    output reg out
);
```

---

## 🧩 Concepts Reinforced

- Flip-flop with feedback logic
- XOR-based state toggling
- Sequential logic synthesis from circuit diagrams

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
