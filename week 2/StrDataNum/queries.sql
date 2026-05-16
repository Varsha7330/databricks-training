
--NUMBER 1:Employee Compensation Classification
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


--NUMBER 2: Order Delivery Delay Analysis
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

--NUMBER 3: Customer Spending Pattern
CREATE TABLE customer_spending (
    cust_id INT,
    cust_name VARCHAR(50),
    city VARCHAR(30),
    purchase_amount DECIMAL(10,2),
    purchase_date DATE
);
INSERT INTO customer_spending VALUES
(1,'amit','mumbai',12000.75,'2024-12-01'),
(2,'neha','delhi',8500.40,'2024-12-15'),
(3,'rohit','mumbai',15500.90,'2024-11-20'),
(4,'kavya','chennai',6000.10,'2024-10-05');

--Display:
--· Customer name with first letter capitalized
--· Month name of purchase
--· Rounded purchase amount
--· Absolute value of purchase (defensive logic)
--· CASE:
--o High spender > 15000
--o Medium 8000–15000
--o Low otherwise
SELECT 
    CONCAT(
        UPPER(LEFT(cust_name,1)),
        LOWER(SUBSTRING(cust_name,2))
    ) AS customer_name,
    MONTHNAME(purchase_date) AS purchase_month,
    ROUND(purchase_amount) AS rounded_amount,
    ABS(purchase_amount) AS absolute_amount,
    CASE
        WHEN purchase_amount > 15000
            THEN 'High spender'
        WHEN purchase_amount BETWEEN 8000 AND 15000
            THEN 'Medium'
        ELSE 'Low'
    END AS spender_category
FROM customer_spending;

--NUMBER 4: Subscription Validity Check
CREATE TABLE subscriptions (
    user_id INT,
    user_email VARCHAR(100),
    start_date DATE,
    end_date DATE,
    subscription_fee DECIMAL(10,2)
);

INSERT INTO subscriptions VALUES
(1,'karthik@gmail.com','2024-01-01','2025-01-01',12000.50),
(2,'veena@yahoo.com','2024-06-15','2024-12-15',8500.75),
(3,'ravi@hotmail.com','2023-03-01','2024-03-01',15000.90);

--For each user:
--· Extract email domain
--· Calculate subscription duration in months
--· Format fee with commas
--· Find remaining days from today
--· CASE:
--o Active
--o Expiring Soon (≤30 days)
--o Expired
SELECT 
    user_id,
    SUBSTRING_INDEX(user_email,'@',-1) AS email_domain,
    TIMESTAMPDIFF(MONTH, start_date, end_date) AS subscription_duration_months,
    FORMAT(subscription_fee,2) AS formatted_fee,
    DATEDIFF(end_date, CURDATE()) AS remaining_days,
    CASE
        WHEN end_date < CURDATE()
            THEN 'Expired'
        WHEN DATEDIFF(end_date, CURDATE()) <= 30
            THEN 'Expiring Soon'
        ELSE 'Active'
    END AS subscription_status

FROM subscriptions;

--NUMBER 5:Loan EMI Risk Categorization
CREATE TABLE loan_details (
    loan_id INT,
    customer_name VARCHAR(50),
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    loan_start DATE
);

INSERT INTO loan_details VALUES
(201,'suresh',500000.75,8.5,'2022-01-10'),
(202,'mahesh',750000.40,9.2,'2021-05-20'),
(203,'anita',300000.90,7.8,'2023-07-01');
--QUESTION 
--Compute:
--· Monthly interest using power function
-- Years since loan start
--· Round EMI
--· Uppercase customer name
--· CASE:
--o High Risk if interest > 9
--o Medium Risk
--o Low Risk
SELECT 
    loan_id,
    UPPER(customer_name) AS customer_name,
    POWER((1 + interest_rate/100/12),12) AS monthly_interest,
    TIMESTAMPDIFF(YEAR, loan_start, CURDATE()) AS years_since_loan,
    ROUND(loan_amount * (interest_rate/1200),0) AS emi,
    CASE
        WHEN interest_rate > 9
            THEN 'High Risk'
        WHEN interest_rate BETWEEN 8 AND 9
            THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category
