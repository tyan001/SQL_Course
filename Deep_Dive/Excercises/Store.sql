-- How many female customers do we have from the state of Oregon (OR)?
SELECT COUNT(gender)
FROM customers
WHERE state = 'OR'
  AND gender = 'F';

-- SELECT count(gender)
-- FROM customers
-- WHERE (state='OR' OR state='NY') AND gender='F';

-- SELECT state, gender
-- FROM customers
-- WHERE (state='OR' OR state='NY') AND gender='F';

-- How many customers aren't 55
SELECT COUNT(age)
FROM customers
WHERE NOT age = 55
  AND NOT age = 20;

-- Who over the age of 44 has an income of 100 000 or more? (excluding 44)
SELECT COUNT(customerid)
FROM customers
WHERE age > 44
  AND income >= 100000;

-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results)
SELECT COUNT(customerid)
FROM customers
WHERE (age >= 30 AND age <= 50)
  AND income < 50000;

-- What is the average income between the ages of 20 and 50? (Excluding 20 and 50)
SELECT AVG(income)
FROM customers
WHERE (age > 20 AND age < 50);

/*
* DB: Store
* Table: Customers
* Question:
* Select people either under 30 or over 50 with an income above 50000
* Include people that are 50
* that are from either Japan or Australia
*/

SELECT age, income, country
FROM customers
WHERE ((age < 30 OR age >= 50) AND income > 50000)
  AND (country = 'Japan' OR country = 'Australia');

SELECT COUNT(*)
FROM customers
WHERE (age < 30 OR age >= 50)
  AND income > 50000
  AND (country = 'Japan' OR country = 'Australia');

/*
* DB: Store
* Table: Orders
* Question:
* What was our total sales in June of 2004 for orders over 100 dollars?
*/

SELECT SUM(totalamount)
FROM orders
WHERE ('2004-06-01' <= orderdate AND orderdate <= '2004-06-30')
  AND totalamount >= 100;


/*
* DB: Store
* Table: customers
* Question: adjust the following query to display the null values as "No Address"
*/
-- SELECT address2
-- FROM customers;

SELECT COALESCE(address2, 'No Address') AS address2
FROM customers;

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/

-- SELECT *
-- FROM customers
-- WHERE COALESCE(address2, null) IS NOT null;

SELECT *
FROM customers
WHERE address2 IS NOT NULL;

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/

-- SELECT coalesce(lastName, 'Empty'), * from customers
-- where (age = null);

SELECT COALESCE(lastName, 'Empty'), *
FROM customers
WHERE (age IS NULL);

-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results)

SELECT *
FROM customers
WHERE (age BETWEEN 30 AND 50)
  AND income < 50000;

SELECT COUNT(*)
FROM customers
WHERE (age BETWEEN 30 AND 50)
  AND income < 50000;

-- What is the average income between the ages of 20 and 50? (Including 20 and 50)
/*
* Write your query here
*/

SELECT AVG(income)
FROM customers
WHERE (age BETWEEN 30 AND 50);

/*
* DB: Store
* Table: orders
* Question: How many orders were made by customer 7888, 1082, 12808, 9623
*/

SELECT *
FROM orders
WHERE customerid IN (7888, 1082, 12808, 9623);

SELECT COUNT(*)
FROM orders
WHERE customerid IN (7888, 1082, 12808, 9623);

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode have a 2 in it?.
* Expected output: 4211
*/

SELECT COUNT(*)
FROM customers
WHERE CAST(zip AS text) LIKE '%2%';

SELECT COUNT(*)
FROM customers
WHERE zip::text LIKE '%2%';

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode start with 2 with the 3rd character being a 1.
* Expected output: 109
*/

SELECT COUNT(*)
FROM customers
WHERE CAST(zip AS text) LIKE '2_1%';

SELECT COUNT(*)
FROM customers
WHERE zip::text LIKE '2_1%';

/*
* DB: Store
* Table: customers
* Question: Which states have phone numbers starting with 302?
* Replace null values with "No State"
* Expected output: https://imgur.com/AVe6G4c
*/

SELECT COALESCE(state, 'No State') AS state
FROM customers
WHERE CAST(phone AS text) LIKE '302%'

SELECT COALESCE(state, 'No State') AS state
FROM customers
WHERE phone::text LIKE '302%';

/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

SELECT count(*) FROM orders
WHERE date_trunc('month', orderdate) = date '2004-01-01';

select date_trunc('month', orderdate) from orders;

