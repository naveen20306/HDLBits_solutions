# ⏱️ 1Hz Pulse Generator Using BCD Counters

## 📘 Problem Statement

Build a frequency divider that converts a **1000 Hz** clock into a **1 Hz pulse** (`OneHertz`). This pulse is high for exactly one clock cycle every second and can be used to trigger second counters in a digital clock. Use three **BCD counters** in series to achieve this division.

---

## 🔧 Module Interface

| Signal         | Direction | Width | Description                                      |
|----------------|-----------|-------|--------------------------------------------------|
| `clk`          | Input     | 1     | 1000 Hz input clock                              |
| `reset`        | Input     | 1     | Synchronous active-high reset                    |
| `OneHertz`     | Output    | 1     | 1 Hz output pulse                                |
| `c_enable[2:0]`| Output    | 3     | Enable signals for BCD counters                  |

---

## 🧠 Functional Breakdown

### ⚙️ Clock Division Strategy

To divide 1000 Hz → 1 Hz:
- Chain **three BCD (mod-10)** counters: 10 × 10 × 10 = 1000 cycles
- When all three counters roll over (i.e., reach 999), assert `OneHertz` for **1 cycle**

### 🔁 Counter Cascade

- `c_enable[0] = 1'b1` → always enabled
- `c_enable[1] = (Q0 == 9)`
- `c_enable[2] = (Q0 == 9) && (Q1 == 9)`
- `OneHertz = (Q0 == 9) && (Q1 == 9) && (Q2 == 9)`

Where `Q0`, `Q1`, `Q2` are outputs of the three `bcdcount` modules.

---

## 🧩 Module Composition

Use the provided `bcdcount` module three times with appropriate cascading logic:
```verilog
bcdcount counter0 (.clk(clk), .reset(reset), .enable(c_enable[0]), .Q(Q0));
bcdcount counter1 (.clk(clk), .reset(reset), .enable(c_enable[1]), .Q(Q1));
bcdcount counter2 (.clk(clk), .reset(reset), .enable(c_enable[2]), .Q(Q2));
```

---

## ✅ Use Case

The `OneHertz` pulse is typically used in:
- **Digital wall clocks**
- **Wristwatch second tickers**
- **Low-frequency timers**
- Any synchronous system needing **1-second triggers**

---

## 👨‍💻 Maintained By
**Naveen Kumar B**
