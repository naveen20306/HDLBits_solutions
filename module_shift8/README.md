```markdown
# Module shift8 – 8-bit 3-stage Shift Register with Multiplexer Output

## 🧠 Overview

This exercise extends the principles of `module_shift` by introducing **vector ports** and integrating a **multiplexer**. You will construct an 8-bit wide, 3-stage shift register using the provided `my_dff8` module, then select one of the four data stages (including the original input) using a 4-to-1 multiplexer.

## 🔧 Functional Requirements

You are provided with a D flip-flop module that handles **8-bit vectors**:

```verilog
module my_dff8 (
    input clk,
    input [7:0] d,
    output [7:0] q
);
```

### Your Task:

- Instantiate **three instances** of `my_dff8`.
- Chain them together to form a **3-stage shift register**, each stage 8 bits wide.
- Connect the same `clk` input to all three flip-flops.
- Use internal wires (`w1`, `w2`) to link outputs to inputs across stages.
- Implement a **4-to-1 multiplexer** using an `always @(*)` block to select one of the following outputs based on `sel[1:0]`:
  - `2'b00`: original input `d`
  - `2'b01`: after 1st flip-flop
  - `2'b10`: after 2nd flip-flop
  - `2'b11`: after 3rd flip-flop

### Signal Flow Summary:

| Stage         | Input Source | Output Wire |
|---------------|--------------|-------------|
| DFF #1        | `d`          | `w1`        |
| DFF #2        | `w1`         | `w2`        |
| DFF #3        | `w2`         | `w3`        |
| Final Output  | Based on `sel` from: `d`, `w1`, `w2`, `w3` |

### Wire Declarations:

```verilog
wire [7:0] w1, w2, w3;
```

### Multiplexer Template:

```verilog
reg [7:0] q;
always @(*) begin
    case (sel)
        2'b00: q = d;
        2'b01: q = w1;
        2'b10: q = w2;
        2'b11: q = w3;
    endcase
end
```

## 📚 Key Concepts

- **Vector Ports**:
  - Flip-flop modules handle full 8-bit values.

- **Hierarchical Module Instantiation**:
  - Three instances of `my_dff8` chained in series.

- **4-to-1 Multiplexer Design**:
  - Output value depends on how many clock cycles the input has passed through.

- **Sequential and Combinational Integration**:
  - Combines clocked flip-flop logic with case-based output selection.

## 🖼️ Diagram

Visual reference of the shift register and multiplexer:  
![Module Shift8 Diagram](https://hdlbits.01xz.net/mw/images/7/76/Module_shift8.png)

## 💡 Applications

- Programmable input delay in data pipelines  
- Timing adjustment and synchronization systems  
- Serial-to-parallel conversion with controlled delay

## 🔑 Keywords

Verilog, Shift Register, Vector Ports, Multiplexer, my_dff8, Module Instantiation, HDLBits, Sequential Logic
```
