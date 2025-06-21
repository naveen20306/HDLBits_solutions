# HDLBits - AND Gate

## 🔍 Problem Statement

Create a Verilog module that implements an **AND gate** using an `assign` statement.

### 🎯 Objective
- Connect two input wires (`a` and `b`) to an output wire (`out`) such that `out` is the logical AND of `a` and `b`.
- Use a continuous assignment to drive the output.

### 🧠 Concept
- Input wires `a` and `b` are already driven from outside the module.
- You need to **drive** the `out` wire using an `assign` statement.
- Use `assign out = a & b;` to perform a bitwise AND.

### 🖼️ Diagram
![AND Gate Diagram](https://hdlbits.01xz.net/mw/images/7/78/Andgate.png)

---

✅ This problem reinforces the idea of using assign statements to drive output signals and introduces how logic gates are constructed from basic Verilog syntax.
