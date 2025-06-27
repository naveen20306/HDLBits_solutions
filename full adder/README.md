# ➕ Fadd – Full Adder

## 📘 Problem Statement

Create a **full adder** that adds three 1-bit inputs:
- Operand bits: `a` and `b`
- Carry-in: `cin`

The module produces:
- Sum bit: `sum`
- Carry-out bit: `cout`

---

## 🧮 Truth Table

| a | b | cin | sum | cout |
|---|---|-----|-----|------|
| 0 | 0 |  0  |  0  |  0   |
| 0 | 0 |  1  |  1  |  0   |
| 0 | 1 |  0  |  1  |  0   |
| 0 | 1 |  1  |  0  |  1   |
| 1 | 0 |  0  |  1  |  0   |
| 1 | 0 |  1  |  0  |  1   |
| 1 | 1 |  0  |  0  |  1   |
| 1 | 1 |  1  |  1  |  1   |

---

## 🧠 Logic Equations

- **Sum** = `a ^ b ^ cin`  
- **Carry-out** = `(a & b) | (a & cin) | (b & cin)`

---

## 🖥️ Module Declaration

```verilog
module top_module( 
    input a, b, cin,
    output cout, sum );
```

---

## ⚙️ Implementation

```verilog
assign sum = a ^ b ^ cin;
assign cout = (a & b) | (a & cin) | (b & cin);
```

---


## 🧩 Concepts Reinforced

- Full adder logic
- Carry propagation
- Combinational circuit design

---

## 🧑‍💻 Maintained By

**Naveen Kumar B**
