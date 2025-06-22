```markdown
# Module pos – Instantiating a Submodule Using Positional Port Mapping

## 🧠 Overview

This exercise continues the exploration of **module instantiation** in Verilog, with a focus on **connecting ports by position**. It reinforces hierarchical design concepts and highlights how positional connections are made between top-level and submodules.

## 🔧 Functional Requirements

You are provided with a submodule named `mod_a` defined as:

```verilog
module mod_a (output, output, input, input, input, input);
```

Your task is to instantiate this module **once** in the top-level module and connect its ports **by position** to the following top-level signals, in the specified order:

1. `out1` → first output  
2. `out2` → second output  
3. `a` → first input  
4. `b` → second input  
5. `c` → third input  
6. `d` → fourth input  

This exercise demonstrates the positional method of structural modeling, where the connection order strictly follows the submodule’s port declaration.

## 📚 Key Concepts

- **Module Instantiation**:
  - A core practice in hierarchical hardware design.
  - Enables reuse of lower-level building blocks.

- **Positional Port Mapping**:
  - Connections are listed in the exact order of the submodule’s port declaration.
  - Syntax: `mod_a instance_name (out1, out2, a, b, c, d);`
  - Compact but sensitive to changes in the submodule's port list.

- **Hierarchy in Verilog**:
  - Supports design abstraction and modular development.
  - Encourages reusability and clarity in large-scale hardware systems.

## 🖼️ Diagram

Visual reference of signal-to-port connections:  
![Module Positional Diagram](https://hdlbits.01xz.net/mw/images/b/b7/Module_pos.png)

## 💡 Applications

- Building and integrating reusable logic components  
- Practicing structured design using positional mapping  
- Understanding the limitations and benefits of positional connections in real-world hardware projects  

## 🔑 Keywords

Verilog, Module Instantiation, Positional Mapping, Hierarchical Design, HDLBits, Port Ordering
```
