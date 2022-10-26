## FUNCTIONS

# ORDER BY EXERCISES ----------------------------------------------
USE employees;
#2. IRENA REUTENAUER FIRST, VIDYA SIMMEN LAST
SELECT * 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

# 3. IRENA ACTON FIRST, VIDYA ZWEIZIG LAST
SELECT * 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;


# 4. IRENA ACTON FIRST, MAYA ZYDA LAST
SELECT * 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

# 5. EMPLOYEE LAST NAME STARTS AND ENDS WITH E - 899 RETURNED, 10021 1ST EMPLOYEE NUMBER, RAMZI ERDE, TADAHIRO ERDE, 499648 EMPLOYEE NUMBER
SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY emp_no;

# 6. 899 
SELECT *
FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY hire_date DESC;

# 7. 
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%'
ORDER BY birth_date, hire_date DESC;

# FUNCTIONS

# 2. ALL EMPLOYEES LAST NAME STARTS AND ENDS WITH E AND USE CONCAT TO GET FULL NAME
SELECT concat(first_name, last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

# 3. CONVERT NAMES IN LAST QUERY TO UPPERCASE
SELECT upper(concat(first_name, last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

# 4. FIND ALL EMPLOYEES HIRED IN 90'S AND BORN ON CHRISTMAS. FIND OUT HOW MANY DAYS THEY HAVE BEEN WORKING AT COMPANY
SELECT first_name, last_name, datediff(curdate(), hire_date) AS daysatCO
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%';

# 5. FIND SMALLEST AND LARGEST SALARY
SELECT min(salary) AS smallest_salary,
		max(salary) AS largest_salary
FROM salaries;

# 6. GENERATE USERNAME FOR ALL EMPLOYEES IN LOWERCASE, FIRST CHARACTER OF FIRST NAME, FIRST 4 CHARACTERS OF LAST NAME, UNDERSCORE, MONTH EMPLOYEE WAS BORN, AND LAST TWO DIGITS OF YEAR BORN 

SELECT 
	lower(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', 	SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username,
	first_name, last_name, birth_date	
FROM employees;







