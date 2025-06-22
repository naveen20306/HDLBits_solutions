```markdown
# Always Casez – 8-bit Priority Encoder Using casez

## 🧠 Overview

This exercise introduces the `casez` statement in Verilog, a powerful variant of the `case` construct that enables **don't-care (z) matching**, allowing for concise and readable encoding of **priority logic**. 

You're tasked with implementing an **8-bit priority encoder** that detects the **least significant 1-bit** in the input. The `casez` approach significantly reduces the number of required cases (from 256 to just 9) by masking irrelevant bits using `z`.

---

## 🔧 Functional Requirements

- Input:
  - `in`: 8-bit vector input
- Output:
  - `pos`: 3-bit output representing the **index of the first 1-bit**, starting from bit 0
  - If all bits in `in` are `0`, then `pos = 3'd0`

---

### 📥 Port Definition

```verilog
input  [7:0] in;
output reg [2:0] pos;
```

---

### ✅ Implementation Example

```verilog
always @(*) begin
    casez (in)
        8'b???????1: pos = 3'd0;
        8'b??????10: pos = 3'd1;
        8'b?????100: pos = 3'd2;
        8'b????1000: pos = 3'd3;
        8'b???10000: pos = 3'd4;
        8'b??100000: pos = 3'd5;
        8'b?1000000: pos = 3'd6;
        8'b10000000: pos = 3'd7;
        default:     pos = 3'd0;  // No bits set
    endcase
end
```

> ✅ `?` is a shorthand for `z`, representing don't-care bits.  
> ✅ This implementation ensures **LSB-first priority**, meaning the **right-most '1'** is selected first.  
> ✅ `default` handles the **all-zero input** case.

---

## 📚 Key Concepts

- **Priority Encoder**:
  - Outputs the **position of the first '1' bit**, based on **priority from LSB to MSB**.

- **casez vs case**:
  - `casez` allows `z` bits (or `?`) to act as wildcards.
  - Reduces complexity by masking irrelevant higher-order bits.

- **Pattern Matching Logic**:
  - Patterns are checked top-down, and the **first match is used**.
  - Ensure the most specific (highest-priority) match is listed first.

- **Avoiding Latch Inference**:
  - Include a **`default` case** to assign outputs under all conditions.

---

## 💡 Applications

- Interrupt controllers  
- Arbitration circuits  
- Encoders in communication and digital control systems  
- Resource priority management

---

## 🔑 Keywords

Verilog, casez, Don't-Care Bits, Priority Encoder, Multiplexer, Wildcard Matching, Latch Prevention, Pattern Matching, HDLBits, Combinational Logic
```
