# 🏪 Store Inventory & Transaction Management System (PL/SQL)

## ✨ Overview

This repository contains a comprehensive **Oracle SQL and PL/SQL script** designed to establish and manage a robust retail inventory and customer transaction database. It defines the schema, populates initial data, and implements stored procedures to handle core business logic, such as product purchases, stock transfers, and sales reporting.

It serves as an excellent reference for anyone looking to implement **transactional integrity** and **business logic** within an Oracle database environment.

---

## 📚 Project Documentation

The repository includes extensive documentation detailing the database design and normalization, which are crucial for maintaining data integrity and scalability.

### Entity-Relationship Diagram (E-R) Structure

The database is built around six key entities related through one-to-many relationships:

* **Customer** has **Bank Information** (1:1/1:M depending on interpretation, assumed 1:1 for this schema).
* **Store Information** and **Product** link to **Stock** (M:M, resolved via the `STOCK` table).
* **Customer**, **Product**, and **Store Information** link to **Purchase** (M:M:M, resolved via the `PURCHASE` table).



### Third Normal Form (3NF) Validation

All tables (`CUSTOMER`, `BANK_INFORMATION`, `PRODUCT`, `STORE_INFORMATION`, `STOCK`, and `PURCHASE`) adhere to **Third Normal Form (3NF)**.

This is confirmed because:
1.  **1NF (First Normal Form):** All column values are **atomic** (single-valued), and there are no repeating groups.
2.  **2NF (Second Normal Form):** All non-key attributes are **fully dependent** on the **Primary Key (PK)**.
3.  **3NF (Third Normal Form):** The tables contain **no transitive dependencies**; no non-key attribute is dependent on another non-key attribute.

### Table Data Dictionary

The full data dictionary is available within the project documentation, detailing data types, lengths, validation rules (like `gender: M/F/O` or `payment_method: A/B/C`), and constraints (PK/FK) for all six tables.

---

## 🚀 Features

The accompanying SQL script covers essential database management functions:

* **Schema Definition:** Establishes six interconnected tables.
* **Initial Data Load:** Populates all tables with sample data.
* **Transactional Integrity (PL/SQL):**
    * `purchase_item`: Handles customer purchase, including **stock deduction** and transaction recording with validation.
    * `move_stock`: Manages internal **inventory transfer** between stores, handling both updates and new stock inserts.
* **Reporting & Analytics (PL/SQL):**
    * `display_purchases_info`: Provides a detailed sales report for a specified store and date range using a **cursor**.

---

## 🛠️ Usage

This script is intended to be executed in an **Oracle Database** environment (e.g., SQL*Plus, SQL Developer).

### Prerequisites

* An active Oracle database instance.
* A user account with necessary schema permissions.
* `SET SERVEROUTPUT ON` to view PL/SQL procedure output.

