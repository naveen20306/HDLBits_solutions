# 🔁 D-Latch with Enable – Exams/m2014_q4a

## 📘 Problem Statement

Implement a **D-latch with enable**, as shown in the given schematic:

🖼️ [Circuit Diagram](https://hdlbits.01xz.net/mw/images/0/03/Exams_m2014q4a.png)

The circuit is a **level-sensitive latch** that behaves as follows:

- When `ena == 1`: `q` follows input `d`
- When `ena == 0`: `q` retains its last value

---

## ✅ Inputs and Output

- **Inputs**:
  - `d`: Data input
  - `ena`: Enable signal

- **Output**:
  - `q`: Output that either updates or holds its state

---

## 🧠 Behavior

| ena | d | q (next) |
|-----|---|-----------|
|  1  | 0 | 0         |
|  1  | 1 | 1         |
|  0  | x | retains last value |

Note: This is a **latch**, not a flip-flop — it is **level-sensitive**, not edge-triggered.

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input d,
    input ena,
    output reg q
);
```

---

## ⚠️ Notes

- **Latch inference** warnings are expected in Quartus or similar tools.
- Use **non-blocking assignment (`<=`)** even for latches, as they are sequential elements.

---

## 🧩 Concepts Reinforced

- D-latch behavior
- Level-sensitive sequential logic
- Proper always block sensitivity (`always @(*)`)

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
