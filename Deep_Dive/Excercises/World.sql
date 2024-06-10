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
WHERE isofficial = TRUE;

-- Question 2: What is the average life expectancy in the world?
-- Table: country
SELECT AVG(lifeexpectancy) AS "Average Life Expectancy"
FROM country;

-- Question 3: What is the average population for cities in the netherlands?
-- Table: city
SELECT AVG(population) AS "Average Population"
FROM country
WHERE name = 'Netherlands';

SELECT AVG(population)
FROM city
WHERE countrycode = 'NLD';


/*
* DB: World
* Table: city
* Question: How many cities are in the district of Zuid-Holland, Noord-Brabant and Utrecht?
*/

SELECT *
FROM city
WHERE district IN ('Zuid-Holland', 'Noord-Brabant', 'Utrecht');

SELECT COUNT(*)
FROM city
WHERE district IN ('Zuid-Holland', 'Noord-Brabant', 'Utrecht');

/*
* DB: World
* Table: country
* Question: Can I get a list of distinct life expectancy ages
* Make sure there are no nulls
*/

SELECT DISTINCT lifeexpectancy
FROM country
where lifeexpectancy is not NULL;