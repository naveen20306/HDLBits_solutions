# 🧠 FSM from Flip-Flop Circuit – Exams/ece241_2014_q4

## 📘 Problem Statement

You are given a finite state machine (FSM) built from D flip-flops and combinational logic. Your task is to translate this FSM into a Verilog implementation.

🖼️ **Circuit Diagram**:  
[Click here to view the FSM diagram](https://hdlbits.01xz.net/mw/images/d/d6/Ece241_2014_q4.png)

The FSM uses **three D flip-flops** with:
- Inputs driven by combinations of current states and input `x`
- Output `z` based on the state

---

## 🔑 Inputs and Output

- **Inputs**:
  - `clk`: Clock signal (positive edge triggered)
  - `x`: External input to FSM

- **Output**:
  - `z`: Output depending on state and input

---

## ⚙️ Behavior and Implementation

- Each flip-flop represents one state bit: `A`, `B`, and `C`
- All flip-flops are initialized to **0** (reset state)
- On every rising clock edge, state transitions based on the diagram occur
- Output `z` is a function of the current states and input `x`



## 🧩 Concepts Reinforced

- FSM design from D flip-flops
- Understanding synchronous logic and reset behavior
- State transition logic using combinational circuits
- Edge-sensitive always blocks

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
