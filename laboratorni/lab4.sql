SELECT UPPER(name)
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5;
-------
SELECT name, LENGTH(name)/2 AS name_length
FROM cities
WHERE LENGTH(name) != 8 AND LENGTH(name) != 9 AND LENGTH(name) != 10;
-------
SELECT region, SUM(population) AS population_c_s
FROM cities
WHERE region IN ('C', 'S')
GROUP BY region;
-------
SELECT region, AVG(population) AS average_w
FROM cities
WHERE region = 'W'
GROUP BY region;
-------
SELECT COUNT(*) AS count_cyti_e
FROM cities
WHERE region = 'E';
