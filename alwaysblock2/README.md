```markdown
# Alwaysblock2 – Exploring Combinational and Clocked Always Blocks

## 🧠 Overview

This exercise extends your understanding of Verilog's `always` blocks by comparing:
- **Combinational logic** using `always @(*)`
- **Clocked (sequential) logic** using `always @(posedge clk)`
- **Continuous assignment** using `assign`

Each method is used to implement the same XOR gate, but only the **clocked version introduces a flip-flop**, resulting in **delayed output**.

---

## 🔧 Functional Requirements

You must implement an XOR gate using **three methods**:
1. `assign` – continuous assignment (combinational, immediate)
2. `always @(*)` – combinational `always` block
3. `always @(posedge clk)` – sequential logic with flip-flop

### Port Definitions:
```verilog
input  wire clk;
input  wire a, b;
output wire out_assign;
output reg  out_comb;
output reg  out_clk;
```

### Example Implementation Snippets:

#### ✅ Continuous Assignment
```verilog
assign out_assign = a ^ b;
```

#### ✅ Combinational Always Block
```verilog
always @(*) begin
    out_comb = a ^ b;
end
```

#### ✅ Clocked Always Block (with Flip-Flop)
```verilog
always @(posedge clk) begin
    out_clk <= a ^ b;
end
```

---

## 📚 Key Concepts

- **Combinational vs Sequential Logic**:
  - `assign` and `always @(*)` yield immediate outputs.
  - `always @(posedge clk)` delays output by 1 clock cycle (adds a flip-flop).

- **Assignment Types**:
  - `assign` → outside any procedure, only for wires
  - `=` (blocking) → inside `always @(*)`
  - `<=` (non-blocking) → inside `always @(posedge clk)`

- **Best Practices**:
  - Use **blocking assignments (`=`)** for combinational logic.
  - Use **non-blocking assignments (`<=`)** for clocked/sequential logic.
  - Avoid mixing `=` and `<=` in the same clocked `always` block.

- **Synthesis vs Simulation Pitfalls**:
  - Incorrect assignment type can result in mismatches between simulation and synthesized hardware behavior.

---

## 🖼️ Diagram

Visual comparison of the three XOR implementations:  
![Always Block XOR Diagram](https://hdlbits.01xz.net/mw/images/4/40/Alwaysff.png)

---

## 💡 Applications

- Differentiating between **combinational** and **sequential** designs  
- Understanding **timing and data synchronization**  
- Practicing **flip-flop integration** using clocked logic  

---

## 🔑 Keywords

Verilog, always @(*), always @(posedge clk), Blocking vs Non-blocking, assign, Combinational Logic, Sequential Logic, XOR Gate, HDLBits, Flip-Flop
```
