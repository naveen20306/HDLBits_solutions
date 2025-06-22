```markdown
# Module shift – 3-bit Shift Register Using D Flip-Flops

## 🧠 Overview

This exercise focuses on constructing a **3-bit shift register** using three instances of a **D flip-flop module**. It highlights the concepts of module instantiation, sequential logic, and signal routing using wires. The goal is to correctly **chain the flip-flops** so that data is passed from one stage to the next on each clock cycle.

## 🔧 Functional Requirements

You are provided with a D flip-flop module named `my_dff`, defined as:

```verilog
module my_dff (
    input clk,
    input d,
    output q
);
```

### Your Task:
- Instantiate **three instances** of `my_dff`.
- Chain them to form a **3-bit shift register**.
- Use `clk` as the clock input for **all three** flip-flops.
- Connect the `d` input of the first flip-flop to the top-level input `d`.
- The output `q` of each flip-flop becomes the input to the next flip-flop.
- Output the result of each stage using top-level ports: `q1`, `q2`, and `q3`.

### Required Connections:

| Flip-Flop Stage | D Input Source     | Q Output Connection |
|------------------|--------------------|----------------------|
| DFF #1           | Top-level input `d`| Wire → `q1`          |
| DFF #2           | Wire from `q1`     | Wire → `q2`          |
| DFF #3           | Wire from `q2`     | Top-level output `q3`|

To create internal links between modules, use intermediate wires:
```verilog
wire w1, w2;
```

## 📚 Key Concepts

- **Sequential Logic Design**:
  - Data progresses with each rising edge of the clock.

- **Module Instantiation**:
  - Reuse the `my_dff` module to create multiple storage stages.
  - Ensure **unique instance names**.

- **Wire Declaration**:
  - Wires are essential for internal signal routing between submodules.

- **Synchronous Shift Registers**:
  - A fundamental building block for serial data handling and delay circuits.

## 🖼️ Diagram

Visual reference of the shift register design:  
![Module Shift Register Diagram](https://hdlbits.01xz.net/mw/images/6/60/Module_shift.png)

## 💡 Applications

- Serial-to-parallel data conversion
- Pipelining in digital signal processing
- Temporal delay elements in FSMs and counters

## 🔑 Keywords

Verilog, Shift Register, D Flip-Flop, Module Instantiation, Wire, Sequential Logic, HDLBits
```
