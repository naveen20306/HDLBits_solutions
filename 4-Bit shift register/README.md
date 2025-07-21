# 🔁 4-bit Shift Register

## 📝 Problem Statement

Design a **4-bit right shift register** with:

- **Asynchronous reset** (to zero)
- **Synchronous load** from external data
- **Enable-controlled right shifting**

### 🧾 Behavior Rules

| Signal | Type | Description |
|--------|------|-------------|
| `areset` | Input | **Asynchronous**, active-high reset to `4'b0000` |
| `load`   | Input | When high, loads `data` into register (priority over shift) |
| `ena`    | Input | Enables right shift by 1 on each clock cycle |
| `data`   | Input | 4-bit value to be loaded into the shift register |
| `q`      | Output | 4-bit shift register contents |

**Right Shift Behavior:**
- On each clock edge (if `ena == 1` and `load == 0`): `q <= {1'b0, q[3:1]}`  
- If both `load` and `ena` are high, **load takes precedence**.

---

## 📐 Module Declaration

```verilog
module top_module(
    input clk,
    input areset,   // Async active-high reset to zero
    input load,     // Synchronous load
    input ena,      // Enable shift
    input [3:0] data,
    output reg [3:0] q
);
```

---

## 💡 Usage Example

| Cycle | areset | load | ena | data  | q (after clk) |
|-------|--------|------|-----|-------|----------------|
| 0     | 1      | 0    | 0   | xxxx  | 0000 (reset)    |
| 1     | 0      | 1    | 0   | 1101  | 1101 (load)     |
| 2     | 0      | 0    | 1   | xxxx  | 0110 (shift)    |
| 3     | 0      | 0    | 1   | xxxx  | 0011 (shift)    |

---

## 🧠 Notes

- Make sure asynchronous reset logic is properly written using `always @(posedge clk or posedge areset)`
- Use conditional logic in the proper priority: `if (areset)` → `else if (load)` → `else if (ena)`

---
```
