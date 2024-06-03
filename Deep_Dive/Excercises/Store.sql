-- How many female customers do we have from the state of Oregon (OR)?
SELECT count(gender)
FROM customers
WHERE state='OR' AND gender='F';

-- SELECT count(gender)
-- FROM customers
-- WHERE (state='OR' OR state='NY') AND gender='F';

-- SELECT state, gender
-- FROM customers
-- WHERE (state='OR' OR state='NY') AND gender='F';

-- How many customers aren't 55
SELECT count(age)
FROM customers
WHERE NOT age=55 and NOT age=20;

-- Who over the age of 44 has an income of 100 000 or more? (excluding 44)
SELECT count(customerid)
FROM customers
WHERE age>44 AND  income>=100000;

-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results)
SELECT count(customerid)
FROM customers
WHERE (age>=30 AND age<=50) AND income<50000;

-- What is the average income between the ages of 20 and 50? (Excluding 20 and 50)
SELECT avg(income)
FROM customers
WHERE (age>20 AND age<50);

/*
* DB: Store
* Table: Customers
* Question:
* Select people either under 30 or over 50 with an income above 50000
* Include people that are 50
* that are from either Japan or Australia
*/

SELECT age,income,country
FROM customers
WHERE ((age<30 OR age>=50) AND income>50000) AND (country='Japan' OR country='Australia');

SELECT count(*)
FROM customers
WHERE (age<30 OR age>=50) AND income>50000 AND (country='Japan' OR country='Australia');

/*
* DB: Store
* Table: Orders
* Question:
* What was our total sales in June of 2004 for orders over 100 dollars?
*/

SELECT SUM(totalamount)
FROM orders
WHERE ('2004-06-01'<=orderdate AND orderdate<='2004-06-30') AND totalamount>=100;