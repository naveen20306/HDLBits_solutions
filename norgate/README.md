# HDLBits - NOR Gate

## 🔍 Problem Statement

Create a Verilog module that implements a **NOR gate** using an `assign` statement.  
A NOR gate is an OR gate followed by an inversion — it outputs `1` only when both inputs are `0`.

![NOR Gate](https://hdlbits.01xz.net/mw/images/5/5b/Norgate.png)

### 🎯 Objective
- Take two inputs (`a` and `b`) and produce an output (`out`) such that:
  ```verilog
  assign out = ~(a | b);
