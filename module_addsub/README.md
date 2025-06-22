```markdown
# Module addsub – 32-bit Adder-Subtractor Using Conditional Inversion

## 🧠 Overview

This exercise focuses on implementing an **adder-subtractor** using two 16-bit adders and a control signal to toggle between addition and subtraction. The subtraction is performed using **two's complement logic**, by **bitwise inverting `b`** and **adding 1** through the carry-in. This demonstrates how a single adder circuit can perform both addition and subtraction based on a control input.

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

You need to build a 32-bit adder-subtractor that:
- Adds when `sub = 0`  
- Subtracts when `sub = 1`  

### Implementation Strategy:

1. Use **two `add16` modules** to handle:
   - Lower 16 bits (`a[15:0] + b[15:0]`)
   - Upper 16 bits (`a[31:16] + b[31:16]`)

2. Use a **32-bit wide XOR gate** to conditionally invert `b`:
   ```verilog
   wire [31:0] b_xor = b ^ {32{sub}};
   ```

3. Set **carry-in = sub**, so:
   - When `sub = 0`: regular addition (`a + b + 0`)
   - When `sub = 1`: subtraction (`a + ~b + 1`)

4. Chain the two adders:
   - First adder uses `cin = sub`
   - Second adder uses carry-out from the first

---

## 🧰 Internal Signal Plan

```verilog
wire [15:0] sum_low, sum_high;
wire carry_out;
wire [31:0] b_xor;
assign b_xor = b ^ {32{sub}};
```

---

## 🧮 Output Assignment

```verilog
assign sum = {sum_high, sum_low};
```

---

## 📚 Key Concepts

- **Two’s Complement Subtraction**:
  - `a - b` = `a + (~b + 1)` = `a + (b ^ 1) + 1`

- **XOR for Conditional Inversion**:
  - `b ^ 0` = `b` → used for addition  
  - `b ^ 1` = `~b` → used for subtraction

- **Replication Operator**:
  - `{32{sub}}` creates a 32-bit vector with all bits set to `sub`

- **Hierarchical Design**:
  - Modular approach using two `add16` units for full 32-bit functionality

---

## 🖼️ Diagram

Visual overview of the adder-subtractor structure:  
![Module AddSub Diagram](https://hdlbits.01xz.net/mw/images/a/ae/Module_addsub.png)

---

## 💡 Applications

- ALU design supporting both addition and subtraction  
- Instruction-level logic for processors  
- Digital signal processing with variable arithmetic modes

---

## 🔑 Keywords

Verilog, Adder-Subtractor, Two’s Complement, XOR Inversion, Conditional Logic, add16, HDLBits, Carry-In Control, Bitwise Operations
```
