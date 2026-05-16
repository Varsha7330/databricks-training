
DATE & TIMESTAMP FUNCTIONS IN MYSQL (DETAILED)
-- Sample Table Structure
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50),
order_date DATE,
order_timestamp TIMESTAMP,
delivery_date DATE,
order_amount DECIMAL(10,2)
);
 --Insert Sample Data
INSERT INTO orders VALUES
(1, 'Karthik', '2024-01-15', '2024-01-15 10:30:45', '2024-01-20', 2500.00),
(2, 'Veena', '2024-02-18', '2024-02-18 18:45:20', '2024-02-22', 3200.50),
(3, 'Ravi', '2024-03-02', '2024-03-02 09:15:10', '2024-03-08', 4100.75),
(4, 'Anil', '2024-03-09', '2024-03-09 14:05:55', '2024-03-15', 1800.00),
(5, 'Suresh', '2024-01-07', '2024-01-07 23:55:00', '2024-01-12', 2900.00);
3. CURRENT DATE & TIME FUNCTIONS
SELECT CURDATE(); -- current date
SELECT CURRENT_DATE();
SELECT CURTIME(); -- current time
SELECT CURRENT_TIME();
SELECT NOW(); -- current date + time
SELECT CURRENT_TIMESTAMP;
1) DATE & TIMESTAMP DATA TYPES
Type Stores
DATE YYYY-MM-DD
TIME HH:MM:SS
DATETIME Date + time (no timezone)
TIMESTAMP Date + time (timezone aware)
2) EXTRACTING YEAR, MONTH, DAY
SELECT
YEAR(order_date),
MONTH(order_date),
DAY(order_date)
FROM orders;
3) EXTRACT USING EXTRACT()
SELECT
EXTRACT(YEAR FROM order_date),
EXTRACT(MONTH FROM order_date),
EXTRACT(DAY FROM order_date)
FROM orders;
4)  MONTH NAME AND DAY NAME
SELECT
MONTHNAME(order_date),
DAYNAME(order_date)
FROM orders;
Example Output
· January, February, March
· Monday, Tuesday, Saturday
5) WEEKDAY AND DAY OF WEEK
SELECT
WEEKDAY(order_date),
DAYOFWEEK(order_date)
FROM orders;
Difference
Function Range Meaning
WEEKDAY() 0–6 Monday = 0
DAYOFWEEK() 1–7 Sunday = 1
6) IDENTIFY WEEKENDS (SATURDAY & SUNDAY)
Method 1: Using DAYNAME
SELECT order_id, order_date
FROM orders
WHERE DAYNAME(order_date) IN ('Saturday', 'Sunday');
Method 2: Using DAYOFWEEK
SELECT order_id, order_date
FROM orders
WHERE DAYOFWEEK(order_date) IN (1, 7);
7) IDENTIFY WEEKDAYS
SELECT order_id, order_date
FROM orders
WHERE DAYOFWEEK(order_date) BETWEEN 2 AND 6;
8) DATE ARITHMETIC
Add / Subtract Days
SELECT order_date, DATE_ADD(order_date, INTERVAL 5 DAY)
FROM orders;
SELECT order_date, DATE_SUB(order_date, INTERVAL 3 DAY)
FROM orders;
Add / Subtract Months
SELECT DATE_ADD(order_date, INTERVAL 1 MONTH) FROM orders;
SELECT DATE_SUB(order_date, INTERVAL 2 MONTH) FROM orders;
Add / Subtract Years
SELECT DATE_ADD(order_date, INTERVAL 1 YEAR) FROM orders;
9) DATEDIFF (Difference in Days)
SELECT
order_id,
DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders;
10) TIMESTAMPDIFF (Difference in Units)
SELECT
TIMESTAMPDIFF(DAY, order_date, delivery_date) AS days_diff,
TIMESTAMPDIFF(MONTH, order_date, delivery_date) AS months_diff
FROM orders;
11) LAST DAY OF MONTH
SELECT LAST_DAY(order_date) FROM orders;
12) FIRST DAY OF MONTH
SELECT DATE_SUB(order_date, INTERVAL DAY(order_date)-1 DAY)
FROM orders;
13) DATE FORMAT (IMPORTANT)
SELECT DATE_FORMAT(order_date, '%d-%m-%Y') FROM orders;
SELECT DATE_FORMAT(order_date, '%M %d, %Y') FROM orders;
Common Format Specifiers
Specifier Meaning
%Y Year (2024)
%y Year (24)
%m Month number
%M Month name
%d Day
%W Weekday name
%H Hour
%i Minutes
%s Seconds
14) STRING TO DATE (STR_TO_DATE)
SELECT STR_TO_DATE('15-01-2024', '%d-%m-%Y');
15) TIMESTAMP FORMATTING
SELECT DATE_FORMAT(order_timestamp, '%d-%m-%Y %H:%i:%s')
FROM orders;
16) FILTER BY MONTH (JAN, FEB, MAR)
SELECT *
FROM orders
WHERE MONTH(order_date) = 1; -- January
SELECT *
FROM orders
WHERE MONTHNAME(order_date) = 'February';
17) FINANCIAL YEAR LOGIC (CASE)
SELECT order_date,
CASE
WHEN MONTH(order_date) >= 4 THEN CONCAT(YEAR(order_date), '-', YEAR(order_date)+1)
ELSE CONCAT(YEAR(order_date)-1, '-', YEAR(order_date))
END AS financial_year
FROM orders;
18) REAL-TIME BUSINESS USE CASES
Orders in Last 7 Days
SELECT *
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 7 DAY;
Orders Placed Today
SELECT *
FROM orders
WHERE DATE(order_timestamp) = CURDATE();
