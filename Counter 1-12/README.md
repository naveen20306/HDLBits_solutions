# 🔢 1–12 Counter with Synchronous Reset and Enable

## 📘 Problem Statement
Design a **mod-12 counter** (counts from 1 to 12) with the following specifications:
- **Synchronous reset**: Sets counter to 1 when `reset = 1`
- **Enable**: Counting only happens when `enable = 1`
- Use a provided `count4` module (4-bit counter) with:
  - `clk` (clock)
  - `enable`
  - `load` (priority over enable)
  - `d[3:0]` (data input)
- Output:
  - `Q` – current count value
  - `c_enable`, `c_load`, `c_d` – internal control signals to `count4`

---

## 🔧 Module Interface

| Signal     | Direction | Width | Description                                      |
|------------|-----------|-------|--------------------------------------------------|
| `clk`      | Input     | 1     | Clock input (posedge triggered)                 |
| `reset`    | Input     | 1     | Active-high synchronous reset (sets Q to 1)     |
| `enable`   | Input     | 1     | Counter enable                                   |
| `Q`        | Output    | 4     | Current counter output (1–12)                    |
| `c_enable` | Output    | 1     | Enable signal to internal counter (`count4`)    |
| `c_load`   | Output    | 1     | Load signal to `count4` (priority over enable)  |
| `c_d`      | Output    | 4     | Value to load into `count4`                     |

---

## 🧠 Functional Behavior

| Condition                     | Action                  |
|------------------------------|-------------------------|
| `reset == 1`                 | Load `Q ← 1`            |
| `Q == 12 && enable == 1`     | Wrap to `Q ← 1`         |
| `enable == 1`                | `Q ← Q + 1`             |
| `enable == 0`                | Hold `Q` (no change)    |

---

## 🧩 Design Strategy

Use logic to control the internal counter:
- `c_load = reset || (Q == 12 && enable)`
- `c_d = 1` always when loading
- `c_enable = enable && !c_load`

The actual counter operation is handled by instantiating `count4` with these control signals.

---

## 👨‍💻 Maintained By
**Naveen Kumar B**
