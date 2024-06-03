SELECT *
FROM public.employees;

SELECT employees.emp_no     AS "Employee #",
       employees.birth_date AS "Birthday",
       employees.first_name AS "First name"
FROM employees;

SELECT concat(emp_no, ' is a ', title) AS "Employee Titles"
FROM titles;

SELECT concat(employees.first_name, ' ', employees.last_name) AS "Full Name"
FROM employees;

SELECT count(emp_no) AS "Total Employees"
FROM employees;

SELECT max(salary) AS "Max Salary", sum(salary) AS "Total salary"
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


