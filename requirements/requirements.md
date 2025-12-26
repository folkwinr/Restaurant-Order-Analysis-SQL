## ✅ Requirements (Restaurant Order Analysis — SQL / MySQL)

### 1) Data Requirements
- Two tables (or CSVs imported as tables) must be available:
  - **menu_items**
    - `menu_item_id` (primary key)
    - `item_name`
    - `category`
    - `price`
  - **order_details**
    - `order_details_id` (primary key)
    - `order_id`
    - `order_date`
    - `order_time`
    - `item_id` (foreign key to `menu_items.menu_item_id`)
- Data must cover transactions within the dataset’s recorded time window (queried via `MIN(order_date)` and `MAX(order_date)`).
- `price` should be numeric and non-null for menu item rows.

---

### 2) Environment / Tooling Requirements
- **MySQL** database engine (or any SQL database with equivalent syntax support).
- A SQL client such as:
  - **MySQL Workbench** (recommended), or
  - DBeaver / DataGrip / CLI client
- Ability to run standard SQL queries with:
  - Aggregations: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
  - Grouping & filtering: `GROUP BY`, `HAVING`
  - Sorting & limiting: `ORDER BY`, `LIMIT`
  - Joins: `LEFT JOIN` (and optionally `INNER JOIN`)
  - Subqueries

---

### 3) Analysis Requirements (What the SQL must produce)

#### Objective 1 — Menu Exploration (`menu_items`)
- View the full table (`SELECT *`)
- Count total menu items (`COUNT(*)`)
- Identify least and most expensive items (`ORDER BY price ASC/DESC`)
- Filter Italian items and count them (`WHERE category='Italian'` + `COUNT(*)`)
- Find least/most expensive Italian items (`ORDER BY price ASC/DESC`)
- Count items per category (`GROUP BY category` + `COUNT(menu_item_id)`)
- Compute average price per category (`GROUP BY category` + `AVG(price)`)

#### Objective 2 — Order Exploration (`order_details`)
- View the full table (`SELECT *`)
- Determine date range (`MIN(order_date)`, `MAX(order_date)`)
- Count unique orders (`COUNT(DISTINCT order_id)`)
- Count total item lines (`COUNT(*)`)
- Identify orders with the most items:
  - `GROUP BY order_id` + `COUNT(item_id) AS num_items`
  - Sort by `num_items DESC`
- Count orders with more than 12 items:
  - Use `HAVING num_items > 12`
  - Wrap as a subquery and `COUNT(*)` the resulting rows

#### Objective 3 — Customer Behavior (Join + Insights)
- Join both tables:
  - `LEFT JOIN` on `order_details.item_id = menu_items.menu_item_id`
- Find least and most ordered items:
  - `GROUP BY item_name` + `COUNT(order_details_id) AS num_purchases`
  - Sort ascending/descending
- Add category context:
  - Include `category` in `SELECT` and `GROUP BY`
- Find top 5 highest-spend orders:
  - `GROUP BY order_id` + `SUM(price) AS total_spend`
  - `ORDER BY total_spend DESC` + `LIMIT 5`
- Inspect highest spend order details (filter by its order_id)
- Analyze category breakdown for top 5 spend orders using `IN (...)`
- Optionally split results by order_id + category for comparison

---

### 4) Output Requirements (Deliverables)
- SQL queries saved in a single `.sql` file or included in the repo README.
- A short written summary covering:
  - menu size + price extremes
  - order volume + date range
  - largest baskets and 12+ item order count
  - least/most ordered items
  - top 5 highest-spend orders and category preference notes
