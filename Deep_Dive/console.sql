SELECT *
FROM employees
WHERE first_name ILIKE 'g%ger';

-- have to kill all session or restart to see the changes
-- ALTER USER postgres SET timezone='UTC';

-- Changes Time zone for current session.
SET TIME ZONE 'UTC';

SHOW TIMEZONE;

SELECT NOW();

-- CREATE TABLE timezones(
--     ts TIMESTAMP WITHOUT TIME ZONE,
--     tz TIMESTAMP WITH TIME ZONE
-- )
--
-- INSERT INTO timezones VALUES(
--     TIMESTAMP WITHOUT TIME ZONE '2000-01-01 10:00:00-05',
--     TIMESTAMP WITH TIME ZONE '2000-01-01 10:00:00-05'
-- );

SELECT *
FROM timezones;
SELECT TO_CHAR(NOW(), 'dd/mm/yyyy-hh:mm:ss');
SELECT TO_CHAR(CURRENT_DATE, 'ddd');

SELECT TO_CHAR(AGE(date '1900/01/01'), 'yyy');

SELECT EXTRACT(YEAR FROM date '1995/01/15') AS year;
SELECT DATE_TRUNC('year', date '1995/01/15');

SELECT NOW() INTERVAL '5 years';

-----------------------------------------------------

SELECT DISTINCT salary
FROM salaries;

SELECT first_name, last_name
FROM employees
ORDER BY first_name ASC, last_name DESC;

-- have to but ASC/DESC for each columns or default is asc
SELECT first_name, last_name
FROM employees
ORDER BY first_name, last_name DESC;

SELECT employees.first_name, employees.last_name
FROM employees
ORDER BY LENGTH(first_name) ASC;

-------------------------------------------------------

SELECT a.emp_no, CONCAT(a.first_name, a.last_name) AS "name", b.salary
FROM employees AS a,
     salaries AS b
WHERE a.emp_no = b.emp_no
ORDER BY a.emp_no;

SELECT a.emp_no, CONCAT(a.first_name, a.last_name) AS "name", b.salary
FROM employees AS a
INNER JOIN salaries as b on b.emp_no = a.emp_no
ORDER BY emp_no;

SELECT a.emp_no,
       concat(a.first_name, a.last_name) as "name",
       b.salary,
       c.title,
       c.from_date as "promoted on"
from employees as a
INNER JOIN salaries as b on a.emp_no = b.emp_no
INNER JOIN titles as c on c.emp_no = a.emp_no
AND c.from_date = (b.from_date + interval '2 days')
ORDER BY a.emp_no;



SELECT employees.emp_no,
       concat(employees.first_name, employees.last_name) as "name",
       salaries.salary,
       titles.title,
       titles.from_date as "promoted on"
from employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no
INNER JOIN titles on employees.emp_no = titles.emp_no
AND titles.from_date = (salaries.from_date + interval '2 days')
ORDER BY employees.emp_no;
















