# 🔁 MT2015 Mux-DFF based LFSR

## 📝 Problem Statement

Build a 3-bit **Linear Feedback Shift Register (LFSR)** using multiplexed D flip-flops.  
This is based on a midterm exam question from 2015 and demonstrates how LFSRs can be constructed for pseudo-random sequence generation.

---

## 🔧 Module Interface

| Signal  | Direction | Width | Description                       |
|---------|-----------|-------|-----------------------------------|
| SW      | Input     | 3-bit | Data input for parallel load (R) |
| KEY[0]  | Input     | 1-bit | Clock input                       |
| KEY[1]  | Input     | 1-bit | Load control (1 = load, 0 = LFSR) |
| LEDR    | Output    | 3-bit | Output of LFSR                    |

---

## 🔁 LFSR Behavior

- If `KEY[1]` (Load) is high → Load data from `SW` into the register.
- If `KEY[1]` is low → Advance the LFSR using feedback from taps.
- Taps used: bit positions 3 and 1.
- The LFSR avoids the all-zero state and cycles through 7 unique values.

---

## 💡 Key Concepts

- **LFSR (Linear Feedback Shift Register):** Hardware-efficient pseudo-random number generator.
- **Mux-DFF Architecture:** Allows loading or shifting based on control input.
- **Galois Feedback Configuration:** Feedback applied within the register chain.

---

## 🎯 Target Board

This circuit is designed for the **Intel DE1-SoC** board:
- `SW[2:0]` → Toggle switches (data input)
- `KEY[1]` → Load control
- `KEY[0]` → Clock signal
- `LEDR[2:0]` → Output display

---

## 🧠 Applications

- Pseudo-random sequence generation  
- Hardware test patterns  
- Encryption seed generation  
- Finite-state machine cycling

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
```
