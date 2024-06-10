-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: Employees
 */

-- Question 1: What is the average salary for the company?
-- Table: Salaries
SELECT AVG(salary) AS "Average Salary"
FROM salaries;

-- Question 2: What year was the youngest person born in the company?
-- Table: employees
SELECT MAX(birth_date) AS "Youngest person born in the company"
FROM employees;

/*
* DB: Employees
* Table: employees
* Question: Find the age of all employees who's name starts with M.
* Sample output: https://imgur.com/vXs4093
* Use EXTRACT (YEAR FROM AGE(birth_date)) we will learn about this in later parts of the course
*/

SELECT first_name, EXTRACT(YEAR FROM AGE(birth_date)) AS age
FROM employees
WHERE first_name LIKE 'M%';


/*
* DB: Employees
* Table: employees
* Question: How many people's name start with A and end with R?
* Expected output: 1846
*/

SELECT COUNT(*)
FROM employees
WHERE first_name ILIKE 'a%r';

-- DATE and TIMESTAMP

/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

SELECT AGE(birth_date)
FROM employees
WHERE EXTRACT(YEAR FROM AGE(birth_date)) > 60;

-- alternative
SELECT AGE(birth_date)
FROM employees
WHERE birth_date < NOW() - INTERVAL '61 years';
-- 61 years before the current date

/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/

SELECT COUNT(hire_date)
FROM employees
WHERE EXTRACT(MONTH FROM hire_date) = 2;

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

SELECT COUNT(hire_date)
FROM employees
WHERE EXTRACT(MONTH FROM birth_date) = 11;

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/

SELECT MAX(AGE(birth_date))
FROM employees;

/*
* DB: Employees
* Table: titles
* Question: What unique titles do we have?
*/

SELECT DISTINCT title
FROM titles;


/*
* DB: Employees
* Table: employees
* Question: How many unique birth dates are there?
*/

SELECT COUNT(DISTINCT birth_date)
FROM employees;

/*
* DB: Employees
* Table: employees
* Question: Sort employees by first name ascending and last name descending
*/

SELECT first_name, last_name
FROM employees
ORDER BY first_name ASC, last_name DESC;

/*
* DB: Employees
* Table: employees
* Question: Sort employees by age
*/

SELECT EXTRACT(YEARS FROM AGE(birth_date))
FROM employees
ORDER BY AGE(birth_date);

SELECT birth_date
FROM employees
ORDER BY birth_date;

/*
* DB: Employees
* Table: employees
* Question: Sort employees who's name starts with a "k" by hire_date
*/

SELECT *
FROM employees
WHERE first_name ILIKE 'k%'
ORDER BY hire_date;

-----------------------------------------------------------------------------------------------------------------------

/*
Learning Commands
*/

SELECT employees.emp_no     AS "Employee #",
       employees.birth_date AS "Birthday",
       employees.first_name AS "First name"
FROM employees;

SELECT CONCAT(emp_no, ' is a ', title) AS "Employee Titles"
FROM titles;

SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS "Full Name"
FROM employees;

SELECT COUNT(emp_no) AS "Total Employees"
FROM employees;

SELECT MAX(salary) AS "Max Salary", SUM(salary) AS "Total salary"
FROM salaries;

-- Get all female employees

SELECT *
FROM employees
WHERE gender = 'F'
  AND birth_date > '1960-01-01';

SELECT *
FROM employees
WHERE (first_name = 'Georgi' AND last_name = 'Chinin')
   OR (first_name = 'Bezalel' AND last_name = 'Simmel');


SELECT *
FROM employees
WHERE emp_no IN (100001, 100006, 100008);