# 🔢 Bcdadd4 – 4-digit BCD Ripple-Carry Adder

## 📘 Problem Statement

You are given a one-digit **BCD adder module** `bcd_fadd` that adds two 4-bit BCD numbers with a carry-in:

```verilog
module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input       cin,
    output      cout,
    output [3:0] sum
);
```

Your task is to **instantiate four copies** of this module to implement a **4-digit BCD ripple-carry adder**.

---

## ✅ Inputs and Output

- **Inputs**:
  - `a`: 16-bit BCD input (4 digits, packed as 4x4 bits)
  - `b`: 16-bit BCD input (4 digits, packed as 4x4 bits)
  - `cin`: Carry-in for the least significant digit

- **Outputs**:
  - `sum`: 16-bit BCD sum (packed 4-digit result)
  - `cout`: Final carry-out from the most significant digit

---

## 🧠 Behavior

You must add the corresponding 4-bit BCD digits of `a` and `b`, propagating carry between each digit like a ripple-carry adder:

| Digit Index | Inputs      | Carry In | Output Sum | Carry Out |
|-------------|-------------|----------|-------------|------------|
| 0 (LSB)     | a[3:0], b[3:0]     | cin      | sum[3:0]     | c0         |
| 1           | a[7:4], b[7:4]     | c0       | sum[7:4]     | c1         |
| 2           | a[11:8], b[11:8]   | c1       | sum[11:8]    | c2         |
| 3 (MSB)     | a[15:12], b[15:12] | c2       | sum[15:12]   | cout       |

---

## 🖥️ Module Declaration

```verilog
module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum
);
```

---

## 🧩 Concepts Reinforced

- Structural design using module instantiation
- Binary-Coded Decimal (BCD) arithmetic
- Ripple-carry propagation across modules

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
