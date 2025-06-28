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

### 💡 Solution

```verilog
module top_module (
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum
);

    wire [2:0] carry;

    fadd fa0 (.a(x[0]), .b(y[0]), .cin(1'b0),     .sum(sum[0]), .cout(carry[0]));
    fadd fa1 (.a(x[1]), .b(y[1]), .cin(carry[0]), .sum(sum[1]), .cout(carry[1]));
    fadd fa2 (.a(x[2]), .b(y[2]), .cin(carry[1]), .sum(sum[2]), .cout(carry[2]));
    fadd fa3 (.a(x[3]), .b(y[3]), .cin(carry[2]), .sum(sum[3]), .cout(sum[4]));

endmodule

module fadd(
    input a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
```

---

🛠️ **Tags:** `full-adder`, `ripple-carry`, `verilog`, `combinational logic`, `hdlbits`
