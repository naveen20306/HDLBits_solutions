# 🔀 Mux256to1v – 4-bit Wide 256-to-1 Multiplexer

## 📘 Problem Statement

Design a **4-bit wide, 256-to-1 multiplexer**. Each of the 256 inputs is 4 bits wide and packed into a single 1024-bit input vector `in[1023:0]`. The 8-bit selector `sel` determines which 4-bit segment to output.

---

## ✅ Inputs and Output

- **Inputs**:
  - `in`: 1024-bit input vector (256 × 4-bit inputs)
  - `sel`: 8-bit selector

- **Output**:
  - `out`: 4-bit output, selects the 4-bit chunk specified by `sel`

---

## 🧠 Behavior

- Each `sel` value corresponds to a 4-bit group in `in`:
  ```
  out = in[ (sel*4) +: 4 ];
  ```

For example:
- `sel = 8'd0` → `out = in[3:0]`
- `sel = 8'd1` → `out = in[7:4]`
- `sel = 8'd2` → `out = in[11:8]`

---

## 🖥️ Module Declaration

```verilog
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
```

---

## ⚙️ Implementation

```verilog
assign out = in[sel*4 +: 4];
```

This uses **bit slicing with dynamic part-select**: `[start_index +: width]`

---


## 🧩 Concepts Reinforced

- Packed vectors
- Part-select in Verilog (`+:`)
- Efficient bus multiplexing

---

## 🧑‍💻 Maintained By

**Naveen Kumar B**
