```markdown
# Always If – 2-to-1 Multiplexer Using Procedural If Statement

## 🧠 Overview

This exercise explores the use of an **`if` statement inside an `always @(*)` block** to model combinational logic. The `if` structure in Verilog is functionally similar to the **ternary (`? :`) operator** used in continuous assignments, and both are used to describe **multiplexers**.

However, improper use of procedural `if` can lead to **incomplete assignments**, resulting in unintended **latches**. Ensuring that **all output signals are always assigned** is critical for maintaining purely combinational behavior.

---

## 🔧 Functional Requirements

Implement a **2-to-1 multiplexer** that selects between inputs `a` and `b`.  
- If both `sel_b1` **and** `sel_b2` are true (`1`), output `b`  
- Otherwise, output `a`

You must implement this twice:
1. Using a continuous assignment with the **ternary operator**
2. Using a **procedural `if-else` block** in `always @(*)`

---

### 📥 Port Definition

```verilog
input  wire sel_b1, sel_b2;
input  wire a, b;
output wire out_assign;
output reg  out_always;
```

---

### ✅ Example Implementations

#### 1. 🔗 Continuous Assignment (assign)
```verilog
assign out_assign = (sel_b1 & sel_b2) ? b : a;
```

#### 2. 📜 Procedural Assignment (always if-else)
```verilog
always @(*) begin
    if (sel_b1 & sel_b2)
        out_always = b;
    else
        out_always = a;
end
```

---

## 📚 Key Concepts

- **2-to-1 Multiplexer**:
  - Selects between two inputs based on a control signal.

- **Combinational `if-else`**:
  - Use inside `always @(*)` blocks.
  - Must **assign all outputs in all branches** to avoid latch inference.

- **Ternary Operator `? :`**:
  - More compact.
  - Easier to verify that outputs are fully assigned.

- **Avoiding Latches**:
  - Failing to cover all conditions or paths in an `always` block creates unintended storage elements (latches), which are **not combinational**.

---

## 💡 Applications

- Designing multiplexers (MUX) using different coding styles  
- Learning to prevent synthesis errors like **latch inference**  
- Comparing procedural and continuous modeling of logic  

---

## 🔑 Keywords

Verilog, If Statement, Procedural Logic, always @(*), assign, Ternary Operator, Multiplexer, MUX, Combinational Logic, Latch Inference, HDLBits
```
