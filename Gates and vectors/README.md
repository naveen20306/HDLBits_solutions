# 🔍 Gatesv – Bitwise Neighbor Relationships

## 📘 Problem Statement

This problem explores bit-level relationships between elements of a 4-bit input vector using simple combinational logic.

You are given a 4-bit input vector:

```verilog
input [3:0] in
```

You must compute the following outputs:

### ✅ `out_both[2:0]`
- Each bit `i` in `out_both` should be `1` if both `in[i]` **and** its **left neighbor** `in[i+1]` are `1`.
- Since `in[3]` has no left neighbor, `out_both[3]` is not required.
- Essentially:
  ```verilog
  out_both[i] = in[i] & in[i+1]; // for i = 0 to 2
  ```

### ✅ `out_any[3:1]`
- Each bit `i` in `out_any` should be `1` if either `in[i]` **or** its **right neighbor** `in[i-1]` is `1`.
- Since `in[0]` has no right neighbor, `out_any[0]` is not required.
- Essentially:
  ```verilog
  out_any[i] = in[i] | in[i-1]; // for i = 1 to 3
  ```

### ✅ `out_different[3:0]`
- Each bit `i` should be `1` if `in[i]` is **not equal to** its **left neighbor**.
- This time the vector is **wrapped around**, so:
  - `in[3]`'s left neighbor is `in[0]`
- Implemented with XOR:
  ```verilog
  out_different[i] = in[i] ^ in[(i+1) % 4];
  ```

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input  [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different
);
```
---

## 🔁 Concepts Reinforced

- Bitwise operations
- Indexed logic between neighbors
- Vector wrapping
- Synthesis of simple logical relationships

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
