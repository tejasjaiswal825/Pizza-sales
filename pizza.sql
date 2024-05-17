create database mrppt
use mrppt

select * from [dbo].[pizza_sales$]
RENAME TABLE [dbo].[pizza_sales$] TO pizzasale;
EXEC sp_rename '[dbo].[pizza_sales$]', 'pizzasale';

select * from pizzasale

-- Finding Duplicate Entries
SELECT pizza_id, COUNT(*) AS duplicate_count
FROM pizzasale
GROUP BY pizza_id
HAVING COUNT(*) > 1;

-- Finding Null Values
SELECT pizza_id, order_id, pizza_name, pizza_category, pizza_ingredients
FROM pizzasale
WHERE pizza_name IS NULL
   OR pizza_category IS NULL
   OR pizza_ingredients IS NULL;

-- Finding Zero Values
SELECT pizza_id, order_id, quantity, total_price
FROM pizzasale
WHERE quantity = 0
   OR total_price = 0;

--Top 10 most ordered pizzas
SELECT TOP 10 pizza_name, COUNT(*) AS Top10_order
FROM pizzasale
GROUP BY pizza_name
ORDER BY Top10_order DESC;

--Top 5 most revenue-generating pizzas
SELECT top 5 pizza_name, SUM(total_price) AS total_revenue
FROM pizzasale
GROUP BY pizza_name
ORDER BY total_revenue DESC
;

--Total revenue generated
SELECT SUM(total_price) AS total_revenue
FROM pizzasale;

--Average order value:
SELECT AVG(total_price) AS average_order_value
FROM pizzasale;

--Most popular pizza size:
SELECT top 5 pizza_size, COUNT(*) AS order_count
FROM pizzasale
GROUP BY pizza_size
ORDER BY order_count DESC;

--Orders placed on a specific date
SELECT order_id, SUM(total_price) AS order_total
FROM pizzasale
WHERE order_date = '2015-01-01'
GROUP BY order_id;

--Pizzas containing specific ingredients
SELECT top 10 pizza_name, pizza_ingredients
FROM pizzasale
WHERE pizza_ingredients LIKE '%Chicken%';

--Distinct pizza categories
SELECT DISTINCT pizza_category

--Number of orders per day
SELECT top 11 order_date, COUNT(*) AS Total_count
FROM pizzasale
GROUP BY order_date
order by Total_count desc ;

--Orders placed during a specific time range
SELECT COUNT(order_id) AS Afternoon_orders
FROM pizzasale
WHERE order_time BETWEEN '1899-12-30 12:00:00.000' AND '1899-12-30 18:00:00.000';

SELECT COUNT(order_id) AS Morning_orders
FROM pizzasale
WHERE order_time BETWEEN '1899-12-30 6:00:00.000' AND '1899-12-30 11:59:00.000';

SELECT COUNT(order_id) AS Night_orders
FROM pizzasale
WHERE order_time BETWEEN '1899-12-30 18:00:00.000' AND '1899-12-30 23:59:00.000';


SELECT top 10 pizza_name, order_id, SUM(total_price) AS order_total
FROM pizzasale
GROUP BY order_id, pizza_name
HAVING SUM(total_price) BETWEEN 5 AND 10;


SELECT pizza_category, pizza_size, COUNT(*) AS order_count
FROM pizzasale
GROUP BY pizza_category, pizza_size
ORDER BY pizza_category, order_count DESC;

SELECT pizza_category, COUNT(*) AS order_count
FROM pizzasale
GROUP BY pizza_category
ORDER BY order_count DESC;

