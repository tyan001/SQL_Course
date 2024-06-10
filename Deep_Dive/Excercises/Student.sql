SELECT *
FROM student;


/*
* DB: https://www.db-fiddle.com/f/PnGNcaPYfGoEDvfexzEUA/0
* Question:
* Assuming a students minimum age for the class is 15, what is the average age of a student?
*/

SELECT AVG(COALESCE(age, 15))
FROM student;

/*
* DB: https://www.db-fiddle.com/f/PnGNcaPYfGoEDvfexzEUA/0
* Question:
* Replace all empty first or last names with a default?
*/

SELECT id,
       COALESCE(name, 'no val')     AS "names",
       COALESCE(lastname, 'no val') AS "lastnames",
       age
FROM student;

SELECT (NULL = 1) OR (1 = 1);

SELECT (NULL = 1) AND (0 = 1);