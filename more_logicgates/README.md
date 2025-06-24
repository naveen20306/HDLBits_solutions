# 🔌 gates – Logic Gate Outputs

## 📘 Problem Statement

Design a combinational circuit with two inputs:  
`a` and `b`.

Produce **seven outputs**, each representing a different logic gate operation between these two inputs.

---

## 🧾 Output Description

| Output       | Description             | Logic Expression     |
|--------------|-------------------------|-----------------------|
| `out_and`    | AND gate                | `a & b`               |
| `out_or`     | OR gate                 | `a \| b`              |
| `out_xor`    | XOR gate                | `a ^ b`               |
| `out_nand`   | NAND gate               | `~(a & b)`            |
| `out_nor`    | NOR gate                | `~(a \| b)`           |
| `out_xnor`   | XNOR gate               | `~(a ^ b)`            |
| `out_anotb`  | A AND NOT B             | `a & ~b`              |

---

## 🧠 Key Concepts

- Basic combinational logic gates
- Logical operators in Verilog
- Multi-output module structure

---

## 📤 HDLBits Page

You can find the original problem here:  
🔗 [HDLBits – Gates](https://hdlbits.01xz.net/wiki/Gates)
