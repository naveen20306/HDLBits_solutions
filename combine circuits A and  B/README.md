# 🧩 Mt2015_q4 – Hierarchical Design with Submodules

## 📘 Problem Statement

Taken from **2015 midterm question 4**.

In this exercise, you’ll build a **hierarchical Verilog module** by instantiating multiple submodules to form a top-level design. The module relies on two subcircuits:

- **Module A**: Implements `z = (x ^ y) & x`
- **Module B**: Implements `z = 1` when `x == y`

You must instantiate **two of each** submodule (A and B), and connect them as shown in the following schematic:

```
https://hdlbits.01xz.net/mw/images/f/f5/Mt2015_q4.png
```

---

## 🧱 Submodules Used

### ✅ Module A
Implements the function:
```verilog
assign z = (x ^ y) & x;
```

### ✅ Module B
Implements the function:
```verilog
assign z = (x == y);
```

---

## 🧩 Top-Level Design

### 📥 Inputs
- `input [3:0] a`
- `input [3:0] b`

### 📤 Output
- `output [3:0] z`

### 📦 Internal Connections
Refer to the diagram for how the wires from the two modules A and two modules B are connected.

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input  [3:0] a,
    input  [3:0] b,
    output [3:0] z
);
```
---

## 🔁 Concepts Reinforced

- Hierarchical design in Verilog
- Submodule instantiation
- Proper signal wiring
- Functional decomposition

---

## 📷 Reference Image

```markdown
![mt2015_q4 Diagram](https://hdlbits.01xz.net/mw/images/f/f5/Mt2015_q4.png)
```

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
