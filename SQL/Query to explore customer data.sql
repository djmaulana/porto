-- Query to explore customer data

-- 1. Find the total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 2. Get the distinct customer locations
SELECT DISTINCT location
FROM customers;

-- 3. Calculate the average age of customers
SELECT AVG(age) AS average_age
FROM customers;

-- 4. Find the top 5 countries with the highest number of customers
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC
LIMIT 5;

-- 5. Identify the most common occupation among customers
SELECT occupation, COUNT(*) AS occupation_count
FROM customers
GROUP BY occupation
ORDER BY occupation_count DESC
LIMIT 1;

-- 6. Determine the distribution of customers by gender
SELECT gender, COUNT(*) AS gender_count
FROM customers
GROUP BY gender;

-- 7. Calculate the average purchase amount per customer
SELECT customer_id, AVG(amount) AS average_purchase_amount
FROM purchases
GROUP BY customer_id;

-- 8. Find the total revenue generated from purchases
SELECT SUM(amount) AS total_revenue
FROM purchases;

-- 9. Identify the top-selling products
SELECT product_name, COUNT(*) AS product_count
FROM purchases
JOIN products ON purchases.product_id = products.product_id
GROUP BY product_name
ORDER BY product_count DESC
LIMIT 5;

-- 10. Determine the month with the highest revenue
SELECT EXTRACT(MONTH FROM purchase_date) AS month, SUM(amount) AS monthly_revenue
FROM purchases
GROUP BY month
ORDER BY monthly_revenue DESC
LIMIT 1;
