# 🎛️ Exams/ece241 2014 q3 – K-Map using Multiplexers

## 📘 Problem Statement

Design a circuit using **one 4-to-1 multiplexer** and the **fewest number of 2-to-1 multiplexers**, with **no other logic gates**, to implement a logic function defined by a Karnaugh map. The 4-to-1 mux uses `a` and `b` (not shown here) as select lines.  
You must complete the module named `top_module`, which **defines the 4 inputs** (`mux_in[3:0]`) going into the 4-to-1 multiplexer. The inputs depend only on `c` and `d`.

- You are **not implementing the entire circuit**, just the portion responsible for determining the 4 inputs of the 4-to-1 MUX.

📸 K-Map:  
![K-map](https://hdlbits.01xz.net/mw/images/a/a6/Ece241_2014_q3.png)  
📦 MUX Setup:  
![MUX Block](https://hdlbits.01xz.net/mw/images/b/bc/Ece241_2014_q3mux.png)

---

## ✅ Inputs and Outputs

- **Inputs**:
  - `c`, `d`: Control signals for logic expression generation
- **Output**:
  - `mux_in`: 4-bit vector providing the inputs to the 4-to-1 mux, derived from K-map reduction using `c` and `d`

---

## 🎯 Goal

Minimize logic using only 2-to-1 multiplexers to derive the expressions for each of the four `mux_in` inputs, which will then be selected via the external 4-to-1 MUX using selectors `a` and `b`.

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input c,
    input d,
    output [3:0] mux_in
);
```

---

## 🧩 Concepts Reinforced

- Karnaugh map simplification
- Circuit synthesis using only multiplexers
- 2:1 and 4:1 MUX logic implementations
- Hierarchical and modular design with mux-only logic

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
