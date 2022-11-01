
-- Q1: What is the average minimum temperature across all Saturdays?

SELECT AVG(market_min_temp)
FROM market_date_info
WHERE market_day = 'Saturday';

-- Q2: Generate a report that only returns market_date_info where the market_min_temp was lower than the average 
-- market_min_temp

SELECT *
FROM market_date_info
WHERE market_min_temp < AVG(market_min_temp);

-- Use a subquery! (scalar)

SELECT *
FROM market_date_info
WHERE market_min_temp < (SELECT AVG(market_min_temp) FROM market_date_info);

-- Q3. Which vendors were in the market on 2019-04-03
SELECT *
FROM vendor_booth_assignments
WHERE market_date = '2019-04-03';

-- Column sub query process
-- Q4. Give me all the historical data for the vendors that were in the market on 2019-03-04
SELECT * 
FROM vendor
WHERE vendor_id IN (
					SELECT vendor_id
					FROM vendor_booth_assignments
						WHERE market_date = '2019-04-03'
						);
						
-- Row subquery process
-- Q5. What is the first and last name of the most recent customer
USE employees;

SELECT *
FROM customer_purchases
ORDER BY market_date DESC, transaction_time DESC
LIMIT 1;

SELECT customer_first_name, customer_last_name
FROM customer
WHERE customer_id = (
					SELECT customer_id
					FROM customer_purchases
					ORDER BY market_date DESC, transaction_time DESC
					LIMIT 1
					);

SELECT *
FROM customer AS c
JOIN customer_purchases AS cp ON c.customer_id = cp.customer_id;

-- Showing answer with join
SELECT customer_first_name, customer_last_name
FROM customer AS c
JOIN customer_purchases AS cp ON c.customer_id = cp.customer_id
ORDER BY market_date DESC, transaction_time DESC
LIMIT 1;


-- Table subquery
SELECT 
	customer_id,
	CONCAT(customer_first_name, '-', customer_zip) AS cust_zip
FROM customer
ORDER BY cust_zip ASC;

SELECT *
FROM customer_purchases AS cp
JOIN	(SELECT 
		customer_id,
		CONCAT(customer_first_name, '-', customer_zip) AS cust_zip
		FROM customer
		ORDER BY cust_zip ASC
		) AS cz ON cp.customer_id = cz.customer_id;
		
-- Crazy Q1: WHAT IS THE AVERAGE QUANTITY BY CUSTOMER_ID
SELECT customer_id, AVG(quantity) AS 'average_quantity'
FROM customer_purchases
GROUP BY customer_id;

-- Crazy Q2: WHAT IS THE AVERAGE OF THOSE AVERAGES?
SELECT AVG(average_quantity)
FROM	(
		SELECT customer_id, AVG(quantity) AS 'average_quantity'
		FROM customer_purchases
		GROUP BY customer_id
		) AS aq;
		

-- 1. FIND ALL CURRENT EMPLOYEES WITH THE SAME HIRE DATE AS EMPLOYEE 101010 USING SUB QUERY
SELECT *
FROM employees
JOIN dept_emp USING(emp_no)
WHERE hire_date = (
					SELECT hire_date
					FROM employees
					WHERE emp_no = 101010
AND to_date > CURDATE()					
					);

-- 2. FIND ALL TITLES EVER HELD BY ALL CURRENT EMPLOYEES WITH FIRST NAME AAMOD. 314 TITLES
SELECT title
FROM titles
WHERE emp_no IN (
				SELECT emp_no
					FROM employees
					JOIN dept_emp USING(emp_no)
					WHERE first_name = 'Aamod'
					AND to_date > now()
				);
						
-- 3. HOW MANY PEOPLE IN THE EMPLOYEES TABLE ARE NO LONGER WORKING FOR THE COMPANY?
SELECT *
FROM employees
WHERE emp_no IN
					(
						 SELECT emp_no
					 FROM dept_emp
					 WHERE to_date < now()
						);

-- 4. FIND ALL CURRENT DEPARTMENT MANAGERS THAT ARE FEMALE. LIST THEIR NAMES IN A COMMENT
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE emp_no IN (
				SELECT emp_no
				FROM dept_manager
				WHERE to_date > now()
)
and gender = "F";

				
-- 5. FIND ALL THE EMPLOPYEES WHO CURRENTLY HAVE A HIGHER SALARY THAN THE COMPANIES OVERALL, HISTORICAL AVERAGE SALARY
SELECT emp_no, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
JOIN salaries USING(emp_no)
WHERE salary > (
				SELECT AVG(salary)
				FROM salaries
				  )
AND to_date > now() 
GROUP BY emp_no, full_name;


-- 6. HOW MANY CURRENT SALARES ARE WITHIN 1 STANDARD DEVIATION OF THE CURRENT HIGHEST SALARY?

select max(salary) from salaries where to_date > now();

-- # what is the 1 std for current salary;
select stddev(salary) from salaries where to_date > now();

-- Count of current salaries > (Max-1 std). (count = 83)
select count(*)
from salaries
where to_date > now()
and salary > (
(select max(salary) from salaries where to_date > now()) - 
(select std(salary) from salaries where to_date > now())
);

-- Denominator, 240,124
select count(*)
from salaries 
where to_date > now();

select((select count(*)
from salaries
where to_date > now()
and salary > (
(select max(salary) from salaries where to_date > now()) - 
(select std(salary) from salaries where to_date > now())
))/(select count(*)
from salaries 
where to_date > now())) * 100 as "current salaries within 1 Stdev of Max";


SELECT COUNT (*) AS num_of_emps, (COUNT(*) / (
											 SELECT COUNT(`to_date`)
											 	     FROM salaries
											 	     WHERE to_date > CURDATE()) * 100) AS percent_of_emps
											 	     
FROM salaries
WHERE salary >= (SELECT (MAX(salary) - STD(salary))
				 FROM salaries
				 WHERE to_date > CURDATE()
AND salaries.to_date > CURDATE;
											 	  



