-- Calculate total spending for each customer
SELECT
    customer_id,
    SUM(amount) AS total_spent
FROM
    transactions
GROUP BY
    customer_id;

-- Identify customer segments based on total spending
SELECT
    customer_id,
    CASE
        WHEN total_spent >= 1000 THEN 'High-Value Customer'
        WHEN total_spent >= 500 THEN 'Mid-Value Customer'
        ELSE 'Low-Value Customer'
    END AS segment
FROM
    (
        SELECT
            customer_id,
            SUM(amount) AS total_spent
        FROM
            transactions
        GROUP BY
            customer_id
    ) AS customer_segments;

-- Calculate average order value for each customer segment
SELECT
    segment,
    AVG(total_spent) AS average_order_value
FROM
    (
        SELECT
            customer_id,
            CASE
                WHEN total_spent >= 1000 THEN 'High-Value Customer'
                WHEN total_spent >= 500 THEN 'Mid-Value Customer'
                ELSE 'Low-Value Customer'
            END AS segment
        FROM
            (
                SELECT
                    customer_id,
                    SUM(amount) AS total_spent
                FROM
                    transactions
                GROUP BY
                    customer_id
            ) AS customer_segments
    ) AS segments
GROUP BY
    segment;
   

-- Identify customers who have the highest total spending
SELECT
    customer_id,
    SUM(amount) AS total_spending
FROM
    transactions
GROUP BY
    customer_id
ORDER BY
    total_spending DESC
LIMIT 5;

-- Identify customers who have the highest number of transactions
SELECT
    customer_id,
    COUNT(*) AS transaction_count
FROM
    transactions
GROUP BY
    customer_id
ORDER BY
    transaction_count DESC
LIMIT 5;

-- Calculate the average order value for each customer
SELECT
    customer_id,
    AVG(order_total) AS average_order_value
FROM
    orders
GROUP BY
    customer_id;


