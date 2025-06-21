# HDLBits - 7458 Logic Chip

## 🔍 Problem Statement

The "7458" is a chip with "four AND gates" and "two OR gates". This problem is slightly more complex than "7420".

Create a Verilog module with the "same functionality" as the 7458 chip. It has "10 inputs" and "2 outputs".

You may choose to:
- Use `assign` statements to drive each of the output wires  
OR  
- Declare "four wires" as intermediate signals for the outputs of the AND gates and use those in the final OR outputs.

For extra practice,try "both ways".

## 🎯 Objective
- Understand how to model a real IC using basic logic gates.
- Use intermediate wires or direct assignments to build multi-level logic.
- Replicate internal structure using "AND" and "OR" gates.

## 🧠 Concept
- Internal connections between gates can be built using `wire` and `assign`.
- Modular design with intermediate wires often improves clarity and debugging.
- Output logic:
  - `out1 = (A1 & B1) | (A2 & B2)`
  - `out2 = (A3 & B3) | (A4 & B4)`

## 🖼️ Diagram
![7458 Logic Diagram](https://hdlbits.01xz.net/mw/images/e/e1/7458.png)

---

✅ This is a foundational logic-building problem that introduces how real-world ICs can be recreated in Verilog using a combination of simple gates.

