# 🧠 Gatesv100 – Bitwise Neighbor Logic (100-bit Vector)

## 📘 Problem Statement

This is an extended version of the bitwise neighbor relationship logic problem, now working on a **100-bit input vector**.

Given:

```verilog
input [99:0] in
```

You must generate three output vectors that analyze relationships between neighboring bits.

---

## ✅ Output Descriptions

### 🔹 `out_both[98:0]`
Each bit `i` indicates whether both `in[i]` **and its left neighbor** `in[i+1]` are `'1'`.

- `out_both[99]` is unused (no neighbor to the left).
- Logic:
  ```verilog
  out_both[i] = in[i] & in[i+1]; // for i = 0 to 98
  ```

### 🔹 `out_any[99:1]`
Each bit `i` indicates whether `in[i]` **or its right neighbor** `in[i-1]` is `'1'`.

- `out_any[0]` is unused (no neighbor to the right).
- Logic:
  ```verilog
  out_any[i] = in[i] | in[i-1]; // for i = 1 to 99
  ```

### 🔹 `out_different[99:0]`
Each bit `i` indicates whether `in[i]` is **different from its left neighbor**.

- Treat vector as **circular** (wrap around), so:
  - `in[99]`'s left neighbor is `in[0]`.
- Logic using XOR:
  ```verilog
  out_different[i] = in[i] ^ in[(i+1)%100];
  ```

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input  [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different
);
```
---

## 🔁 Concepts Reinforced

- Bitwise indexing in wide vectors
- Neighboring logic operations
- Wrap-around indexing
- Efficient use of vector slicing in Verilog

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
