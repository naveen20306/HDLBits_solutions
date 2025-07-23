# 🔁 32-bit Galois LFSR

## 📝 Problem Statement

Design a **32-bit Linear Feedback Shift Register (LFSR)** using the **Galois configuration** with the following tap positions:
- **Bit 32**
- **Bit 22**
- **Bit 2**
- **Bit 1**

---

## 🔧 Module Interface

| Signal | Direction | Width   | Description                                      |
|--------|-----------|---------|--------------------------------------------------|
| clk    | Input     | 1 bit   | System clock                                     |
| reset  | Input     | 1 bit   | Synchronous active-high reset to `32'h1`         |
| q      | Output    | 32 bits | LFSR output (non-zero, cycles through 2³²−1 states) |

---

## 🔁 LFSR Behavior

- On `reset = 1`: LFSR is initialized to `32'h1`
- On each clock edge: If `reset = 0`, output is shifted and feedback is applied.
- Feedback bit (new MSB) = XOR of selected tap bits with LSB
- Operates in **Galois** mode (XOR feedback applied inside the shift chain)

---

## 💡 Implementation Tips

- Use a single 32-bit `reg` instead of 32 DFFs.
- Carefully identify which bits are XORed with the output (bit 0).
- Efficient for hardware because of reduced logic depth.

---

## 🧠 Applications

- Pseudo-random number generation  
- Data scrambling/encoding  
- Built-In Self-Test (BIST) in digital circuits  
- Spread spectrum in communication systems

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
