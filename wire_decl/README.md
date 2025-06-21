# HDLBits: Wire Declaration Practice

This README covers the **"Wire Declaration"** exercise on [HDLBits](https://hdlbits.01xz.net/), where you learn how to declare and use internal wires in Verilog.

---

## 🧠 Introduction

As circuits grow more complex, intermediate signals are often required to connect logic gates. These **intermediate connections must be declared** using `wire` in Verilog.

In earlier problems, the circuits were simple — outputs were directly assigned from inputs. Now, we introduce **internal wires** for signals that are not inputs or outputs of the module.

---

## 📘 Basic Example

In the circuit below, a wire named `not_in` is declared to connect two NOT gates:

![Basic Wire Declaration](https://hdlbits.01xz.net/mw/images/6/6a/Wiredecl1.png)

### Example Code:

```verilog
module top_module (
    input in,
    output out
);
    wire not_in;

    assign out = ~not_in;
    assign not_in = ~in;
endmodule
