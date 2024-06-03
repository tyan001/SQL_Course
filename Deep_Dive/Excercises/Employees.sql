-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: Employees
 */
--


-- Question 1: What is the average salary for the company?
-- Table: Salaries
SELECT avg(salary) AS "Average Salary" FROM salaries;

-- Question 2: What year was the youngest person born in the company?
-- Table: employees
SELECT max(birth_date) AS "Youngest person born in the company" FROM employees;