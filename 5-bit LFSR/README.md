# 🔁 5-bit Galois Linear Feedback Shift Register (LFSR)

## 📌 Description

This module implements a **5-bit maximal-length Galois LFSR** using tap positions at bits 5 and 3. The design produces a pseudorandom sequence of 31 non-zero states before repeating. The all-zero state is avoided by initializing the register to `5'b00001`.

> 🔗 Tap positions (from diagram): 5 and 3  
> XOR applied to bits with taps and LSB (`q[0]`)

---

## 🧮 I/O Ports

| Signal   | Direction | Width | Description |
|----------|-----------|-------|-------------|
| `clk`    | Input     | 1     | Clock signal |
| `reset`  | Input     | 1     | Synchronous active-high reset to `5'b00001` |
| `q`      | Output    | 5     | Current LFSR value |

---

## 🔧 Behavior

- On `reset = 1`: `q` is set to `5'b00001`
- On each positive edge of `clk`:
  - Right shift the register
  - Tap positions XOR with `q[0]`:
    - `q[4]` and `q[2]` are affected
  - Output cycles through 31 distinct values

### 📈 Example Sequence (first few states):
```
00001 → 10100 → 01010 → 00101 → 10010 → ...
```

---

## 📚 Theory

- Galois LFSRs allow **efficient hardware implementation**
- Tap configuration determines cycle length and randomness
- This 5-bit configuration is **maximum-length**, producing `2^5 - 1 = 31` unique states

---

## ✅ Use Cases

- Pseudo-random number generation
- CRC computation
- Built-In Self-Test (BIST) in hardware

---

## 📎 Reference Diagram

![LFSR Diagram](https://hdlbits.01xz.net/mw/images/9/9a/Lfsr5.png)

---
```
