/* ============================================================
   OBJECTIVE 3: ANALYZE CUSTOMER BEHAVIOR
   Database: SQL Server (SSMS / T-SQL)
   Goal:
   - Identify most and least ordered items
   - Analyze high-spending orders
   - Understand category preferences
   ============================================================ */


/* ------------------------------------------------------------
   1) Combine menu_items and order_details into a single table
   ------------------------------------------------------------
   LEFT JOIN keeps all order records
*/

SELECT *
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id;


/* ------------------------------------------------------------
   2) Least and most ordered items
   ------------------------------------------------------------
   Count how many times each item was ordered
*/


/* 2A) Most ordered items (all items ranked) */

SELECT
    item_name,
    COUNT(order_details_id) AS num_purchases
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY item_name
ORDER BY num_purchases DESC;


/* 2B) Most ordered items with categories */

SELECT
    item_name,
    category,
    COUNT(order_details_id) AS num_purchases
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;


/* 2C) Single most ordered item */

SELECT TOP 1
    mi.item_name,
    mi.category,
    COUNT(*) AS times_ordered
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name, mi.category
ORDER BY times_ordered DESC;


/* 2D) Single least ordered item */

SELECT TOP 1
    mi.item_name,
    mi.category,
    COUNT(*) AS times_ordered
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name, mi.category
ORDER BY times_ordered ASC;


/* ------------------------------------------------------------
   3) Top 5 orders that spent the most money
   ------------------------------------------------------------
   Total spend = sum of item prices per order
*/

SELECT TOP 5
    od.order_id,
    SUM(mi.price) AS total_spent
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY od.order_id
ORDER BY total_spent DESC;


/* ------------------------------------------------------------
   4) View the details of the highest spend order
   ------------------------------------------------------------
   Analyze category distribution for that order
*/

SELECT
    category,
    COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;


/* Optional: category distribution across ALL orders */

SELECT
    category,
    COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY category
ORDER BY num_items DESC;


/* ------------------------------------------------------------
   5) View the details of the TOP 5 highest spend orders
   ------------------------------------------------------------
   Compare category preferences of high-value customers
*/

SELECT
    order_id,
    category,
    COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;


/* ------------------------------------------------------------
   6) Highest spend order confirmation
   ------------------------------------------------------------
   Quick check to confirm top spending order
*/

SELECT TOP 1
    od.order_id,
    SUM(mi.price) AS total_spent
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY od.order_id
ORDER BY total_spent DESC;
