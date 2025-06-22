```markdown
# Module name – Instantiating a Submodule Using Named Port Mapping

## 🧠 Overview

This exercise builds upon the concept of **module instantiation** in Verilog, specifically focusing on **named port mapping**. Unlike positional mapping, this method uses the **names of the ports** in the submodule to wire them to the corresponding signals in the top-level module, which is safer and more readable.

## 🔧 Functional Requirements

You are provided with a submodule named `mod_a` defined as:

```verilog
module mod_a (
    output out1, 
    output out2, 
    input in1, 
    input in2, 
    input in3, 
    input in4
);
```

Your task is to instantiate this module **once** inside a top-level module using **named port connections**. You must connect the following ports correctly:

| Port in `mod_a` | Connect to (Top Module Port) |
|------------------|------------------------------|
| `out1`           | `out1`                       |
| `out2`           | `out2`                       |
| `in1`            | `a`                          |
| `in2`            | `b`                          |
| `in3`            | `c`                          |
| `in4`            | `d`                          |

## 📚 Key Concepts

- **Module Instantiation**:
  - Enables design reuse by incorporating existing modules within a new design context.
  - Promotes structured and hierarchical modeling.

- **Named Port Mapping**:
  - Uses explicit port names during instantiation for clarity.
  - Format:  
    ```verilog
    mod_a instance_name (
        .out1(out1),
        .out2(out2),
        .in1(a),
        .in2(b),
        .in3(c),
        .in4(d)
    );
    ```
  - Safer than positional mapping, especially when dealing with larger modules.

- **Design Maintainability**:
  - Named connections make the design easier to read and less error-prone.
  - Order of ports in the submodule declaration becomes irrelevant during instantiation.

## 🖼️ Diagram

Visual reference of port-to-signal mapping:  
![Module Named Mapping Diagram](https://hdlbits.01xz.net/mw/images/d/dd/Module_name.png)

## 💡 Applications

- Practicing module instantiation using named connections
- Reinforcing hierarchical design concepts in Verilog
- Writing clean and maintainable hardware description code

## 🔑 Keywords

Verilog, Module Instantiation, Named Mapping, HDLBits, Hierarchical Design, Signal Routing
```
