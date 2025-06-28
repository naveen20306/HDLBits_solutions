# ➕ Adder3 – 3-Bit Ripple-Carry Adder

## 📘 Problem Statement

Create a **3-bit ripple-carry adder** by instantiating three **full adders**.

### Inputs:
- `a[2:0]`: First 3-bit operand
- `b[2:0]`: Second 3-bit operand
- `cin`: Initial carry-in

### Outputs:
- `sum[2:0]`: 3-bit sum
- `cout[2:0]`: Carry-out from each full adder  
  - `cout[2]` is the **final carry-out**

---

## 🧠 Full Adder Recap

A full adder takes three inputs and produces a sum and carry-out:
- Inputs: `x`, `y`, `cin`
- Outputs: `sum = x ^ y ^ cin`, `cout = (x & y) | (x & cin) | (y & cin)`

---

## 🖥️ Module Declaration

```verilog
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
```

---

## ⚙️ Implementation

```verilog
// Instantiate full adders for each bit position
fadd fa0 (.a(a[0]), .b(b[0]), .cin(cin),     .sum(sum[0]), .cout(cout[0]));
fadd fa1 (.a(a[1]), .b(b[1]), .cin(cout[0]), .sum(sum[1]), .cout(cout[1]));
fadd fa2 (.a(a[2]), .b(b[2]), .cin(cout[1]), .sum(sum[2]), .cout(cout[2]));
```

---

## 📦 Supporting File: Full Adder (fadd)

```verilog
module fadd(
    input a, b, cin,
    output sum, cout);
    
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
```

---

## 🧩 Concepts Reinforced

- Full adder instantiation
- Ripple-carry adder architecture
- Bitwise carry propagation

---

## 🧑‍💻 Maintained By

**Naveen Kumar B**
