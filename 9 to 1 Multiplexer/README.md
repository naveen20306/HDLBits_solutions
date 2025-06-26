# 🔀 Mux9to1v – 16-bit 9-to-1 Multiplexer

## 📘 Problem Statement

Design a **16-bit wide, 9-to-1 multiplexer**. Based on a 4-bit select signal `sel`, one of the nine 16-bit input vectors (`a` through `i`) is routed to the output. If `sel` is between 9 and 15 (inclusive), the output should be all 1's (`16'b1111_1111_1111_1111`).

---

## ✅ Inputs and Output

- **Inputs**:
  - `a` to `i`: 16-bit input vectors
  - `sel`: 4-bit select signal

- **Output**:
  - `out`: 16-bit output vector

---

## 🧠 Behavior

| sel | out       |
|-----|-----------|
| 0   | a         |
| 1   | b         |
| 2   | c         |
| 3   | d         |
| 4   | e         |
| 5   | f         |
| 6   | g         |
| 7   | h         |
| 8   | i         |
| 9-15 | 16'hFFFF |

---

## 🖥️ Module Declaration

```verilog
module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output reg [15:0] out 
);
```

---

## 🧪 Implementation

```verilog
always @(*) begin
    case (sel)
        4'd0: out = a;
        4'd1: out = b;
        4'd2: out = c;
        4'd3: out = d;
        4'd4: out = e;
        4'd5: out = f;
        4'd6: out = g;
        4'd7: out = h;
        4'd8: out = i;
        default: out = 16'hFFFF;
    endcase
end
```

This uses a `case` statement for clean multiplexer logic with a catch-all default for unused select values.

---


## 🧩 Concepts Reinforced

- `case` statements in Verilog
- Multi-bit bus selection logic
- Defensive design (handling unused selector values)

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
