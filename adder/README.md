## 📘 HDLBits — Exams/m2014_q4j

**Category:** Exams  
**Source:** 2014 Midterm Question 4 (j)  
**Topic:** Ripple-Carry Adder with Full Adders  

---

### 📝 Problem Statement

Design and implement a 4-bit ripple-carry adder using full adders. This adder takes two 4-bit input vectors `x[3:0]` and `y[3:0]`, and outputs a 5-bit vector `sum[4:0]` to accommodate carry-out.

Each bit is added using a full adder. The carry-out from each full adder is connected as the carry-in to the next. The least significant bit is added with `cin = 0`. The final carry-out becomes `sum[4]`.

---

### 🔗 Reference Diagram

![Ripple-Carry Adder Diagram](https://hdlbits.01xz.net/mw/images/d/d2/Exams_m2014q4j.png)

---

### ✅ Module Declaration

```verilog
module top_module (
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum
);
```
---

🛠️ **Tags:** `full-adder`, `ripple-carry`, `verilog`, `combinational logic`, `hdlbits`
