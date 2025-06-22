# 📘 exams/m2014_q4g – Structural Verilog: Circuit Implementation

## 🧠 Problem Overview

Implement the following combinational logic circuit **structurally** using only module instantiations.

> 🔗 [Circuit Diagram (exams_m2014_q4g.png)](https://hdlbits.01xz.net/mw/images/e/e6/Exams_m2014q4g.png)

This exercise continues the practice of **structural modeling**, where complex logic is built using gate-level module composition instead of behavioral constructs.

---

## 📥 Module Declaration

```verilog
module top_module (
    input  [3:0] in,
    output [1:0] out
);
