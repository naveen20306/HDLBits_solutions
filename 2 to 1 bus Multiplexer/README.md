# 🔀 Mux2to1v – 100-bit 2-to-1 Multiplexer

## 📘 Problem Statement

Design a **100-bit wide, 2-to-1 multiplexer**. This circuit selects one of two 100-bit input vectors based on a single-bit control signal.

---

## ✅ Inputs and Output

- **Inputs**:
  - `a`, `b`: 100-bit input vectors
  - `sel`: 1-bit select signal

- **Output**:
  - `out`: 100-bit output vector

---

## 🧠 Behavior

| sel | out      |
|-----|----------|
|  0  | a[99:0]  |
|  1  | b[99:0]  |

---

## 🖥️ Module Declaration

```verilog
module top_module( 
    input [99:0] a, 
    input [99:0] b,
    input sel,
    output [99:0] out 
);
```

---

## 🧪 Implementation

```verilog
assign out = sel ? b : a;
```

This uses the **ternary operator** to select between vectors `a` and `b` depending on the value of `sel`.


---

## 🧩 Concepts Reinforced

- Vector operations in Verilog
- Conditional (ternary) operator
- Multiplexer logic for buses

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
