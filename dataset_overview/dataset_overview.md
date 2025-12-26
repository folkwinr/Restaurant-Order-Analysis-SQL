## 📦 Dataset Overview (Restaurant Order Analysis)

This project uses a small relational dataset representing a restaurant’s **menu** and **customer orders**.  
It is designed for SQL practice with exploration, aggregation, and joins.

---

### 🗂️ Tables Included

#### 1) `menu_items` (Menu Catalog)
A lookup table containing one row per menu item.

**What it represents:**  
- the restaurant’s current menu (new menu launched at the start of the year)
- item pricing and category structure

**Columns**
- `menu_item_id` — unique identifier for each menu item (primary key)
- `item_name` — name of the dish
- `category` — cuisine/category label (e.g., American, Asian, Italian, Mexican)
- `price` — menu price of the dish

**Granularity:** 1 row = 1 menu item

---

#### 2) `order_details` (Order Line Items)
A transaction table containing one row per **item purchased**.

**What it represents:**  
- every item ordered by customers (line-level purchase data)

**Columns**
- `order_details_id` — unique identifier for each row (primary key)
- `order_id` — identifier for the overall order (repeats across multiple rows)
- `order_date` — date the order was placed
- `order_time` — time the order was placed
- `item_id` — menu item purchased (foreign key to `menu_items.menu_item_id`)

**Granularity:** 1 row = 1 item purchased  
➡️ One `order_id` can appear across many rows (multi-item orders).

---

### 🔗 Relationship Between Tables
- `order_details.item_id` ↔ `menu_items.menu_item_id`

This relationship allows menu metadata (name/category/price) to be attached to each purchased item via a join.

---

### 📌 Time Coverage (from SQL exploration)
The dataset contains orders spanning:
- **Jan 1, 2023 → Mar 31, 2023**  
(identified using `MIN(order_date)` and `MAX(order_date)`)

---

### ✅ How to Think About the Data
- `menu_items` answers: *“What exists on the menu and how is it priced?”*
- `order_details` answers: *“What was purchased, when, and in what order?”*
- Joining them answers: *“Which menu items/categories drive demand and high spending?”*
