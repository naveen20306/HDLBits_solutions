# 🔁 One Stage of n-bit Shift Register – Exams/2014_q4a

## 📘 Problem Statement

Implement a **single stage** of an n-bit shift register as shown in the diagram:

🖼️ [View Circuit Diagram](https://hdlbits.01xz.net/mw/thumb.php?f=Exams_2014q4.png&width=1350)

You are to write the Verilog module named `top_module` that encapsulates:
- A D flip-flop
- Two 2-to-1 multiplexers (hierarchically combining 4 inputs under control of 2 select signals)

---

## ✅ Inputs and Output

- **Inputs**:
  - `clk`: Clock signal (positive edge triggered)
  - `w`: Serial input
  - `R`: Parallel input (Load data)
  - `E`: Enable shift
  - `L`: Load enable (Parallel vs Shift control)

- **Output**:
  - `Q`: Output from the flip-flop

---

## 🧠 Behavior

This is a **universal shift register stage** with the following logic:

### Step-by-step logic:

1. **MUX 1** decides between `Q` (hold) and `w` (shift in):
   ```verilog
   mux1_out = (E == 1'b1) ? w : Q;
   ```

2. **MUX 2** decides between `mux1_out` and `R` (load value):
   ```verilog
   mux2_out = (L == 1'b1) ? R : mux1_out;
   ```

3. The final value `mux2_out` is fed into the **D flip-flop**:
   ```verilog
   always @(posedge clk)
       Q <= mux2_out;
   ```

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
```

---

## 🧩 Concepts Reinforced

- Shift register behavior
- Multi-level multiplexer control
- Designing a single stage for scalable architectures
- Use of `always @(posedge clk)` for sequential logic

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
