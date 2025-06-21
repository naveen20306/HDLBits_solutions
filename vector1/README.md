# HDLBits - Vector1

## 🔍 Problem Statement

Vectors are used to group related signals using one name to make it more convenient to manipulate.

For example:  
`wire [7:0] w;` declares an "8-bit vector" named `w` that is equivalent to having 8 separate wires.

### "Declaring Vectors"

Vectors must be declared in the form:

`type [upper:lower] vector_name;`

- The `type` is typically "wire" or "reg"
- If the vector is a port, the type can be a combination like `input wire`, `output reg`, etc.

Examples:
- `wire [7:0] w;` → "8-bit wire"
- `reg  [4:1] x;` → "4-bit reg"
- `output reg [0:0] y;` → "1-bit reg output (still a vector)"
- `input wire [3:-2] z;` → "6-bit wire input" (negative indices allowed)
- `output [3:0] a;` → "4-bit output wire" (default type is wire)
- `wire [0:7] b;` → "8-bit wire with b[0] as the most significant bit"

### "Endianness"

- A vector's direction defines whether it's "little-endian" (`[3:0]`) or "big-endian" (`[0:3]`)
- Once a vector is declared with a direction, it must be used consistently
- Mixing directions causes errors or subtle bugs

### "Implicit Nets"

Verilog allows undeclared wires (called "implicit nets") to be created silently:

```verilog
wire [2:0] a, c;
assign a = 3'b101;
assign b = a; // 'b' is implicitly created as a 1-bit wire!
assign c = b; // Bug: mismatch in width
