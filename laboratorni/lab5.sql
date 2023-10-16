SELECT region, SUM(population) AS population
FROM cities
GROUP BY region;
------
SELECT region, SUM(population) AS population
FROM cities
GROUP BY region
HAVING COUNT(*) >= 10;
------
SELECT name, population
FROM cities
WHERE region IN (SELECT region
                 FROM cities
                 GROUP BY region
                 HAVING COUNT(DISTINCT id) >= 5)
ORDER BY population DESC
LIMIT 5 OFFSET 10;
------
SELECT region, SUM(population) AS population1
FROM cities
WHERE population > 300000
GROUP BY region;
------
SELECT name, population
FROM cities
WHERE region IN (SELECT region
                 FROM cities
                 GROUP BY region
                 HAVING COUNT(DISTINCT area) <= 5)
AND population < 150000 AND population > 500000;
