# ➕ Adder100i – 100-Bit Ripple-Carry Adder (Instantiated)

## 🔍 Overview

This exercise involves building a **100-bit ripple-carry adder** by explicitly **instantiating 100 full adders**, rather than relying on Verilog's built-in operators. You will also output the **internal carry signals** between each full adder to illustrate how the carry propagates through the chain.

This exercise enforces **modular and structural design** principles by encouraging explicit component instantiation.

---

## 📐 Functional Requirements

- **Inputs:**
  - `a`, `b`: 100-bit input operands
  - `cin`: Initial carry-in

- **Outputs:**
  - `sum`: 100-bit result of a + b + cin
  - `cout`: 100-bit carry-out bus; `cout[i]` is the carry-out from full adder *i*

---

## 📥 Port Definition

```verilog
input      [99:0] a, b;
input             cin;
output     [99:0] sum;
output     [99:0] cout;
```

---

## ✅ Implementation Example

```verilog
module top_module (
    input  [99:0] a, b,
    input         cin,
    output [99:0] sum,
    output [99:0] cout
);

    genvar i;
    wire [99:0] carry;

    generate
        for (i = 0; i < 100; i = i + 1) begin : full_adders
            if (i == 0)
                fa u_fa (.a(a[i]), .b(b[i]), .cin(cin),     .sum(sum[i]), .cout(carry[i]));
            else
                fa u_fa (.a(a[i]), .b(b[i]), .cin(carry[i-1]), .sum(sum[i]), .cout(carry[i]));
        end
    endgenerate

    assign cout = carry;

endmodule

// Full Adder Module
module fa (
    input  a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
```

> ✅ This implementation showcases **explicit instantiation** of 100 full adders using a generate-for loop, promoting a structural understanding of adder design.

---

## 📚 Key Concepts

- **Ripple-Carry Adder**:
  - Adds bits sequentially with carry propagation through each stage.
  - Simple, but can be slow for very wide bit widths.

- **Full Adder Instantiation**:
  - Promotes reusability and a modular coding style.

- **Carry Chain**:
  - Visualizing `cout[i]` enables analysis of delay propagation and debugging carry logic.

---

## 💡 Applications

- Binary arithmetic units in ALUs  
- Custom CPU datapath design  
- Structural design practice  
- Digital arithmetic verification

---

## 🔑 Keywords

Verilog, Ripple-Carry Adder, Full Adder, Structural Design, Carry Propagation, HDLBits, Bitwise Addition, Hardware Modularization
