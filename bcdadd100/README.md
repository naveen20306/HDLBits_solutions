# 🔢 Bcdadd100 – 100-Digit BCD Ripple-Carry Adder

## 🔍 Overview

This problem involves building a **100-digit Binary-Coded Decimal (BCD) adder** by instantiating 100 copies of a given BCD full adder module (`bcd_fadd`). Each BCD digit is represented by 4 bits, so the entire input spans **400 bits per operand**. The result is also 400 bits, representing the sum of the two 100-digit BCD numbers.

---

## 📐 Functional Requirements

- **Inputs:**
  - `a`, `b`: 400-bit input vectors, representing 100 BCD digits (`[399:0]`)
  - `cin`: Initial carry-in

- **Outputs:**
  - `sum`: 400-bit output vector (sum of each 4-bit BCD digit)
  - `cout`: Final carry-out from the last BCD adder (1-bit)

- **Behavior:**
  - The circuit performs a digit-wise BCD addition with carry propagation from digit 0 through digit 99.

---

## 📥 Port Definition

```verilog
input  [399:0] a, b;
input          cin;
output [399:0] sum;
output         cout;
```

---

## ✅ Implementation Example

```verilog
module top_module (
    input  [399:0] a,
    input  [399:0] b,
    input          cin,
    output [399:0] sum,
    output         cout
);

    wire [99:0] carry;
    genvar i;

    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_add_chain
            if (i == 0)
                bcd_fadd u_bcd (
                    .a   (a[3:0]),
                    .b   (b[3:0]),
                    .cin (cin),
                    .sum (sum[3:0]),
                    .cout(carry[0])
                );
            else
                bcd_fadd u_bcd (
                    .a   (a[i*4 +: 4]),
                    .b   (b[i*4 +: 4]),
                    .cin (carry[i-1]),
                    .sum (sum[i*4 +: 4]),
                    .cout(carry[i])
                );
        end
    endgenerate

    assign cout = carry[99];

endmodule
```

---

## 🧩 BCD Full Adder Reference

```verilog
module bcd_fadd (
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output       cout,
    output [3:0] sum
);
// Provided module – Do not modify
endmodule
```

> ✅ This solution uses Verilog’s **slicing syntax (`[i*4 +: 4]`)** and a **generate loop** to scale the BCD adder across all 100 digits efficiently.

---

## 📚 Key Concepts

- **Binary-Coded Decimal (BCD)**:
  - Represents each decimal digit using a 4-bit binary code (e.g., 9 = `4'b1001`).

- **Ripple-Carry Addition**:
  - Carry propagates sequentially through each digit’s full adder.

- **Module Instantiation**:
  - Demonstrates structural design via reuse of the provided `bcd_fadd` component.

---

## 💡 Applications

- Financial arithmetic in decimal format  
- BCD calculators and display units  
- Precision-sensitive arithmetic hardware  
- Digital meters and controllers

---

## 🔑 Keywords

Verilog, BCD Adder, Ripple-Carry, Module Instantiation, HDLBits, Structural Design, Packed BCD, Decimal Arithmetic
