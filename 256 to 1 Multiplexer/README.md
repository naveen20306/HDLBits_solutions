# 🎛️ Mux256to1 – 1-bit Wide 256-to-1 Multiplexer

## 📘 Problem Statement

Design a **1-bit wide, 256-to-1 multiplexer**. The 256 input bits are packed into a single 256-bit input vector `in[255:0]`. The 8-bit selector `sel` picks the bit from the `in` vector that is forwarded to the output.

---

## ✅ Inputs and Output

- **Inputs**:
  - `in`: 256-bit input vector
  - `sel`: 8-bit selector signal

- **Output**:
  - `out`: 1-bit output

---

## 🧠 Behavior

- The output is directly selected as:
  ```
  out = in[sel];
  ```

For example:
- `sel = 8'd0`  → `out = in[0]`
- `sel = 8'd200` → `out = in[200]`

---

## 🖥️ Module Declaration

```verilog
module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
```

---

## ⚙️ Implementation

```verilog
assign out = in[sel];
```

Simple and efficient use of Verilog vector indexing.

---


## 🧩 Concepts Reinforced

- Vector bit indexing
- Multiplexing large bus structures
- Minimal combinational logic

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
