# 🔔 mt2015_q4 – Ringer Control Logic

## 📘 Problem Statement

Taken from **2015 midterm – Question 4 (Ringer control)**.

You are designing a **hardware circuit** to control a cellphone's **ringer and vibration motor**. When the phone receives an incoming call, either the **ringer** or the **vibration motor** should activate, **but not both**.

![Ringer Circuit Diagram](https://hdlbits.01xz.net/mw/images/9/96/Ringer.png)

---

## 🧾 Functional Requirements

- If `ring = 0`: Both `ringer` and `motor` are 0  
- If `ring = 1` and `vibrate_mode = 0`: Activate **ringer**, not motor  
- If `ring = 1` and `vibrate_mode = 1`: Activate **motor**, not ringer  

---

## 📥 Inputs
- `ring`: Incoming call signal  
- `vibrate_mode`: 1 if phone is in vibrate mode

## 📤 Outputs
- `ringer`: 1 if phone rings  
- `motor`: 1 if vibration motor is activated  

---

## 💡 Logic Implementation

We'll use only **assign statements**:

```verilog
assign ringer = ring & ~vibrate_mode;
assign motor  = ring &  vibrate_mode;
```

Only one of `ringer` or `motor` can be high at a time, depending on the `vibrate_mode`.

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input ring,
    input vibrate_mode,
    output ringer,
    output motor
);
```

---

## 🔗 HDLBits Problem Link

[HDLBits – Ringer](https://hdlbits.01xz.net/wiki/Mt2015_q4)

---


## 🎯 Concepts Reinforced

- Translating imperative descriptions to logic circuits  
- Conditional hardware output using combinational logic  
- Use of `assign` statements only  

---

## 👨‍💻 Author

**Naveen Kumar B**
