/* ============================================================
   OBJECTIVE 2: EXPLORE THE ORDER_DETAILS TABLE
   Database: SQL Server (SSMS / T-SQL)
   Goal:
   - Understand order volume
   - Analyze order size and date range
   Table used: order_details
   ============================================================ */


/* ------------------------------------------------------------
   0) Basic sanity check
   ------------------------------------------------------------
   Each row represents ONE item ordered
*/

SELECT COUNT(*) AS total_rows
FROM order_details;


/* ------------------------------------------------------------
   1) View the order_details table
   ------------------------------------------------------------
   Helps understand:
   - order_id (repeats across rows)
   - order_date and order_time
   - item_id (links to menu_items)
*/

SELECT *
FROM order_details;


/* ------------------------------------------------------------
   2) What is the date range of the table?
   ------------------------------------------------------------
   Find the first and last order dates
*/

SELECT
    MIN(order_date) AS start_date,
    MAX(order_date) AS end_date
FROM order_details;


/* ------------------------------------------------------------
   3) How many orders were made within this date range?
   ------------------------------------------------------------
   order_id repeats, so we must count DISTINCT values
*/

SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM order_details;


/* ------------------------------------------------------------
   4) How many items were ordered within this date range?
   ------------------------------------------------------------
   Each row = one item ordered
*/

SELECT
    COUNT(*) AS total_items_ordered
FROM order_details;


/* ------------------------------------------------------------
   5) Which orders had the most number of items?
   ------------------------------------------------------------
   Steps:
   - Group by order_id
   - Count items per order
   - Sort from highest to lowest
*/

SELECT
    order_id,
    COUNT(*) AS number_of_items
FROM order_details
GROUP BY order_id
ORDER BY number_of_items DESC;


/* ------------------------------------------------------------
   6) How many orders had MORE THAN 12 items?
   ------------------------------------------------------------
   Logic:
   - First find orders with more than 12 items
   - Then count how many such orders exist
   - HAVING is used for aggregated filtering
*/

SELECT
    COUNT(*) AS number_of_orders
FROM (
    SELECT
        order_id
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(*) > 12
) AS orders_over_12;
