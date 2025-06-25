# 🌡️ Thermostat Control Circuit

## 📘 Problem Statement

Design a combinational logic circuit that simulates a **thermostat system** controlling a **heater**, **air conditioner**, and **blower fan**. The circuit operates in two modes: **heating** (`mode = 1`) and **cooling** (`mode = 0`).

---

## 🔧 Functional Requirements

- **Heating mode (`mode = 1`)**  
  - If `too_cold = 1`, turn **heater** on  
  - **Do not** turn on **AC**  
  - If **heater** is on → **fan** must be on

- **Cooling mode (`mode = 0`)**  
  - If `too_hot = 1`, turn **AC** on  
  - **Do not** turn on **heater**  
  - If **AC** is on → **fan** must be on

- The **user** can force the **fan** on with `fan_on = 1`, regardless of heater/AC

---

## 📥 Inputs

- `mode` : 1 = Heating mode, 0 = Cooling mode  
- `too_cold` : Too cold signal  
- `too_hot` : Too hot signal  
- `fan_on` : Manual override for fan

## 📤 Outputs

- `heater` : 1 to activate heating  
- `ac` : 1 to activate cooling  
- `fan` : 1 to activate the blower fan

---

## 🔧 Logic Design

```verilog
assign heater = mode & too_cold;
assign ac     = ~mode & too_hot;
assign fan    = heater | ac | fan_on;
```

---

## 🖥️ Module Declaration

```verilog
module top_module (
    input mode,
    input too_cold,
    input too_hot,
    input fan_on,
    output heater,
    output ac,
    output fan
);
```
---

## 🎯 Concepts Reinforced

- Translating functional requirements into **combinational logic**
- Controlled fan logic with multiple activation conditions
- Exclusive use of `assign` statements

---

## 👨‍💻 Maintained By

**Naveen Kumar B**
