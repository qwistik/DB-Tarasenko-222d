SELECT name
FROM cities
WHERE name LIKE '%ськ';
----------
SELECT name
FROM cities
WHERE name LIKE '%донец%';
----------
SELECT Concat(name, ' (', region, ')')
FROM cities
WHERE population > 100000
ORDER BY name ASC;
----------
SELECT name, (population / 40000000 * 100)
FROM cities
ORDER BY population DESC
LIMIT 10;
----------
SELECT CONCAT(name, ' - ', ROUND((population / 40000000 * 100), 1), '%') AS city_population_percent
FROM cities
WHERE population >= (0.001 * 40000000)
ORDER BY city_population_percent DESC;
