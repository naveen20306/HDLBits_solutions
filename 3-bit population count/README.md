# 🧮 Population Count (3-bit)

## 📘 Problem Statement

Create a **combinational circuit** that implements a **population count** for a **3-bit input vector**.  
The output should indicate how many of the input bits are set to `'1'`.

---

## 📥 Inputs

- `in[2:0]` : 3-bit input vector

## 📤 Output

- `out[1:0]` : 2-bit output indicating the number of `'1'`s in `in`

---

## 🔧 Example

| `in`  | Binary Count of '1's | `out` |
|-------|-----------------------|--------|
| 000   | 0                     | 00     |
| 001   | 1                     | 01     |
| 011   | 2                     | 10     |
| 111   | 3                     | 11     |

---

## 🛠️ Logic Design

You can add the bits together using standard Verilog arithmetic.

```verilog
assign out = in[0] + in[1] + in[2];
```

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input [2:0] in,
    output [1:0] out
);
```

---

## 🎯 Concepts Reinforced

- Binary addition
- Vector element access
- Summation logic using `assign`

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
