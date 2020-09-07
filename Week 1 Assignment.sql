-- HW Week 1
-- Joshua Rifkin

-- 1. How many airplanes have listed speeds? What is the minimum listed speed and the maximum listed speed?
-- # ANSWER: Airplanes = 23, Min speed = 90, Max speed = 432
SELECT COUNT(*) FROM planes WHERE speed IS NOT NULL;
SELECT MIN(speed) FROM planes WHERE speed IS NOT NULL;
SELECT MAX(speed) FROM planes WHERE speed IS NOT NULL;

-- 2. What is the total distance flown by all of the planes in January 2013? What is the total
-- distance flown by all of the planes in January 2013 where the tailnum is missing?
-- ANSWER: total dist. 1/2013 = 27188805, total dist 1/2013 with tailnum null = none.
SELECT SUM(distance) FROM flights WHERE
month = 1 AND
year = 2013;

SELECT SUM(distance) FROM flights WHERE
month = 1 AND
year = 2013 AND
tailnum IS NULL;

-- 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft
-- manufacturer? Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
-- ANSWER: Difference is that LEFT OUTER JOIN includes null tailnum results.
SELECT p.manufacturer, SUM(f.distance) FROM flights f
INNER JOIN planes p ON p.tailnum = f.tailnum
WHERE
f.month = 7 AND
f.day = 5 AND
f.year = 2013
GROUP BY p.manufacturer
ORDER BY p.manufacturer ASC;

SELECT p.manufacturer, SUM(f.distance) FROM flights f
LEFT OUTER JOIN planes p ON p.tailnum = f.tailnum
WHERE
f.month = 7 AND
f.day = 5 AND
f.year = 2013
GROUP BY p.manufacturer
ORDER BY p.manufacturer ASC;

-- 4. Write and answer at least one question of your own choosing that joins information
-- from at least three of the tables in the flights database.
-- QUESTION: Find the average delay for each manufacturer flying out of Newark on April 1, 2013
Select * FROM flights;
SELECT AVG(f.arr_delay) AS 'Average Delay', p.manufacturer AS 'Manufacturer', a.name as 'Origin' FROM flights f
INNER JOIN planes p ON p.tailnum = f.tailnum
INNER JOIN airports a ON a.faa = f.origin
WHERE f.day = 1 AND
f.month = 4 AND
f.year = 2013 AND
f.origin = 'EWR'
GROUP BY p.manufacturer, a.name
ORDER BY avg(f.arr_delay) DESC;

