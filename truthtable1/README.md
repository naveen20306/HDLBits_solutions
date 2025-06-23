# 📊 truthtable1 – Canonical Sum-of-Products Logic

## 📘 Problem Statement

This exercise demonstrates how to implement a combinational logic circuit directly from a **truth table** using canonical **Sum-of-Products** form.

A combinational circuit’s output depends solely on its current inputs. This means each unique input combination maps to exactly one output value — perfectly representable using a **truth table**.

---

## 🧮 Truth Table

| Row | x3 | x2 | x1 | f |
|-----|----|----|----|---|
| 0   | 0  | 0  | 0  | 0 |
| 1   | 0  | 0  | 1  | 0 |
| 2   | 0  | 1  | 0  | 1 |
| 3   | 0  | 1  | 1  | 1 |
| 4   | 1  | 0  | 0  | 0 |
| 5   | 1  | 0  | 1  | 1 |
| 6   | 1  | 1  | 0  | 0 |
| 7   | 1  | 1  | 1  | 1 |

Output `f = 1` for rows: **2, 3, 5, 7**  
This leads to the following **Sum-of-Products** expression:

---

## 🧠 Concepts Used

- **Sum-of-Products** form logic synthesis  
- Boolean function realization from truth tables  
- Basic gates: AND, OR, NOT  

---

## 📤 HDLBits Page

🔗 [HDLBits – truthtable1](https://hdlbits.01xz.net/wiki/Truthtable1)

---
