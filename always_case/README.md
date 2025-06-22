```markdown
# Always Case – 6-to-1 Multiplexer Using Case Statement

## 🧠 Overview

This exercise focuses on the **`case` statement** in Verilog, which provides a cleaner and more readable alternative to multiple `if-else` conditions, especially when dealing with **multiple fixed cases**, such as in multiplexers or decoders.

You are required to implement a **6-to-1 multiplexer** using a `case` statement. Ensure that **no latches are inferred** by covering **all possible input conditions** through a default assignment or a `default` case.

---

## 🔧 Functional Requirements

- Inputs:
  - `sel`: 3-bit selector signal
  - `a, b, c, d, e, f`: six 4-bit data inputs

- Output:
  - `out`: 4-bit output corresponding to one of the inputs

- Behavior:
  - When `sel` is 0 to 5 → output the corresponding input
  - When `sel` is 6 or 7 → output should be 4'b0000

---

### 📥 Port Definition

```verilog
input  [2:0] sel;
input  [3:0] a, b, c, d, e, f;
output reg [3:0] out;
```

---

### ✅ Implementation Example

```verilog
always @(*) begin
    case (sel)
        3'd0: out = a;
        3'd1: out = b;
        3'd2: out = c;
        3'd3: out = d;
        3'd4: out = e;
        3'd5: out = f;
        default: out = 4'b0000;  // Prevent latch inference
    endcase
end
```

> ✅ Important: The `default` case ensures the output is assigned under all conditions, avoiding unintentional latch inference.

---

## 📚 Key Concepts

- **Case Statement in Verilog**:
  - Syntax: `case (expression) ... endcase`
  - No `break` needed (unlike C)
  - Use `begin ... end` for multiple statements per case

- **Preventing Latches**:
  - All outputs must be assigned in every possible path
  - Always include a `default` case or set a default value before the `case`

- **Cleaner Than If-Else**:
  - Easier to read and scale when many conditions share the same expression

---

## 💡 Applications

- Multiplexer and decoder logic  
- State machine transitions  
- Priority logic in digital systems

---

## 🔑 Keywords

Verilog, Case Statement, Multiplexer, Combinational Logic, Latch Prevention, Default Case, HDLBits, 6-to-1 MUX, Digital Design
```
