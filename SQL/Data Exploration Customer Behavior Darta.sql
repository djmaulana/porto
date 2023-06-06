-- Query to explore customer behavior data

-- 1. Calculate the total number of orders made by each customer
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id;

-- 2. Determine the average order value for each customer
SELECT customer_id, AVG(order_amount) AS average_order_value
FROM orders
GROUP BY customer_id;

-- 3. Find the top 5 customers with the highest total order amount
SELECT customer_id, SUM(order_amount) AS total_order_amount
FROM orders
GROUP BY customer_id
ORDER BY total_order_amount DESC
LIMIT 5;

-- 4. Identify the most popular product category based on the number of orders
SELECT product_category, COUNT(*) AS order_count
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY product_category
ORDER BY order_count DESC
LIMIT 1;

-- 5. Determine the average time between orders for each customer
SELECT customer_id, AVG(order_interval) AS average_order_interval
FROM (
    SELECT customer_id, order_date - LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS order_interval
    FROM orders
) subquery
GROUP BY customer_id;

-- 6. Find the percentage of customers who made repeat purchases
SELECT COUNT(DISTINCT customer_id) * 100 / (SELECT COUNT(*) FROM customers) AS repeat_customer_percentage
FROM orders;

-- 7. Calculate the average order value for each month
SELECT EXTRACT(MONTH FROM order_date) AS month, AVG(order_amount) AS average_order_value
FROM orders
GROUP BY month;

-- 8. Identify the top 3 customer segments based on their purchasing behavior
SELECT customer_segment, COUNT(*) AS customer_count
FROM customers
GROUP BY customer_segment
ORDER BY customer_count DESC
LIMIT 3;

-- 9. Determine the revenue generated from each customer segment
SELECT customer_segment, SUM(order_amount) AS segment_revenue
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customer_segment;

-- 10. Calculate the customer lifetime value (CLV) for each customer
SELECT customer_id, SUM(order_amount) * AVG(order_interval) AS clv
FROM (
    SELECT customer_id, order_amount, order_date - LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS order_interval
    FROM orders
) subquery
GROUP BY customer_id;
