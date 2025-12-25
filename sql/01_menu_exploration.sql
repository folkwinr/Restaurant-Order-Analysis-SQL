/* ============================================================
   OBJECTIVE 1: EXPLORE THE MENU_ITEMS TABLE
   Database: SQL Server (SSMS / T-SQL)
   Goal:
   - Understand menu structure
   - Analyze prices and categories
   Table used: menu_items
   ============================================================ */


/* ------------------------------------------------------------
   0) Basic sanity checks
   ------------------------------------------------------------
   Count total rows in both tables
*/

SELECT COUNT(*) AS total_rows
FROM order_details;

SELECT COUNT(*) AS total_rows
FROM menu_items;


/* ------------------------------------------------------------
   1) View the menu_items table
   ------------------------------------------------------------
   Review columns, categories, and prices
*/

SELECT *
FROM menu_items;


/* ------------------------------------------------------------
   2) Find the number of items on the menu
   ------------------------------------------------------------
   Simple row count of menu_items
*/

SELECT COUNT(*) AS total_menu_items
FROM menu_items;


/* ------------------------------------------------------------
   3) Least and most expensive items on the menu
   ------------------------------------------------------------
   Using MIN and MAX returns all items
   that share the lowest or highest price
*/

SELECT *
FROM menu_items
WHERE price = (SELECT MIN(price) FROM menu_items)
   OR price = (SELECT MAX(price) FROM menu_items);


/*
-- Alternative (for quick inspection only)
SELECT
    MAX(price) AS highest_price,
    MIN(price) AS lowest_price
FROM menu_items;

SELECT *
FROM menu_items
ORDER BY price;
*/


/* ------------------------------------------------------------
   4) How many Italian dishes are on the menu?
   ------------------------------------------------------------
*/

SELECT COUNT(*) AS italian_dish_count
FROM menu_items
WHERE category = 'Italian';


/* ------------------------------------------------------------
   5) Least and most expensive Italian dishes
   ------------------------------------------------------------
   MIN / MAX applied only within Italian category
*/

SELECT *
FROM menu_items
WHERE category = 'Italian'
  AND (
       price = (SELECT MIN(price)
                FROM menu_items
                WHERE category = 'Italian')
    OR price = (SELECT MAX(price)
                FROM menu_items
                WHERE category = 'Italian')
  );


/* ------------------------------------------------------------
   6) How many dishes are in each category?
   ------------------------------------------------------------
   Shows menu distribution by category
*/

SELECT
    category,
    COUNT(*) AS number_of_dishes
FROM menu_items
GROUP BY category
ORDER BY number_of_dishes DESC;


/* ------------------------------------------------------------
   7) Average dish price within each category
   ------------------------------------------------------------
   Helps compare pricing strategy across categories
*/

SELECT
    category,
    AVG(price) AS average_price
FROM menu_items
GROUP BY category
ORDER BY average_price DESC;
