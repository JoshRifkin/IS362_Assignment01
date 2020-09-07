-- HOL SELECT BASICS WEEK 1
-- By: Joshua Rifkin

-- 1. Write a SELECT statement that returns all of the columns in the planes tables
SELECT * FROM planes;

-- 2. Using the weather table, concatenate the year, month, and day columns to display a date in the form "3/17/2013"
SELECT CONCAT(MONTH, '/', DAY, '/', YEAR) AS DATE FROM weather;

-- 3. Order by planes table by number of seats, in descending order.
SELECT * FROM planes ORDER BY seats DESC;

-- 4. List only those planes that have an engine that is 'Reciprocating'
SELECT * FROM planes WHERE engine = 'Reciprocating';

-- 5. List only the first 5 rows in the flights table
SELECT * FROM planes LIMIT 5;

-- 6. What was the longest (non-blank) air time?
-- Answer: 695
SELECT 
    air_time
FROM
    flights
WHERE
    air_time IS NOT NULL
ORDER BY air_time DESC
LIMIT 1;

-- 7. What was the shortest (non-blank) air time for Delta?
-- Answer: 26
SELECT 
    air_time
FROM
    flights
WHERE
    air_time IS NOT NULL AND carrier = 'DL'
ORDER BY air_time
LIMIT 1;

-- 8. Show all of the Alaska Airlines flights between June 1st, 2013 and June 3rd, 2013.
-- Is the way the data is stored in the database helpful to you in making your query?
SELECT 
    *
FROM
    flights
WHERE
    carrier = 'AS' AND year = 2013
        AND month = 6
        AND day BETWEEN 1 AND 3;
        
-- 9. Show all of the airlines whose names contain 'America'
SELECT * FROM airlines WHERE name LIKE '%America%';

-- 10. How many flights went to Miami?
-- Answer: 11728
SELECT COUNT(*) FROM flights WHERE dest = 'MIA';

-- 11. Were there more flights to Miami in January 2013 or July 2013? (Multiple queries are OK)
-- Answer: There were more in January (981) than in July (978)
SELECT COUNT(*) FROM flights WHERE dest = 'MIA' AND year = 2013 AND month = 1;
SELECT COUNT(*) FROM flights WHERE dest = 'MIA' AND year = 2013 AND month = 7;

-- 12. What is the average altitude of airports?
-- Answer: 1005.9170
SELECT AVG(alt) FROM airports;
