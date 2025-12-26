## 🧾 Executive Summary (Restaurant Order Analysis — SQL / MySQL)

This project analyzes **Taste of the World Cafe** using two MySQL tables (**menu_items** and **order_details**) to evaluate new menu performance and understand high-spend customer behavior.

### ✅ What the data shows (from the SQL outputs)
- **Menu size:** 32 items  
- **Price range:** **$5** (Edamame) → **$19.95** (Shrimp Scampi)  
- **Italian presence:** 9 Italian dishes, and **Italian has the highest average price** by category (American is the lowest).
- **Order activity window:** **Jan 1, 2023 → Mar 31, 2023**
- **Volume:** **5,370 unique orders** and **12,000 total item lines**
- **Basket extremes:** largest orders contain **14 items**; **20 orders** contain **more than 12 items**
- **Item popularity:** **Hamburger** is the most ordered item; **Chicken Tacos** is the least ordered item
- **Category signal:** most-ordered items trend toward **American/Asian**, while least-ordered items skew toward **Mexican**
- **High-spend behavior:** the **highest-spend order (ID 440)** and the **top 5 spend orders** show a strong tilt toward **Italian** items

### 💡 Key takeaways
- The menu is naturally segmented into **premium (Italian)** vs **value/comfort (American)**, creating a clear foundation for positioning and upselling.
- There is a small but important “large basket” segment (12+ items) that may represent group/bulk orders and should be handled with tighter operational standards.
- Popularity and value are not the same: while American/Asian items dominate frequency, **Italian appears most associated with highest-spend behavior**, making it strategically important to protect and highlight premium Italian offerings.

### 🎯 Practical recommendations
- **Keep and amplify:** Hamburger (top performer) via menu placement and visibility.
- **Fix or reconsider:** Chicken Tacos (lowest performer) via targeted tests (name/placement/offer).
- **Refocus Mexican:** simplify and strengthen a smaller set of flagship items.
- **Protect premium Italian:** prioritize visibility and experience, especially for high-spend customers.
- **Operationalize large orders:** build a consistent workflow for 12+ item orders.
