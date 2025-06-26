# 🔀 Mux2to1 – 1-bit 2-to-1 Multiplexer

## 📘 Problem Statement

Design a **1-bit wide, 2-to-1 multiplexer**. A multiplexer selects one of two inputs based on a control signal (`sel`).

### ✅ Requirements

- **Inputs**:
  - `a`, `b`: 1-bit data inputs
  - `sel`: 1-bit select signal

- **Output**:
  - `out`: Selected output value

### 🧠 Behavior

| sel | out |
|-----|-----|
|  0  |  a  |
|  1  |  b  |

---

## 🖥️ Module Declaration

```verilog
module top_module( 
    input a, 
    input b, 
    input sel,
    output out 
);
```

Use a single-line conditional (ternary) operator or basic logic gate expression for simplicity.

---

## 🧪 Example Logic

```verilog
assign out = sel ? b : a;
```

This line reads: “If `sel` is 1, output `b`; otherwise, output `a`.”

---

## 🧩 Concepts Reinforced

- Combinational logic
- Multiplexer fundamentals
- Ternary operator in Verilog

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