FROM loan_details;

--NUMBER 6 :Employee Attendance Evaluation
CREATE TABLE attendance (
    emp_id INT,
    emp_name VARCHAR(50),
    total_days INT,
    present_days INT,
    record_date DATE
);

INSERT INTO attendance VALUES
(1,'karthik',30,28,'2025-01-31'),
(2,'veena',30,22,'2025-01-31'),
(3,'ravi',30,18,'2025-01-31');
--Question
--Calculate:
--· Attendance percentage (rounded)
--· Month name
--· Difference between total and present days
--· Lowercase employee name
--· CASE:
--o Excellent ≥90%
--o Average 75–89%
--o Poor otherwise
SELECT 
    emp_id,
    LOWER(emp_name) AS employee_name,
    ROUND((present_days / total_days) * 100,2) AS attendance_percentage,
    MONTHNAME(record_date) AS month_name,
    (total_days - present_days) AS absent_days,
    CASE
        WHEN ((present_days / total_days) * 100) >= 90
            THEN 'Excellent'
        WHEN ((present_days / total_days) * 100) BETWEEN 75 AND 89
            THEN 'Average'
        ELSE 'Poor'
    END AS attendance_status
FROM attendance;


--NUMBER 7: Product Discount Validation
CREATE TABLE product_sales (
    product_id INT,
    product_name VARCHAR(50),
    mrp DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    sale_date DATE
);
INSERT INTO product_sales VALUES
(1,'Laptop',75000.75,68000.50,'2025-01-10'),
(2,'Mobile',35000.40,33000.25,'2025-01-12'),
(3,'Tablet',25000.90,26000.75,'2025-01-15');
--QUESTION
--For each product:
--Calculate discount amount (absolute)
--Calculate discount percentage
--Display day name of sale
--Convert product name to proper case
--Use CASE:
--Valid Discount
--Overpriced
--No Discount
SELECT 
    product_id,
    CONCAT(
        UPPER(LEFT(product_name,1)),
        LOWER(SUBSTRING(product_name,2))
    ) AS product_name,
    ABS(mrp - selling_price) AS discount_amount,
    ROUND(((mrp - selling_price) / mrp) * 100,2) AS discount_percentage,
    DAYNAME(sale_date) AS sale_day,
    CASE
        WHEN selling_price < mrp
            THEN 'Valid Discount'
        WHEN selling_price > mrp
            THEN 'Overpriced'
        ELSE 'No Discount'
    END AS discount_status
FROM product_sales;

--QUESTION 8: Insurance Policy Aging
CREATE TABLE insurance_policies (
    policy_id INT,
    holder_name VARCHAR(50),
    premium_amount DECIMAL(10,2),
    policy_start DATE,
    policy_end DATE
);
INSERT INTO insurance_policies VALUES
(301,'arjun',12000.50,'2023-01-01','2026-01-01'),
(302,'megha',8500.75,'2022-06-15','2025-06-15'),
(303,'vinod',15000.90,'2021-03-01','2024-03-01');
-- For each policy:
-- Calculate policy duration in years
-- Find remaining days
-- Round premium amount
-- Convert holder name to uppercase
-- Use CASE:
-- Long Term
-- Mid Term
-- Expired
SELECT 
    policy_id,
    UPPER(holder_name) AS holder_name,
    TIMESTAMPDIFF(YEAR, policy_start, policy_end) AS policy_duration_years,
    DATEDIFF(policy_end, CURDATE()) AS remaining_days,
    ROUND(premium_amount) AS rounded_premium,
    CASE
        WHEN policy_end < CURDATE()
            THEN 'Expired'
        WHEN TIMESTAMPDIFF(YEAR, policy_start, policy_end) >= 3
            THEN 'Long Term'
        ELSE 'Mid Term'
    END AS policy_status
FROM insurance_policies;

