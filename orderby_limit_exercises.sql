#WHERE EXERCISES
USE employees;

# 2. 709 EMPLOYEES NAMED IRENA, VIDYA, OR MAYA
SELECT * 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

# 3. 709 EMPLOYEES NO CHANGE USING OR TO FIND FIRST NAMES QUESTIONS ABOVE
SELECT * 
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

# 4. 441 EMPLOYEES WITH FIRST NAMES IRENA, VIDYA, OR MAYA AND MALE
SELECT * 
FROM employees
WHERE gender = 'M' 
AND (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya');

# 5. 7330 EMPLOYEES WITH LAST NAME STARING WITH E
SELECT *
FROM employees
WHERE last_name LIKE 'E%';

# 6. 30,723 EMPLOYEES WHOSE LAST NAME THAT STARTS OR ENDS WITH E.
SELECT *
FROM employees
WHERE last_name LIKE '%E' OR last_name LIKE 'E%';
# 6. 23,393 EMPLOYEES WHOSE LAST NAME ENDS WITH E BUT NOT START WITH E
SELECT *
FROM employees
WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%';

# 7. 899 EMPLOYEES WHOSE LAST NAME STARTS AND ENDS WITH E
SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';
# 7. 24,292 EMPLOYEES LAST NAMES END WITH E REGARDLESS IF THEY START WITH E
SELECT *
FROM employees
WHERE last_name LIKE '%E';

# 8. 135,214 EMPLOYEES HIRED IN 90'S
SELECT *
FROM employee
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

# 9. 842 EMPLOYEES BORN ON CHRISTMAS
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';

# 10. 362 EMPLOYEES BORN IN THE 90'S AND BORN ON CHRISTMAS
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND (birth_date LIKE '%-12-25');

# 11. 1873 EMPLOYEES WITH A Q IN LAST NAME
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

# 12. 547 EMPLOYEES WITH A Q BUT NO QU IN LAST NAME
SELECT *
FROM employees
WHERE last_name LIKE '%q%' AND 
last_name NOT LIKE '%qu%';

# ORDER BY EXERCISES ----------------------------------------------

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


#limit exercises-----------------------------

# 2. LIST FIRST 10 DISTINCT LAST NAME SORTED IN DESCENDING ORDER
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

# 3. FIRST 5 EMPLOYEES HIRED IN THE 90'S
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%'
ORDER BY hire_date ASC
LIMIT 5;

# 4. FIND THE TENTH PAGE OF RESULTS
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%'
ORDER BY hire_date ASC
LIMIT 5 OFFSET 45;

SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%'
ORDER BY hire_date ASC
LIMIT 50;




 	