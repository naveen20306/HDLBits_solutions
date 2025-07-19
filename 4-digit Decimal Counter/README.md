# 🔢 4-Digit BCD Counter (0000 to 9999)

## 📝 Problem Statement

Create a **4-digit BCD counter** with synchronous active-high reset. The 16-bit output `q[15:0]` encodes 4 decimal digits in BCD format:
- `q[3:0]` = ones
- `q[7:4]` = tens
- `q[11:8]` = hundreds
- `q[15:12]` = thousands

Also generate `ena[3:1]` to indicate when to enable counting for the higher digits.

---

## 🔧 Module Interface

| Signal  | Direction | Width  | Description                               |
|---------|-----------|--------|-------------------------------------------|
| clk     | Input     | 1 bit  | Clock signal                              |
| reset   | Input     | 1 bit  | Synchronous active-high reset             |
| ena     | Output    | 3 bits | Enable signals for digits 1-3             |
| q       | Output    | 16 bits| BCD digits from ones to thousands         |

---

## 💡 Use Case

Commonly used in:
- Digital clocks
- Electronic counters
- Stopwatch displays

---

## 📦 Suggested Implementation

You can reuse or instantiate four single-digit BCD counters, passing the appropriate enable signals based on rollover.

---

## 👨‍💻 Maintained By
**Naveen Kumar B**
