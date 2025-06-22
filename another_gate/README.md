# 📘 exams/m2014_q4f – Structural Verilog: Combinational Circuit

## 🧠 Problem Overview

You are asked to implement the following circuit **structurally** in Verilog using only module instantiations. The referenced schematic is available here:

> 🔗 [Exams_m2014q4f.png](https://hdlbits.01xz.net/mw/images/b/b6/Exams_m2014q4f.png)

This exercise reinforces the concept of **hierarchical Verilog**, where a top-level module is built by instantiating submodules and connecting them using wires — instead of writing the behavior directly.

---

## 📥 Module Declaration

```verilog
module top_module (
    input  [3:0] in,
    output [3:0] out
);
