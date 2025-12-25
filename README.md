# 🍽️ Restaurant Order Analysis (SQL Server / T-SQL)

✅ **Tool:** SQL Server (SSMS)  
✅ **Language:** T-SQL  
✅ **Focus:** Menu performance + Customer behavior

![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-blue)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Focus](https://img.shields.io/badge/Focus-Customer%20Behavior%20%26%20Menu%20Performance-orange)

---

## 🌍 Business Context

**Taste of the World Cafe** launched a **new menu** at the start of the year.  
As a data analyst, the goal is to use restaurant order data to understand:

- 🍔 Which menu items are doing well vs not doing well  
- 💰 What high-spending orders tend to buy  
- 🍝 Which categories matter for revenue and customer preference  

---

## 🎯 Project Objectives

### 🟦 Objective 1 — Explore `menu_items`
- View the table and count menu items  
- Find least & most expensive items  
- Focus on Italian dishes (count + least/most expensive Italian items)  
- Count dishes per category  
- Average price per category  

### 🟩 Objective 2 — Explore `order_details`
- View the table  
- Find date range (MIN/MAX dates)  
- Count total orders (distinct `order_id`)  
- Count total items ordered (rows)  
- Find orders with most items  
- Count orders with **more than 12 items** (GROUP BY + HAVING + subquery)  

### 🟧 Objective 3 — Analyze Customer Behavior (JOIN)
- Join `order_details` + `menu_items`  
- Find most/least ordered items + their categories  
- Find top 5 highest-spend orders  
- Analyze category breakdown for the highest-spend order  
- Analyze category breakdown for top 5 highest-spend orders  

---

## 🗂️ Repo Structure

Restaurant-Order-Analysis-SQL/
│
├── README.md
│
├── sql/
│   ├── 01_menu_exploration.sql
│   ├── 02_order_exploration.sql
│   └── 03_customer_behavior.sql
│
├── data/
│   ├── raw/
│   │   ├── menu_items.csv
│   │   └── order_details.csv
│   └── processed/
│       └── joined_orders_menu.csv
│
├── docs/
│   ├── project_brief.md
│   ├── data_dictionary.md
│   └── interview_notes.md
│
└── insights/
    ├── menu_insights.md
    ├── order_insights.md
    └── customer_behavior_insights.md

✅ If you only want the core solution, focus on the `sql/` folder.

---

## 📦 Dataset Information

This dataset contains **two tables**.

### 1) `menu_items` (Lookup table)
**Description:** One row per menu item (dish details).

**Columns (typical):**
- `menu_item_id` → unique id for each menu item  
- `item_name` → dish name  
- `category` → cuisine/category (American, Asian, Italian, etc.)  
- `price` → dish price  

### 2) `order_details` (Transaction table)
**Description:** One row per item ordered (line-item level).

**Columns (typical):**
- `order_details_id` → unique id per row  
- `order_id` → order identifier (repeats because orders contain multiple items)  
- `order_date` → date of order  
- `order_time` → time of order  
- `item_id` → references `menu_items.menu_item_id`  

---

## 🔗 How the Tables Connect (Relationship)

Join key:
- `order_details.item_id` = `menu_items.menu_item_id`

Relationship type:
- One menu item can appear in many order rows (1-to-many)

Join used in analysis:
- **LEFT JOIN** to keep all transaction rows from `order_details`

---

## 🛠️ Tools & SQL Skills

### 🧰 Tools
- SQL Server Management Studio (SSMS)
- SQL Server (T-SQL)

### 🧪 SQL Skills Used
- Filtering: `WHERE`
- Sorting: `ORDER BY`
- Aggregations: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- Grouping: `GROUP BY`
- Filtering groups: `HAVING`
- Joins: `LEFT JOIN`
- Subqueries
- Top-N analysis: `TOP`

---

## ▶️ How to Run

1) Load/import these tables into SQL Server:
- `menu_items`
- `order_details`

2) Run scripts in this order:
- `sql/01_menu_exploration.sql`
- `sql/02_order_exploration.sql`
- `sql/03_customer_behavior.sql`

---

## 🧠 Core Logic Notes (Quick Cheatsheet)

- ✅ Total orders:
  - `COUNT(DISTINCT order_id)`  
- ✅ Total items ordered:
  - `COUNT(*)` on `order_details`  
- ✅ Filter after aggregation:
  - use `HAVING` (not `WHERE`)  
- ✅ Top spending orders:
  - group by `order_id` and `SUM(price)`  

---

## 📈 Insights Template (Fill with your final numbers)

You can summarize results like this:
- ⭐ Best-selling items: (list top items)
- ⚠️ Low-performing items: (list bottom items)
- 💰 High-spend orders: tend to buy (categories/items)
- 🧠 Recommendation:
  - keep & promote winners
  - improve/reprice weak items
  - protect premium items for high-value customers

(You can write your final conclusions in `insights/`.)

---

## 🎤 Interview Questions This Project Prepares You For

- Why does `order_id` repeat in `order_details`?
- Difference between `WHERE` and `HAVING`?
- Why use `COUNT(DISTINCT order_id)` for order count?
- Why use a LEFT JOIN for transaction + lookup tables?
- How do you find top spenders / high-value orders?

(See `docs/interview_notes.md`.)

---

## ✅ Notes

- This repo is written for **SQL Server (SSMS / T-SQL)**.
- If you use a different database, small syntax changes may be needed (e.g., `TOP` vs `LIMIT`).
