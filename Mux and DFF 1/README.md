# 🧱 Hierarchical Flip-Flop + Mux Module – Mt2015_muxdff

## 📘 Problem Statement

Taken from **ECE253 Midterm 2015 – Question 5**.

You are to implement a reusable **Verilog submodule** that combines a **D flip-flop** and a **2-to-1 multiplexer**, which will later be used to construct a larger sequential circuit.

🖼️ [View Circuit Diagram](https://hdlbits.01xz.net/mw/thumb.php?f=Mt2015_muxdff.png&width=1200)

---

## ✅ Inputs and Output

- **Inputs**:
  - `clk`: Clock signal (positive edge triggered)
  - `L`: Select line for multiplexer
  - `r_in`: MUX input when `L` is high
  - `q_in`: MUX input when `L` is low

- **Output**:
  - `Q`: Flip-flop output

---

## 🧠 Behavior

- The circuit uses a **2-to-1 multiplexer** to choose between `r_in` and `q_in` based on the select input `L`.
- The output of the multiplexer is connected to the **D input** of the flip-flop.
- The flip-flop captures the value of the selected input on the **rising edge of the clock**.

### MUX Logic:
```verilog
D = (L == 1) ? r_in : q_in;
```

### Flip-Flop Logic:
```verilog
always @(posedge clk)
    Q <= D;
```

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input clk,
    input L,
    input r_in,
    input q_in,
    output reg Q
);
```

---

## 🧩 Concepts Reinforced

- Hierarchical design in Verilog
- Flip-flop with dynamic input selection
- Behavioral modeling using `always @(posedge clk)`

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
