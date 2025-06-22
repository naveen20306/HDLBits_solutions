```markdown
# Module cseladd – 32-bit Carry-Select Adder Using Three add16 Modules

## 🧠 Overview

This exercise introduces an optimized form of multi-bit addition using the **Carry-Select Adder (CSA)** architecture. Unlike a ripple-carry adder, which waits for the first stage to produce a carry before proceeding, a CSA improves speed by **precomputing both possible outcomes of the second stage** in parallel, then selecting the correct result using a multiplexer.

## 🔧 Functional Requirements

### ✅ Provided Module

```verilog
module add16 (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output [15:0] sum,
    output        cout
);
```

### ✅ Your Task

Build a **32-bit adder** using **three instances** of `add16`, arranged as follows:

- `add16_l`: Computes **lower 16 bits** using `cin = 0`
- `add16_h0`: Computes **upper 16 bits**, assuming `cin = 0`
- `add16_h1`: Computes **upper 16 bits**, assuming `cin = 1`

Use the `cout` from `add16_l` to **select the correct result** from either `add16_h0` or `add16_h1` using a **16-bit 2-to-1 multiplexer**, which **you must implement**.

### Signal Flow Summary

| Module     | A Inputs       | B Inputs       | CIN | Output       | Purpose               |
|------------|----------------|----------------|-----|---------------|------------------------|
| `add16_l`  | a[15:0]         | b[15:0]         | 0   | sum[15:0], c0 | First 16-bit stage     |
| `add16_h0` | a[31:16]        | b[31:16]        | 0   | sum0[15:0]    | Upper stage (cin=0)    |
| `add16_h1` | a[31:16]        | b[31:16]        | 1   | sum1[15:0]    | Upper stage (cin=1)    |
| MUX        | sum0 vs. sum1   | sel = c0        | —   | sum[31:16]    | Select correct upper sum |

---

## 🧰 Internal Wire Declarations

```verilog
wire [15:0] sum_l, sum_h0, sum_h1;
wire carry_l;
```

---

## 🛠️ Multiplexer Module (2-to-1, 16-bit)

You must implement your own 16-bit wide 2-to-1 multiplexer. For example:

```verilog
module mux2to1_16 (
    input  [15:0] in0,
    input  [15:0] in1,
    input         sel,
    output [15:0] out
);
    assign out = sel ? in1 : in0;
endmodule
```

---

## 📚 Key Concepts

- **Carry-Select Optimization**:
  - Reduces delay by computing both carry paths in parallel.

- **Modular Instantiation**:
  - Reuses smaller building blocks (`add16`) to construct larger systems.

- **Custom Multiplexer Design**:
  - Demonstrates how to implement and integrate combinational modules.

- **Performance-Aware Design**:
  - Highlights trade-offs in speed vs. resource usage in digital design.

---

## 🖼️ Diagram

Reference diagram showing carry-select architecture:  
![Module cseladd Diagram](https://hdlbits.01xz.net/mw/images/3/3e/Module_cseladd.png)

---

## 💡 Applications

- High-speed arithmetic logic units (ALUs)  
- Optimized adders in processor datapaths  
- Pipelined and parallel processing systems

---

## 🔑 Keywords

Verilog, Carry-Select Adder, add16, Multiplexer, Parallel Computation, Performance Optimization, HDLBits, Module Instantiation
```
