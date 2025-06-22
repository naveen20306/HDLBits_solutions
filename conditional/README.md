# 🧠 Always NoLatches – 4-Way Minimum Finder Using Conditional Operator

## 🔍 Overview

This problem focuses on writing **clean combinational logic** using the **Verilog ternary operator** `(? :)` — an efficient alternative to `if-else` inside `always @(*)` blocks. You will build a 4-input minimum value selector by composing **2-input comparators**, all written using the conditional operator only.

The exercise enforces a good **coding practice for combinational circuits**: avoiding latches and ensuring that all outputs are defined via simple conditional logic.

---

## 📐 Functional Requirements

- **Inputs:**  
  - `a`, `b`, `c`, `d`: 4-bit unsigned input numbers  
- **Output:**  
  - `min`: 4-bit output representing the **minimum** of the four inputs  

- **Behavior:**  
  - Use the conditional operator to perform pairwise comparisons:  
    - First compare `a` vs `b`, and `c` vs `d`  
    - Then compare the two results to find the overall minimum

---

## 📥 Port Definition

```verilog
input  [3:0] a, b, c, d;
output [3:0] min;
```

---

## ✅ Implementation Example

```verilog
module top_module (
    input  [3:0] a, b, c, d,
    output [3:0] min
);

    wire [3:0] min1, min2;

    assign min1 = (a < b) ? a : b;
    assign min2 = (c < d) ? c : d;
    assign min  = (min1 < min2) ? min1 : min2;

endmodule
```

> ✅ This clean and latch-free design leverages the **ternary operator** to compare inputs and build the 4-way min logic using **pure combinational expressions**.

---

## 📚 Key Concepts

- **Conditional (Ternary) Operator:**
  - Syntax: `(condition ? if_true : if_false)`
  - Commonly used to express compact logic in one line
  - Equivalent to a **2:1 multiplexer**

- **Latch-Free Design:**
  - Using `assign` and ternary operators ensures outputs are always defined
  - Avoids unintentional latch synthesis

- **Composability:**
  - Breaking complex comparisons into smaller steps enhances readability and reuse

---

## 💡 Applications

- Priority resolution logic  
- Minimum/maximum value detectors  
- Arithmetic preprocessing units  
- Digital signal processing pipelines  

---

## 🖼️ Problem Screenshot

*(Insert screenshot image here using Markdown syntax)*  
Example:
```markdown
![Problem Screenshot](./path_to_image.png)
```

---

## 🔑 Keywords

Verilog, Conditional Operator, Ternary Logic, Combinational Circuit, Latch-Free Design, HDLBits, Min Finder, Digital Design
