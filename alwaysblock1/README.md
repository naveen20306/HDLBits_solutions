```markdown
# Alwaysblock1 – Using Combinational Always Blocks vs. Assign Statements

## 🧠 Overview

This exercise introduces the **combinational `always @(*)` block**, an alternative to the `assign` statement for describing **combinational logic** in Verilog. While both methods synthesize the same hardware, they use different syntax and are suited for different coding styles or complexities.

The goal of this exercise is to implement the same AND gate behavior using:
1. A traditional `assign` statement
2. A combinational `always` block (`always @(*)`)

## 🔧 Functional Requirements

Create a module that implements a simple **AND gate** (`out = a & b`) using:
- One `assign` statement (declarative style)
- One `always @(*)` block (procedural style)

While the exercise can't enforce the use of both, it's meant for **hands-on practice** to understand syntax, simulation behavior, and how tools interpret combinational logic.

---

### 🔁 Syntax Comparison

#### ✅ Assign Style (Continuous Assignment)

```verilog
assign out1 = a & b;
```

- Requires output to be of type `wire`.
- Declarative and compact.
- Synthesized as a combinational logic gate.

#### ✅ Always Block Style (Procedural Assignment)

```verilog
always @(*) begin
    out2 = a & b;
end
```

- Requires output to be of type `reg`.
- Allows richer logic structures like `if`, `case`, etc.
- Useful for more complex combinational designs.

---

## 📚 Key Concepts

- **Combinational Logic in Verilog**:
  - Can be described using both `assign` and `always @(*)`.

- **Sensitivity List**:
  - Use `(*)` in `always` blocks to avoid simulation mismatches.
  - Missing signals in an explicit list can break simulation but not synthesis.

- **reg vs. wire**:
  - `reg`: required for variables inside `always` blocks.
  - `wire`: required for outputs from `assign` statements.
  - **These are Verilog data types**, not hardware specifications.

- **Simulation vs. Synthesis**:
  - Simulation respects the sensitivity list.
  - Synthesized hardware automatically behaves as if `(*)` was used.

---

## 🖼️ Diagram

Illustration of equivalent logic using both styles:  
![Always Block Combinational Logic](https://hdlbits.01xz.net/mw/images/2/2b/Alwayscomb.png)

---

## 💡 Applications

- Design flexibility: choose the style best suited for the logic complexity
- Practice working with procedural constructs in combinational logic
- Learn potential simulation pitfalls due to incomplete sensitivity lists

---

## 🔑 Keywords

Verilog, Always Block, Combinational Logic, Assign Statement, Sensitivity List, Reg vs Wire, HDLBits, Procedural Syntax, Synthesis vs Simulation
```
