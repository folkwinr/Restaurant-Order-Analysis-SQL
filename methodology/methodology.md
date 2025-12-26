## 🧪 Methodology (SQL Server / T-SQL)

### 🧩 1) Understand the Data (Tables & Grain)
- Reviewed both tables to confirm what each row represents.
- **`menu_items`** = one row per menu item (name, category, price).
- **`order_details`** = **line-item level** (one row per item ordered), so `order_id` repeats.

---

### 🔎 2) Objective 1 — Menu Exploration (`menu_items`)
**Goal:** Understand the new menu structure and pricing.
- Counted total menu items.
- Identified **least/most expensive** items (tie-safe with `MIN()`/`MAX()`).
- Filtered Italian dishes and repeated price analysis.
- Grouped by category to get:
  - number of dishes per category
  - average price per category

---

### 📅 3) Objective 2 — Order Exploration (`order_details`)
**Goal:** Understand ordering activity and basket sizes.
- Found the **date range** using `MIN(order_date)` and `MAX(order_date)`.
- Calculated:
  - **total orders** = `COUNT(DISTINCT order_id)`
  - **total items ordered** = `COUNT(*)` (because each row = one item)
- Identified orders with the most items using `GROUP BY order_id`.
- Counted how many orders had **more than 12 items** using:
  - `HAVING COUNT(*) > 12`
  - a subquery to count those orders

---

### 🔗 4) Objective 3 — Customer Behavior (JOIN Analysis)
**Goal:** Connect orders to menu details and analyze customer preferences.
- Combined tables with a **LEFT JOIN**:
  - `order_details.item_id = menu_items.menu_item_id`
- Ranked items by popularity:
  - most ordered vs least ordered items
  - included categories to see where they belong
- Identified **top 5 highest-spend orders**:
  - grouped by `order_id`
  - summed `price` to compute total spend
- Explored **category breakdowns** for:
  - the highest-spend order
  - the top 5 highest-spend orders

---

### ✅ Key SQL Concepts Used
- `GROUP BY` + aggregates: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `HAVING` for filtering aggregated results
- Subqueries for “counting the result of a grouped query”
- `LEFT JOIN` to keep all transaction rows
- `TOP` to extract top-N results (T-SQL)

---