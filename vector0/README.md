# HDLBits - Vector0

## 🔍 Problem Statement

Vectors are used to group related signals using one name to make it more convenient to manipulate.

For example:  
`wire [7:0] w;` declares an "8-bit vector" named `w` that is functionally equivalent to having 8 separate wires.

Notice:
- The "declaration" of a vector places the dimensions *before* the name of the vector.
- A "part-select" uses the dimensions *after* the vector name (e.g., `w[2]`).

Create a circuit that has:
- One "3-bit input vector"
- One "3-bit output vector" (same as input)
- Three separate "1-bit outputs" named `o0`, `o1`, and `o2`

Each output should connect to a specific bit of the input vector:
- `o0` → bit 0  
- `o1` → bit 1  
- `o2` → bit 2

## 🎯 Objective
- Declare a 3-bit vector input
- Pass the vector directly to a 3-bit output
- Extract and assign each individual bit to its corresponding 1-bit output

## 🧠 Concept
- Vector syntax: `wire [2:0] vec;`
- Part-select syntax: `vec[1]` selects the second bit
- This problem practices working with:
  - Vector declarations
  - Part-selecting individual bits
  - Assigning to scalar outputs

## 🖼️ Diagram  
![Vector0 Diagram](https://hdlbits.01xz.net/mw/images/a/ae/Vector0.png)

---

✅ This is a beginner-level vector manipulation task to help you understand how to group and separate bits efficiently in Verilog.
