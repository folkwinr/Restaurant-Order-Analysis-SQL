# 🧠 Taste of the World Cafe — SQL Insights & Action Plan (MySQL)

This mini case study analyzes **Taste of the World Cafe** using two MySQL tables to generate **clear, actionable insights** about menu structure, pricing, and customer order behavior.

---

## 🗂️ Dataset & Tables

We work with two tables:

- 🍽️ **`menu_items`** → item metadata  
  **Columns:** `menu_item_id`, `item_name`, `category`, `price`

- 🧾 **`order_details`** → transaction lines (line-level data)  
  **Columns:** `order_details_id`, `order_id`, `item_id`, `order_date`, `order_time`

🎯 **Goal:** Explore the menu → explore orders → join both tables to understand:
- ✅ which items perform well vs. not well
- ✅ what **high-spend** orders tend to prefer

---

## 🧪 SQL Approach (What Was Done)

### 🍽️ A) Menu Exploration — `menu_items`
**Techniques used:** `SELECT *`, `COUNT(*)`, `ORDER BY`, `WHERE`, `GROUP BY`, `AVG()`

What we checked:
- full menu overview
- total number of items
- cheapest vs. most expensive items
- Italian-only drilldown
- items per category
- average price per category

---

### 🧾 B) Order Exploration — `order_details`
**Techniques used:** `MIN/MAX()`, `COUNT(DISTINCT)`, `COUNT(*)`, `GROUP BY`, `ORDER BY`, `HAVING`, subquery

What we checked:
- date range covered
- total unique orders
- total item lines (how many items were sold)
- items per order (basket size)
- largest baskets
- how many orders have **12+ items**

⚠️ **Important modeling note:** `order_details` is **line-level** data.  
So:
- `COUNT(DISTINCT order_id)` = **order count**
- `COUNT(*)` = **total items sold (order lines)**

---

### 🔗 C) Customer Behavior via JOIN — `menu_items` + `order_details`
**Join used:** `LEFT JOIN` on `order_details.item_id = menu_items.menu_item_id`

What we analyzed:
- most / least ordered items
- categories behind winners vs. underperformers
- top 5 highest-spend orders (by `SUM(price)`)
- deep dive into the **highest-spend** order (order_id = **440**)
- category breakdown for top spenders

---

# 📌 Key Findings (Only from Query Outputs) + “So What?” Actions

## 🟦 1) Menu Reality Check — Size, Range, and Price Ladder

### ✅ Menu size & extremes
- Total menu items: **32**
- Cheapest item: **Edamame — $5**
- Most expensive item: **Shrimp Scampi — $19.95**

💡 **Insight:** The menu is not trapped in a single price band.  
There’s a **$5 → $19.95 pricing ladder**, which naturally supports:
- 🔼 **upsell paths**
- 💎 **premium selection framing**

---

## 🟩 2) Category Strategy — Built-in Segmentation

### 🍝 Italian category (premium signal)
- Italian items: **9**
- Italian has the **highest average price**
- Shrimp Scampi (Italian) is the **menu price peak**

### 🇺🇸 American category (value/comfort anchor)
- American has the **lowest average price**

💡 **Insight:** The menu is organically segmented:
- 🍝 **Italian = premium positioning**
- 🇺🇸 **American = value / comfort anchor**

✅ **Action ideas**
- ✨ Visually separate Italian into a **“Chef’s Picks / Premium Corner”**  
  (icon, box, top section, highlight label)
- ➡️ Build an **upsell flow**: **American → Italian**  
  (server suggestions, menu callouts, “upgrade to…” prompts)

---

## 🟨 3) Orders at a Glance — Volume & Multi-Item Behavior

### 📅 Date window
- **Jan 1, 2023 → Mar 31, 2023** (3 months)

### 🧾 Order volume
- Unique orders: **5,370**
- Total item lines: **12,000**

💡 **Insight:** Item lines are high relative to orders → a meaningful portion of customers
show **multi-item basket behavior** (not just single-item orders).

---

## 🟥 4) Basket Extremes — Large Orders Exist (and Matter)