--NUMBER 9: Salary Increment Simulation
CREATE TABLE salary_revision (
    emp_id INT,
    emp_name VARCHAR(50),
    current_salary DECIMAL(10,2),
    rating INT,
    last_hike DATE
);
INSERT INTO salary_revision VALUES
(1,'karthik',75000.75,5,'2023-01-01'),
(2,'veena',65000.40,4,'2024-01-01'),
(3,'ravi',85000.90,3,'2022-01-01');
-- Question
-- For each employee:
-- Calculate years since last hike
-- Calculate increment using rating logic
-- Calculate new salary (rounded)
-- Convert employee name to lowercase
-- Use CASE:
-- High Increment
-- Moderate
-- No Increment
SELECT 
    emp_id,
    LOWER(emp_name) AS employee_name,
    TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) AS years_since_hike,
    CASE
        WHEN rating = 5 THEN current_salary * 0.20
        WHEN rating = 4 THEN current_salary * 0.10
        WHEN rating = 3 THEN current_salary * 0.05
        ELSE 0
    END AS increment_amount,
    ROUND(
        current_salary +
        CASE
            WHEN rating = 5 THEN current_salary * 0.20
            WHEN rating = 4 THEN current_salary * 0.10
            WHEN rating = 3 THEN current_salary * 0.05
            ELSE 0
        END
    ) AS new_salary,
    CASE
        WHEN rating = 5
            THEN 'High Increment'
        WHEN rating IN (3,4)
            THEN 'Moderate'
        ELSE 'No Increment'
    END AS increment_status
FROM salary_revision;

-- NUMBER 10: Customer Account Status Evaluation
CREATE TABLE bank_accounts (
    account_id INT,
    customer_name VARCHAR(50),
    balance DECIMAL(12,2),
    last_transaction DATE,
    branch VARCHAR(30)
);
INSERT INTO bank_accounts VALUES
(501,'ramesh',125000.75,'2024-12-20','hyderabad'),
(502,'sita',8500.40,'2023-06-15','delhi'),
(503,'manoj',-2500.90,'2025-01-05','mumbai');

-- Question
-- For each account:
-- Find absolute balance
-- Calculate days since last transaction
-- Convert branch name to proper case
-- Find sign of balance
-- Use CASE:
-- Active
-- Dormant
-- Overdrawn
SELECT 
    account_id,
    ABS(balance) AS absolute_balance,
    DATEDIFF(CURDATE(), last_transaction) AS days_since_transaction,
    CONCAT(
        UPPER(LEFT(branch,1)),
        LOWER(SUBSTRING(branch,2))
    ) AS branch_name,
    SIGN(balance) AS balance_sign,
    CASE
        WHEN balance < 0
            THEN 'Overdrawn'
        WHEN DATEDIFF(CURDATE(), last_transaction) > 365
            THEN 'Dormant'
        ELSE 'Active'
    END AS account_status
FROM bank_accounts;

-- NUMBER 11: Salary Risk Flagging Based on Tax Shock
CREATE TABLE salary_audit (
    emp_id INT,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    tax_percent DECIMAL(5,2),
    last_revision DATE
);
INSERT INTO salary_audit VALUES
(1,'karthik',75000.75,10.5,'2022-01-15'),
(2,'veena',65000.40,18.0,'2023-06-01'),
(3,'ravi',85000.90,25.0,'2020-11-20');
-- Question
-- For each employee:
-- Convert employee name to lowercase
-- Calculate net salary after tax and round it
-- Extract revision year
-- Find months since revision
-- Use CASE:
-- Flag Tax Shock
-- Flag Review Needed
-- Stable
SELECT 
    LOWER(emp_name) AS employee_name,
    ROUND(
        salary - (salary * tax_percent / 100)
    ) AS net_salary,
    YEAR(last_revision) AS revision_year,
    TIMESTAMPDIFF(
        MONTH,
        last_revision,
        CURDATE()
    ) AS months_since_revision,
    CASE
        WHEN tax_percent > 20
             AND TIMESTAMPDIFF(MONTH, last_revision, CURDATE()) > 24
            THEN 'Flag Tax Shock'
        WHEN tax_percent BETWEEN 15 AND 20
            THEN 'Flag Review Needed'
        ELSE 'Stable'
    END AS tax_status
FROM salary_audit;

