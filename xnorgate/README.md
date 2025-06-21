# HDLBits - XNOR Gate

## 🔍 Problem Statement

Create a Verilog module that implements an **XNOR gate** using an `assign` statement.  
An XNOR gate outputs `1` when both inputs are the same (either both `0` or both `1`).

![XNOR Gate](https://hdlbits.01xz.net/mw/images/6/6d/Xnorgate.png)

### 🎯 Objective
- Take two inputs (`a` and `b`) and produce an output (`out`) such that:
  ```verilog
  assign out = ~(a ^ b);
