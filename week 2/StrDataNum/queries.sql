
--NUMBER 1
CREATE TABLE employee_payments (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    base_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    joining_date DATE
);
INSERT INTO employee_payments VALUES
(1,'karthik','Data',75000.75,5000.50,'2019-03-15'),
(2,'veena','HR',65000.40,4000.25,'2021-06-20'),
(3,'ravi','Data',85000.90,6000.75,'2016-01-10'),
(4,'anil','Finance',70000.10,NULL,'2020-09-01'),
(5,'suresh','HR',60000.55,3000.30,'2022-11-25');

--QUESTION
--For each employee:  
--Convert emp_name to proper case ---upper /lower ---Initcap (CamelCase)
--Calculate total income = base_salary + bonus (NULL safe) +
--Round total income to nearest integer
--Extract joining year
--Use CASE to classify:
-- Senior if experience > 7 years
--Mid if between 4 and 7
--Junior otherwise

SELECT 
    emp_id,

    UPPER(emp_name) AS upper_name,
    LOWER(emp_name) AS lower_name,

    CONCAT(
        UPPER(LEFT(emp_name,1)),
        LOWER(SUBSTRING(emp_name,2))
    ) AS proper_name,

    ROUND(base_salary + COALESCE(bonus,0)) AS total_income,

    YEAR(joining_date) AS joining_year,

    CASE
        WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) > 7 
            THEN 'Senior'

        WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) 
             BETWEEN 4 AND 7 
            THEN 'Mid'

        ELSE 'Junior'
    END AS employee_category

FROM employee_payments;


--NUMBER 2
CREATE TABLE orders_delivery (
order_id INT,
customer_name VARCHAR(50),
order_date DATE,
delivery_date DATE,
order_amount DECIMAL(10,2)
);
INSERT INTO orders_delivery VALUES
(101,'rajesh','2025-01-01','2025-01-05',12500.75),
(102,'meena','2025-01-10','2025-01-10',8400.40),
(103,'arun','2025-01-15','2025-01-20',15600.90),
(104,'pooja','2025-01-18',NULL,9200.10);
--For each order:
--· Uppercase customer name
--· Calculate delivery days using date difference
--· Replace NULL delivery date with today
--· Truncate order amount to 1 decimal
--· Use CASE:
--o Same-day
--o Delayed (>3 days)
--o Pending
select 
	order_id,
    upper(customer_name) as customer_name,
     DATEDIFF(
        COALESCE(delivery_date, CURDATE()),
        order_date
    ) AS delivery_days,
    COALESCE(delivery_date, CURDATE()) AS final_delivery_date,
    TRUNCATE(order_amount,1) AS truncated_amount,
    case
    	when delivery_date is NULL
        	then 'pending'
        when DATEDIFF(delivery_date, order_date)=0
        	then 'same-day'
        when DATEDIFF(delivery_date, order_date)> 3
        	then 'Delayed'
        else 'normal'
    end as delivery_status
from orders_delivery;


		


