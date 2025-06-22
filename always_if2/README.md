```markdown
# Always If2 – Avoiding Unintentional Latches in Procedural Logic

## 🧠 Overview

This exercise highlights a **common design pitfall in Verilog**: unintentionally creating **latches** by **not assigning outputs in all code paths** inside a combinational `always @(*)` block. The key takeaway is that **combinational logic must produce a defined output for every input condition** — otherwise, Verilog will infer a **latch**, which is typically unintended and considered a design bug.

---

## 🔧 Functional Requirements

You are provided with two code blocks that **incorrectly** implement:

1. Shutting off the computer if it overheats.
2. Continuing to drive if not arrived, based on fuel level.

These contain **missing assignments**, which cause **latch inference**.

---

### ❌ Problematic Code

```verilog
always @(*) begin
    if (cpu_overheated)
        shut_off_computer = 1;
end

always @(*) begin
    if (~arrived)
        keep_driving = ~gas_tank_empty;
end
```

These code blocks do **not assign default values** to the outputs, leading to **undefined behavior** when the condition is false.

---

## ✅ Corrected Implementation

### 1. Safe Combinational Logic (with Else)

```verilog
always @(*) begin
    if (cpu_overheated)
        shut_off_computer = 1;
    else
        shut_off_computer = 0;
end

always @(*) begin
    if (~arrived)
        keep_driving = ~gas_tank_empty;
    else
        keep_driving = 0;
end
```

### 🔁 Alternate Safe Pattern (with Default Assignment)

```verilog
always @(*) begin
    shut_off_computer = 0;
    if (cpu_overheated)
        shut_off_computer = 1;
end

always @(*) begin
    keep_driving = 0;
    if (~arrived)
        keep_driving = ~gas_tank_empty;
end
```

---

## 📚 Key Concepts

- **Latch Inference**:
  - Occurs when outputs are **not assigned under all conditions** in a procedural block.
  - Causes unintended **state-holding** behavior in combinational circuits.

- **How to Avoid Latches**:
  - Use `else` clauses, or  
  - Assign **default values** at the beginning of `always @(*)` blocks.

- **Correct Circuit Behavior**:
  - Every output must be assigned a value for all input scenarios in combinational logic.

- **Warning Sign**:
  - Watch for synthesis warnings like:  
    `Warning (10240): Verilog HDL Always Construct warning... inferring latch(es)`

---

## 🖼️ Diagram

This shows the **unwanted latch behavior** caused by the original code:  
![Latch Diagram – HDLBits](https://hdlbits.01xz.net/mw/images/d/d1/Always_if2.png)

---

## 💡 Applications

- Designing safe combinational logic in processors and controllers  
- Debugging synthesis warnings and simulation mismatches  
- Ensuring robust FSM and control signal designs

---

## 🔑 Keywords

Verilog, Latch Inference, Always Block, Combinational Logic, if-else, Default Assignment, HDLBits, Simulation vs Synthesis, Procedural Code Safety
```
