# 🔁 Vector100r – 100-Bit Vector Reversal

## 🔍 Overview

This task involves reversing the order of bits in a **100-bit vector**. The most significant bit (MSB) becomes the least significant bit (LSB), and vice versa. This is a common operation in **data alignment**, **endianness conversion**, and **bit-level manipulations**.

---

## 📐 Functional Requirements

- **Input:**  
  - `in`: 100-bit input vector

- **Output:**  
  - `out`: 100-bit output vector, where `out[i] = in[99 - i]`

---

## 📥 Port Definition

```verilog
input      [99:0] in;
output reg [99:0] out;
```

---

## ✅ Implementation Example

```verilog
module top_module (
    input  [99:0] in,
    output [99:0] out
);

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : reverse_bits
            assign out[i] = in[99 - i];
        end
    endgenerate

endmodule
```

> ✅ This implementation uses a **generate-for loop** to assign each output bit from the corresponding reversed index in the input.

---

## 📚 Key Concepts

- **Bit Reversal**:
  - A fundamental technique used in FFT implementations, hardware interfaces, and serialization.

- **Generate Blocks**:
  - Provide a scalable way to describe repetitive hardware logic.

- **Indexing**:
  - `out[i] = in[99 - i]` captures the reverse mapping in a concise form.

---

## 💡 Applications

- Endianness conversion  
- Bit manipulation in cryptographic hardware  
- Reverse lookup tables  
- Signal pre-processing for DSPs  

---

## 🔑 Keywords

Verilog, Vector Reversal, Bit Manipulation, Generate Loop, HDLBits, Reverse Bits, Data Reordering, Hardware Indexing
