USE pizza_sales_db;

--- A.KPI Requirements

---- 1. Total Revenue:
SELECT SUM(total_price) as Total_Revenue FROM pizza_sales;

---- 2.Average Order Value:
SELECT SUM(total_price) / COUNT(distinct order_id) as AVG_ORDER_VALUE FROM pizza_sales;

---- 3.Total Pizzas Sold:
SELECT SUM(quantity) as TOTAL_pizza_sold FROM pizza_sales;

---- 4.Total Orders:
SELECT COUNT(distinct order_id) as Total_orders FROM pizza_sales;

---- 5. Average Pizzas Per Order:
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avg_Pizzas_per_order
FROM pizza_sales;


---- B.Daily Trend for Total Orders:
SELECT DAYNAME(order_date) AS order_day, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);

---- C.Monthly Trend for Orders:
SELECT MONTHNAME(order_date) as order_month,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
group by MONTHNAME(order_date);

---- D. % of Sales by Pizza Category:
SELECT pizza_category, 
       SUM(total_price) AS total_revenue,
       (SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

---- E. % of Sales by Pizza Size:
SELECT pizza_size, 
SUM(total_price) AS total_revenue,
(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)) AS PCT
FROM pizza_sales
GROUP BY pizza_size;

---- F. Total Pizzas Sold by Pizza Category:
SELECT SUM(quantity) AS Quantity, pizza_category as Total_quantity_sold
FROM pizza_sales
Group BY pizza_category
ORDER BY SUM(quantity) DESC;

---- G. Top 5 Pizzas by Revenue:
SELECT pizza_name , SUM(total_price) as Total_amount
From pizza_sales
GROUP BY pizza_name
ORDER BY  Total_amount DESC
LIMIT 5;

---- H. Bottom 5 Pizzas by Revenue:
SELECT pizza_name, SUM( total_price) as Total_amount
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_amount ASC
LIMIT 5;

---- I.Top 5 Pizzas by Quantity:
SELECT SUM(quantity) as Total_quantity, pizza_name
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC
LIMIT  5 ;

---- J. Bottom 5 Pizzas by Quantity:
SELECT SUM(quantity) as Total_quantity, pizza_name
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity ASC
LIMIT  5 ;

---- K. Top 5 Pizzas by Total Orders:
SELECT COUNT(Distinct order_id) as Total_quantity, pizza_name
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC
LIMIT  5 ;

---- L. Bottom 5 Pizzas by Total Orders:
SELECT COUNT(Distinct order_id) as Total_quantity, pizza_name
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity ASC
LIMIT  5 ;

---- END OF PROJECT