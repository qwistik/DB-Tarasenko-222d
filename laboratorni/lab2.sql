SELECT name, population
FROM cities
WHERE population >= 100000;
-------------
SELECT name, region, population
FROM cities
WHERE region = 'E' OR region = 'W'
ORDER BY population ASC;
-------------
SELECT name, region, population
FROM cities
WHERE region IN ('C', 'S', 'N') AND population > 50000
-------------
SELECT name, region, population
FROM cities
WHERE region IN ('E', 'W', 'N') AND population < 350000 AND population > 150000
ORDER BY name ASC
LIMIT 20;
-------------
SELECT name, region, population
FROM cities
WHERE NOT region IN ('E', 'W')
ORDER BY population DESC
LIMIT 10 OFFSET 10;