- Largest basket size: **14 items**
- Orders with **12+ items**: **20**

💡 **Insight:** Very large baskets are rare but real.  
This pattern often signals **group / office / bulk ordering behavior**.

✅ **Operational actions**
- Treat **12+ item orders** as a **special handling flow**:
  - 📦 standardized packing
  - ⏱️ speed + coordination checklist
  - 🧾 bulk-order communication template

🔍 **Recommended follow-up analysis (to confirm the hypothesis)**
- ⏰ hour-of-day distribution for those 20 orders
- 🧩 common product combinations (bundles/pairs)
- 🧭 category concentration in large baskets

---

## 🟦 5) Winners vs. Underperformers — Item-Level Signals

### 🏆 Most ordered item
- **Hamburger**

### 🚨 Least ordered item
- **Chicken Tacos**

💡 **Insight:** Clear “keep & amplify” vs. “fix or reconsider” signals exist.

✅ **Action ideas**
- 🍔 **Hamburger (winner)**
  - keep prominent (menu placement, badge)
  - grow baskets via **combo/side/drink pairing**
- 🌮 **Chicken Tacos (underperformer)**
  - run low-cost tests: **name, placement, description, price, highlight**
  - if still weak → consider **redesign or removal**

---

## 🟩 6) Category Demand Signals — What Tends to Perform?

From item popularity with category included:
- ✅ Most-ordered items trend toward **American + Asian**
- 🚨 Least-ordered items trend toward **Mexican** (with some mix)

💡 **Insight:** Mexican shows weaker demand signals vs. American/Asian.
This isn’t always a “quality problem”—often it’s **positioning + naming + placement**.

✅ **Action ideas**
- 🇲🇽 **Mexican**
  - simplify the lineup
  - promote **1–2 flagship items**
  - rename / reposition items (menu structure matters)
- 🇺🇸🍜 **American & Asian**
  - demand is strong → align **inventory + prep + staffing** to match volume

---

## 🟥 7) High-Spend Orders Tell a Different Story (Popularity ≠ Value)

Top 5 highest-spend orders were identified via:
- `GROUP BY order_id`
- `SUM(price) AS total_spend`
- `ORDER BY total_spend DESC`
- `LIMIT 5`

- Highest-spend order: **order_id = 440**
- Order 440 is **Italian-heavy**
- Top 5 spend orders overall show **more Italian** than other categories

💡 **Insight (key moment):**  
Even if Italian isn’t always the most frequent choice, it’s strongly tied to **high-spend behavior**.  
This clarifies a crucial strategy point: **popularity ≠ profitability/value**.

✅ **Action ideas**
- 🍝 Strengthen Italian as a **premium experience**
  - chef recommendation tag
  - premium language & presentation
  - high-spend-friendly bundles / upsell prompts
- 🧩 Consider a simple segmentation concept:
  - **Italian-lovers vs. Asian-lovers**
  - tailor menu layout / suggestions accordingly

---

# ✅ Executive Action List (Top 6 from This SQL Only)

1. 🍔 **Hamburger:** protect, highlight, and grow baskets with combos/sides.
2. 🌮 **Chicken Tacos:** urgently test improvements; if weak → redesign/remove.
3. 🇲🇽 **Mexican:** reposition and simplify; keep 1–2 flagship items.
4. 🍝 **Italian:** protect premium items; they correlate with top spending.
5. 📦 **12+ item orders (20 total):** treat as bulk segment; create ops flow.
6. 🔼 **Segmentation is ready:** American = value/comfort, Italian = premium → build upsell path.

---

## ⚠️ Notes / Limitations

- There is **no customer_id**, so “segment” insights are based on **behavioral signals** only.
- Orders are **line-based**, so basket analysis is inferred from item lines per order (which is still a strong operational signal).

---

## 📎 What This Analysis Delivers

- menu structure + pricing extremes
- category composition + average price positioning
- order volume + covered time window
- basket-size extremes + count of large orders (12+)
- most/least ordered items + category context
- highest-spend orders + deep dive into order 440 + category preferences
