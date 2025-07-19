# 🕒 12-Hour Clock with AM/PM Indicator

## 📝 Problem Statement

Design a **12-hour digital clock** with:
- Time format: `hh:mm:ss` in **BCD** (8 bits per unit)
- `pm` output flag
- Clock pulses provided via `ena` (1 Hz enable)
- Synchronous `reset` to **12:00:00 AM**
- Valid hour range: **01 to 12**

---

## 🔧 Module Interface

| Signal | Direction | Width | Description |
|--------|-----------|-------|-------------|
| clk    | Input     | 1 bit | System clock |
| reset  | Input     | 1 bit | Active-high synchronous reset |
| ena    | Input     | 1 bit | Pulse to increment clock (1 Hz) |
| pm     | Output    | 1 bit | AM/PM flag (0 = AM, 1 = PM) |
| hh     | Output    | 8 bits| Hours in BCD (01 to 12) |
| mm     | Output    | 8 bits| Minutes in BCD (00 to 59) |
| ss     | Output    | 8 bits| Seconds in BCD (00 to 59) |

---

## ℹ️ HDLBits Implementation Notes

> 🛠 HDLBits runs on Intel Quartus, which allows `assign` statements to have **reg**-typed LHS (left-hand side), which is generally not synthesizable in standard tools. Be mindful of this if reusing code elsewhere.

> 😞 One limitation in the HDLBits version is that the `ena` signal is used **without actually deriving a 1Hz clock**. So while it works in simulation, it doesn't represent a realistic second-by-second increment.

---

## 💡 My Improved Clock Design

To address the timing accuracy, I wrote a **generic Verilog-based 12-hour clock** which maintains 1-second precision. This implementation includes a frequency divider based on the system clock speed.

### 📁 File Breakdown

1. `Clock_12hrs.v` — Top-level module combining all logic.
2. `Seconds_ena.v` — Generates an enable pulse exactly once every second based on clock division.
3. `seconds_and_minute_counter.v` — BCD counter module for seconds and minutes (00–59).
4. `hour_counter.v` — BCD counter from 01–12 with AM/PM toggling.
5. `Clock12hrs_tb.v` — Testbench for simulation and verification.

### ⚙️ Customization

Set your desired system clock speed via the `MAX_COUNT` parameter:

```verilog
parameter MAX_COUNT = 1000; // Use 100000000 for 100MHz clock
```

This flexibility allows the design to scale for any clock frequency.

---

## 🔁 Timing Behavior

- PM toggles after 11:59:59 → 12:00:00
- Rollovers:
  - `ss: 59 → 00` sets `ena` for minutes
  - `mm: 59 → 00` sets `ena` for hours
  - `hh: 12 → 01` with PM toggle when appropriate

---

## 🧠 Use Cases

- Digital clocks with precise second increments
- FPGA-based timer circuits
- Educational and lab experiments for BCD counters

---

## 👨‍💻 Author

**Naveen Kumar B**
```
