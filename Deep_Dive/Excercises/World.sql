-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: World
 */
--

-- Question 1: How many official languages are there?
-- Table: countrylanguage
SELECT COUNT(language) AS "Official Languages"
FROM countrylanguage
WHERE isofficial = true;

-- Question 2: What is the average life expectancy in the world?
-- Table: country
SELECT AVG(lifeexpectancy) AS "Average Life Expectancy"
FROM country;

-- Question 3: What is the average population for cities in the netherlands?
-- Table: city
SELECT AVG(population) AS "Average Population"
FROM country
WHERE name = 'Netherlands';

select AVG(population)
from city
where countrycode = 'NLD';
/*
 asda
 asdasd
 asdasd
 */