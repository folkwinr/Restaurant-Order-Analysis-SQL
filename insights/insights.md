# 🍽️ Restaurant Order Analysis (SQL / MySQL)

## 🟦 1) Project Snapshot
This project analyzes **Taste of the World Cafe** using two MySQL tables:

- 🍽️ **menu_items** → item metadata (item name, category, price)
- 🧾 **order_details** → transaction lines (order_id, item_id, order_date, order_time)

**Objective:** explore the new menu, explore order activity, then join both tables to understand:
- ✅ which items perform well vs. not well
- ✅ what high-spend orders tend to prefer

---

## 🟩 2) SQL Approach (What was done)
### 🔍 A) Menu Exploration (`menu_items`)
Used SQL to:
- view the full menu table (`SELECT *`)
- count total menu items (`COUNT(*)`)
- find cheapest and most expensive items (`ORDER BY price ASC/DESC`)
- drill into Italian dishes (`WHERE category = 'Italian'`)
- count dishes per category (`GROUP BY category` + `COUNT(...)`)
- compute average price per category (`GROUP BY category` + `AVG(price)`)

### 📆 B) Order Exploration (`order_details`)
Used SQL to:
- view the order details structure (`SELECT *`)
- identify the date range (`MIN(order_date)`, `MAX(order_date)`)
- count total unique orders (`COUNT(DISTINCT order_id)`)
- count total items ordered (row count, `COUNT(*)`)
- compute items per order (`GROUP BY order_id` + `COUNT(item_id) AS num_items`)
- find orders with the most items (`ORDER BY num_items DESC`)
- count orders with more than 12 items (`HAVING num_items > 12` + subquery + `COUNT(*)`)

### 🔗 C) Customer Behavior (JOIN)
Joined transactions with menu metadata using:
- `LEFT JOIN` on `order_details.item_id = menu_items.menu_item_id`
- aliases for readability (e.g., `OD`, `MI`)

Then analyzed:
- least/most ordered items (`GROUP BY item_name` + `COUNT(...)` + `ORDER BY`)
- categories of those items (`GROUP BY item_name, category`)
- top 5 highest-spend orders (`GROUP BY order_id` + `SUM(price)` + `ORDER BY` + `LIMIT 5`)
- details of the highest-spend order (filter by `order_id = 440`)
- category breakdown for the top 5 spend orders (`WHERE order_id IN (...)` + `GROUP BY`)

---

## 🟨 3) Key Findings & “So What?” Insights (Based only on query outputs)

### 🍽️ Menu Reality Check (32 items, clear pricing ladder)
- 📌 Total menu items: **32**
- 🟢 Cheapest item: **Edamame — $5**
- 🔴 Most expensive item: **Shrimp Scampi — $19.95**
- 🍝 Italian dishes on the menu: **9**
- 💡 Category pricing pattern (from `AVG(price)`):
  - **Italian has the highest average price**
  - **American has the lowest average price**

✨ **Insight:** The menu is naturally segmented:
- 🍝 **Italian = premium positioning**
- 🇺🇸 **American = value/comfort anchor**
This creates a strong foundation for menu design and upsell paths (value → premium).

---

### 🧾 Orders at a Glance (3-month window, strong multi-item behavior)
- 📅 Date range: **Jan 1, 2023 → Mar 31, 2023**
- 🧾 Total unique orders: **5,370**
- 🍽️ Total items ordered (order lines): **12,000**

✨ **Insight:** The order table is line-based (multiple items per order), so:
- `COUNT(DISTINCT order_id)` is the correct “order count”
- `COUNT(*)` is the correct “total items ordered”

---

### 📦 Basket Extremes (large baskets exist and matter)
- 📦 Highest item-count orders reached **14 items** in a single order
- 🧨 Orders with **more than 12 items**: **20**  
  (calculated via `GROUP BY` → `HAVING` → subquery → `COUNT(*)`)

✨ **Insight:** Very large orders are rare but meaningful. This pattern often signals group / bulk ordering behavior.
✅ **Recommendation:** treat 12+ item orders as a special operational flow (packing consistency, speed, coordination).

---

### 🏆 Winners vs. 🚨 Underperformers (Product-level)
- 🥇 Most ordered item: **Hamburger**
- 🚨 Least ordered item: **Chicken Tacos**

✨ **Insight:** The menu shows clear “keep & amplify” vs “fix or reconsider” signals.
✅ **Recommendation:**
- 🍔 Hamburger → keep prominent (menu placement, signature callout)
- 🌮 Chicken Tacos → test improvements (name/placement/offer); if results stay weak, consider removal or redesign

---

### 🧭 Category Signals (what tends to perform)
From the item popularity results with category included:
- ✅ Most-ordered items trend toward **American** and **Asian**
- 🚨 Least-ordered items trend toward **Mexican** (with some mix)

✨ **Insight:** Mexican items show weaker demand signals compared with American/Asian.
✅ **Recommendation:** simplify Mexican lineup and strengthen a smaller set of “flagship” Mexican items.

---

### 💳 High-Spend Orders Tell a Different Story (value ≠ popularity)
- Top 5 highest-spend orders were identified via `SUM(price)` and `LIMIT 5`
- Highest-spend order ID: **440**
- Category breakdown for order **440** shows **Italian-heavy** ordering
- Top 5 highest-spend orders also show **more Italian** than other categories overall

✨ **Insight (the “wow” moment):**
Even if Italian isn’t always the most frequent choice, it appears strongly tied to the **highest-spend** behavior.
✅ **Recommendation:** protect and highlight premium Italian offerings (they appear valuable to the biggest spenders).

---

## ✅ Deliverable Summary (what this analysis provides)
- Menu structure and pricing extremes (cheapest/most expensive)
- Category composition and price positioning (avg price by category)
- Order volume and time window (min/max dates, unique orders, item lines)
- Basket-size extremes and large-order count (>12 items)
- Least/most ordered items + category context
- Top spend orders + deep dive into the highest-spend order and category preferences

---

## 🧠 Core SQL Concepts Demonstrated
`SELECT` • `COUNT` • `MIN/MAX` • `AVG` • `SUM` • `WHERE` • `GROUP BY` • `ORDER BY` • `HAVING` • `LIMIT` • `IN` • `LEFT JOIN` • Subqueries
