# Module – Instantiating a Submodule

## Overview

This exercise introduces the concept of **module instantiation** in Verilog. Modules are the fundamental building blocks of hardware designs, and more complex systems are built by composing multiple modules in a **hierarchical structure**.

## Functional Requirements

- You are provided with a submodule called `mod_a`, which has three ports:
  - `in1` (input)
  - `in2` (input)
  - `out` (output)

- Your task is to instantiate this module **once** in the top-level module and connect:
  - Top-level wire `a` → `in1`
  - Top-level wire `b` → `in2`
  - Top-level wire `out` → `out`

This exercise demonstrates **basic structural modeling** by instantiating and wiring modules together.

## Key Concepts

- **Module Instantiation**:
  - Modules can be reused by creating instances of them in other modules.
  - This promotes modular design and hierarchical abstraction.

- **Connecting Ports**:
  - **By Position**: Arguments are listed in the order of the module's port declaration.
    - Example: `mod_a u1 (a, b, out);`
  - **By Name**: Arguments are explicitly mapped to port names.
    - Example: `mod_a u2 (.in1(a), .in2(b), .out(out));`
  - Named connections are more robust to changes in port ordering.

- **Hierarchy in Verilog**:
  - Modules can be instantiated inside other modules to form a design hierarchy.
  - Source code of submodules must be accessible and part of the same compilation unit.

## Diagram

Visual reference of the module connection:  
![Module Hierarchy Diagram](https://hdlbits.01xz.net/mw/images/c/c0/Module.png)  
Submodule definition:  
![mod_a Definition](https://hdlbits.01xz.net/mw/images/0/08/Module_moda.png)

## Applications

- Reusable design blocks (e.g., ALUs, multiplexers, memory cells)
- Scalable and maintainable design structures
- Hierarchical design practices used in industry and FPGA/ASIC workflows

## Keywords

Verilog, Module Instantiation, Hierarchy, Port Mapping, HDLBits, Structured Design
