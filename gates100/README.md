# 🔌 Gates100 – 100-Input Logic Gate Reduction

## 🔍 Overview

This exercise demonstrates how to use **Verilog reduction operators** to build large-scale combinational logic circuits efficiently. You are asked to implement a circuit that performs **AND**, **OR**, and **XOR** operations across a 100-bit input vector.

Instead of writing long expressions like `in[0] & in[1] & ...`, Verilog provides **reduction operators** to condense this logic into clean, one-line expressions.

---

## 📐 Functional Requirements

- **Input:**  
  - `in`: 100-bit input vector

- **Outputs:**  
  - `out_and`: 1-bit result of AND-ing all bits in `in`  
  - `out_or` : 1-bit result of OR-ing all bits in `in`  
  - `out_xor`: 1-bit result of XOR-ing all bits in `in`

---

## 📥 Port Definition

```verilog
input      [99:0] in;
output            out_and, out_or, out_xor;
```

---

## ✅ Implementation Example

```verilog
module top_module (
    input  [99:0] in,
    output        out_and,
    output        out_or,
    output        out_xor
);

    assign out_and = &in;   // AND reduction
    assign out_or  = |in;   // OR reduction
    assign out_xor = ^in;   // XOR reduction

endmodule
```

> ✅ These **unary reduction operators** work on the entire vector to produce a single-bit result.

---

## 📚 Key Concepts

- **Reduction Operators**:
  - `&in`  → AND all bits together
  - `|in`  → OR all bits together
  - `^in`  → XOR all bits together

- **Scalability**:
  - These constructs are **synthesizable** and **scale well**, even for wide vectors like `in[99:0]`.

- **Use Cases**:
  - Widely used in **parity checking**, **population count**, and **data validity flags**.

---

## 💡 Applications

- Signal aggregation (e.g., “Are all inputs high?”)  
- Fast combinational flag generation  
- Hardware reduction trees  
- Fault detection and voting systems

---

## 🔑 Keywords

Verilog, Reduction Operator, 100-Input Gate, AND OR XOR, Bitwise Logic, Combinational Circuit, HDLBits, Vector Reduction, Large-scale Logic
