```markdown
# Always NoLatches – Scancode Decoder with No Latch Inference

## 🧠 Overview

This exercise demonstrates a safe and efficient way to build **combinational logic** using `always @(*)` blocks **without inferring latches**. You are tasked with decoding specific **keyboard scancodes** and asserting the corresponding direction signal when an arrow key is pressed. The design must ensure that **all outputs are defined** under **all conditions**, which is essential to prevent unintentional latch synthesis.

---

## 🔧 Functional Requirements

- Input:
  - `scancode`: 16-bit input representing the last two PS/2 bytes received

- Outputs:
  - `left`, `right`, `up`, `down`: 1-bit signals (only one active at a time)

- Behavior:
  - If `scancode == 16'he06b` → `left = 1`
  - If `scancode == 16'he074` → `right = 1`
  - If `scancode == 16'he075` → `up = 1`
  - If `scancode == 16'he072` → `down = 1`
  - For all other scancodes → all outputs should be 0

---

### 📥 Port Definition

```verilog
input      [15:0] scancode;
output reg        left, right, up, down;
```

---

### ✅ Implementation Example

```verilog
always @(*) begin
    // Default assignments to avoid latch inference
    left = 0; right = 0; up = 0; down = 0;

    case (scancode)
        16'he06b: left  = 1;
        16'he074: right = 1;
        16'he075: up    = 1;
        16'he072: down  = 1;
    endcase
end
```

> ✅ Defaulting all outputs **before** the `case` ensures that **every output is always defined**, eliminating the possibility of latch inference.

---

## 📚 Key Concepts

- **Latch Inference**:
  - Occurs when outputs are **not defined** in every possible execution path of an `always @(*)` block.
  - Unintentional latches can introduce bugs, unpredictable delays, and hardware synthesis issues.

- **Safe Combinational Coding Style**:
  - Pre-assign default values to all outputs **before** the `case` or `if-else` logic.
  - Avoids the need for verbose default branches in `case` statements.

- **Keyboard Scancode Decoding**:
  - Scancodes are standard identifiers for key presses.
  - Useful for handling input in embedded systems, games, and custom hardware keyboards.

---

## 💡 Applications

- Keyboard input handlers for games or OS shells  
- Command decoders in embedded systems  
- Control signal generation from protocol inputs  
- FSM input pattern recognition

---

## 🔑 Keywords

Verilog, No Latch Inference, Case Statement, Combinational Logic, PS/2 Scancode, Keyboard Decoder, HDLBits, Default Assignment, Hardware Synthesis Safety
```
