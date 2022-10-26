# GROUP BY MODULE

SELECT DISTINCT first_name
FROM employees;

SELECT first_name
FROM employees
GROUP BY first_name;

SELECT last_name, first_name
FROM employees
GROUP BY last_name, first_name;

SELECT COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%';

SELECT COUNT(*)
FROM employees;

SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name;

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT last_name, COUNT(*) AS n_same_last_name
FROM employees
GROUP BY last_name
HAVING n_same_last_name < 150;

SELECT concat(first_name, " ", last_name) AS full_name, COUNT(*) AS n_same_full_name
FROM employees
GROUP BY full_name
HAVING n_same_full_name >= 5;


#farmers market

DESCRIBE customer_purchases;

SELECT *
FROM customer_purchases
LIMIT 10;

SELECT DISTINCT product_id
FROM customer_purchases;

SELECT product_id
FROM customer_purchases
GROUP BY product_id;

SELECT product_id, AVG(quantity)
FROM customer_purchases
GROUP BY product_id;

SELECT product_id, AVG(quantity)
FROM customer_purchases
GROUP BY product_id
HAVING product_id <= 5;

SELECT product_id, MAX(quantity) AS max
FROM customer_purchases
GROUP BY product_id;

SELECT product_id, MAX(quantity) AS max
FROM customer_purchases
WHERE product_id > 5
GROUP BY product_id
HAVING MAX(quantity) > 10;



# GROUP BY EXERCISES---------------------------------

# 2. HOW MANY UNIQUE TITLES?
SELECT DISTINCT title
FROM titles;

# 3. UNIQUE LAST NAMES OF EMPLOYEES THAT START AND END WITH E
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
GROUP BY last_name;

# 4. FIND ALL UNIQUE COMBINATIONS OF EMPLOYEES WHOSE LAST NAMES START AND END WITH E
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY first_name, last_name;

# 5. FIND UNIQUE LAST NAMES WITH Q BUT NOT QU - 3 LAST NAMES
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

# 6. ADD COUNT TO QUERY ABOVE
SELECT last_name, COUNT(last_name)AS unique_lastname
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

# 7. FIND ALL EMPLOYEES WITH FIRST NAMES IRENA, VIDYA, AND MAYA AND FIND NUMBER OF EMPLOYEES FOR EACH GENDER WITH THOSE NAMES
SELECT first_name, gender, COUNT(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender
ORDER BY first_name;

# 8. USING QUERY CREATED FOR USERNAMES, GENERATE A COUNT FOR EACH USERNAME. ARE THERE DUPLICATES? HOW MANY? 13251, YES, THERE ARE DUPLICATE USERNAMES AND 6 EMPLOYEES HAVE DUPLICATE USERNAMES 12 TOTAL 
SELECT
	lower(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', 	SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS 		username, COUNT(*) AS duplicates
FROM employees
GROUP BY username
HAVING duplicates > 2
ORDER BY duplicates DESC;

# 9. BONUS - DETERMINE HISTORIC AVERAGE SALARY FOR EACH EMPLOYEE
SELECT emp_no, AVG(salary) AS avg_salary
FROM salaries
GROUP BY emp_no;

# Bonus- HOW MANY CURRENT EMPLOYEES WORK IN EACH DEPARTMENT?
SELECT dept_no, COUNT(*) AS num_employees
FROM dept_emp
GROUP BY dept_no 
HAVING num_employees > 1;

# BONUS - HOW MANY DIFFERENT SALARIES EACH EMPLOYEE HAS HAD
SELECT emp_no, COUNT(salary) AS diff_salaries
FROM salaries
GROUP BY emp_no;

# BONUS - FIND MAX SALARY FOR EACH EMPLOYEE
SELECT emp_no, MAX(salary) AS max_salary
FROM salaries
GROUP BY emp_no;

# BONUS - FIND MIN SALARY FOR EACH EMPLOYEE
SELECT emp_no, MIN(salary) AS min_salary
FROM salaries
GROUP BY emp_no;

# BONUS - FIND STANDARD DEVIATION OF SALARIES FOR EACH EMPLOYEE
SELECT emp_no, STDDEV(salary) AS stddev_salary
FROM salaries
GROUP BY emp_no;

# BONUS - FIND MAX SALARY FOR EACH EMPLOYEE WHERE MAX SALARY IS GREATER THAN 150K
SELECT emp_no, MAX(salary) AS max_salary
FROM salaries
GROUP BY emp_no
HAVING max_salary > 150000;

# BONUS - FIND AVG SALARY FOR EACH EMPLOYEE WHERE AVG SALARY IS BETWEEN 80K AND 90K
SELECT emp_no, AVG(salary) AS avg_salary
FROM salaries
GROUP BY emp_no
HAVING avg_salary BETWEEN 80000 AND 90000;





