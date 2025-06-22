```markdown
# Always Case2 – 4-bit Priority Encoder Using Case Statement

## 🧠 Overview

A **priority encoder** is a combinational circuit that outputs the index (position) of the **first high (1) bit**, starting from the **most significant bit (MSB)**. If no bits are high, it outputs `0`. This exercise requires implementing a **4-bit priority encoder**, selecting the index of the **highest-priority 1-bit** from the input.

The logic is implemented using a **Verilog `case` statement**, matching fixed input patterns to determine the correct encoded output.

---

## 🔧 Functional Requirements

- Input:
  - `in`: 4-bit input vector

- Output:
  - `pos`: 2-bit output representing the position (0 to 3) of the highest-priority 1-bit
  - If `in == 4'b0000`, then `pos = 2'b00`

---

### 📥 Port Definition

```verilog
input  [3:0] in;
output reg [1:0] pos;
```

---

### ✅ Implementation Example

```verilog
always @(*) begin
    case (1'b1)  // Use one-hot pattern matching
        in[3]: pos = 2'd3;
        in[2]: pos = 2'd2;
        in[1]: pos = 2'd1;
        in[0]: pos = 2'd0;
        default: pos = 2'd0;  // No input bits are high
    endcase
end
```

> ✅ The `case (1'b1)` trick is used to prioritize the first `true` input from highest to lowest bit.  
> ✅ Always include a `default` case to prevent **latch inference**.

---

## 📚 Key Concepts

- **Priority Encoder**:
  - Outputs the index of the first high bit (priority: MSB to LSB).
  - Only one output result per input state.

- **Pattern Matching with Case**:
  - Use `case (1'b1)` and individual bits (`in[3]`, `in[2]`, ...) as conditions.
  - Allows priority logic using readable Verilog syntax.

- **Latch Prevention**:
  - Always cover all input conditions (e.g., all 0's).
  - Include a `default` assignment to ensure a combinational circuit.

---

## 💡 Applications

- Interrupt controllers (select highest priority interrupt)  
- Encoders in CPU control logic  
- Signal routing and arbitration circuits

---

## 🔑 Keywords

Verilog, Priority Encoder, Case Statement, Combinational Logic, Latch Inference, One-Hot Matching, HDLBits, Digital Logic Design
```
