# 🧮 Popcount255 – 255-Bit Population Count

## 🔍 Overview

This exercise focuses on creating a **population count** (or **Hamming weight**) circuit. The goal is to count the number of `'1'` bits in a **255-bit input vector**, producing an 8-bit binary result. This technique is commonly used in digital systems for **error detection**, **bitmask evaluations**, and **vector analysis**.

---

## 📐 Functional Requirements

- **Input:**  
  - `in`: 255-bit input vector

- **Output:**  
  - `out`: 8-bit output representing the count of `'1'` bits in `in`

---

## 📥 Port Definition

```verilog
input      [254:0] in;
output reg [7:0]   out;
```

---

## ✅ Implementation Example

```verilog
module top_module (
    input  [254:0] in,
    output [7:0]   out
);

    integer i;
    always @(*) begin
        out = 0;
        for (i = 0; i < 255; i = i + 1)
            out = out + in[i];
    end

endmodule
```

> ✅ This approach uses a **combinational always block** with a **for-loop** to iterate through each bit and sum the number of `'1'`s. It synthesizes efficiently for moderate vector sizes like 255 bits.

---

## 📚 Key Concepts

- **Population Count**:
  - Counts the total number of active (high) bits in a vector.
  - Often used in error detection, set analysis, or instruction sets (e.g., x86 `POPCNT`).

- **Combinational Summation**:
  - A `for` loop inside `always @(*)` allows summing vector bits without triggering latch inference.

- **Hamming Weight**:
  - A measure of the number of symbols different from the zero symbol—in binary, simply the number of 1s.

---

## 💡 Applications

- Hamming weight for ECC and cryptography  
- Set cardinality in bitmask operations  
- Instruction-level parallelism  
- Signal presence detection in communication systems

---

## 🔑 Keywords

Verilog, Population Count, Hamming Weight, Bit Counting, For Loop, Vector Summation, HDLBits, Combinational Logic
