# ➕ Hadd – Half Adder

## 📘 Problem Statement

Create a **half adder** that adds two 1-bit inputs:
- Operands: `a` and `b`

The module produces:
- `sum`: The sum of `a` and `b`
- `cout`: Carry-out bit

---

## 🧮 Truth Table

| a | b | sum | cout |
|---|---|-----|------|
| 0 | 0 |  0  |  0   |
| 0 | 1 |  1  |  0   |
| 1 | 0 |  1  |  0   |
| 1 | 1 |  0  |  1   |

---

## 🧠 Logic Equations

- **sum**  = `a ^ b`  
- **cout** = `a & b`

---

## 🖥️ Module Declaration

```verilog
module top_module( 
    input a, b,
    output cout, sum );
```

---

## ⚙️ Implementation

```verilog
assign sum = a ^ b;
assign cout = a & b;
```

---


## 🧩 Concepts Reinforced

- Half adder logic
- XOR and AND gate behavior
- Basic combinational circuits

---

## 🧑‍💻 Maintained By

**Naveen Kumar B**
