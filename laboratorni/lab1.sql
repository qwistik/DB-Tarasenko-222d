SELECT name
FROM cities
LIMIT 10 OFFSET 10;
---------
SELECT name, population, region
FROM cities
ORDER BY name DESC
LIMIT 30;
---------
SELECT name, population, region
FROM cities
ORDER BY region ASC, population DESC;
---------
SELECT DISTINCT region
FROM cities;
---------
SELECT name, population, region
FROM cities
ORDER BY region DESC, name DESC;
