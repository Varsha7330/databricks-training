--1. Read sales data -> clean nulls -> calculate daily sales
SELECT sale_date,
       SUM(total_amount) AS daily_sales
FROM sales
WHERE customer_id IS NOT NULL
GROUP BY sale_date;

--2. Read customer data -> clean invalid rows -> city-wise revenue
SELECT c.city,
       SUM(s.total_amount) AS total_revenue
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
WHERE c.customer_id IS NOT NULL
GROUP BY c.city;

--3. Find repeat customers (>2 orders)
SELECT customer_id,
       COUNT(*) AS order_count
FROM sales
GROUP BY customer_id
HAVING COUNT(*) > 2;

--4. Find highest spending customer in each city
SELECT city,
       customer_id,
       total_spend
FROM (
    SELECT c.city,
           c.customer_id,
           SUM(s.total_amount) AS total_spend,
           ROW_NUMBER() OVER (
               PARTITION BY c.city
               ORDER BY SUM(s.total_amount) DESC
           ) AS rn
    FROM customers c
    JOIN sales s
    ON c.customer_id = s.customer_id
    GROUP BY c.city, c.customer_id
) t
WHERE rn = 1;

--5. Build final reporting table with customer, city, total spend, order count
SELECT
    c.customer_id,
    c.first_name,
    c.city,
    SUM(s.total_amount) AS total_spend,
    COUNT(s.sale_id) AS order_count
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.city;




