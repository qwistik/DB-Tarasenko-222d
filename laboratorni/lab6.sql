SELECT cities.name, regions.name AS region_name
FROM cities, regions
WHERE cities.region = regions.uuid AND cities.population > 350000;
-----------------
SELECT cities.name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';
-----------------
CREATE TABLE `lab6` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `region` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `metro_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`city_id`) REFERENCES `cities`(`id`)
);

CREATE TABLE `metro_stations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `line_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`line_id`) REFERENCES `metro_lines`(`id`)
);


INSERT INTO `cities` (`name`, `region`) VALUES
('Харьков', 'E'),
('Киев', 'N'),
('Днепр', 'C');

ALTER TABLE `metro_lines` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO `metro_lines` (`city_id`, `name`) VALUES
(1, 'Красная линия'),
(1, 'Синяя линия');

INSERT INTO `metro_lines` (`city_id`, `name`) VALUES
(2, 'Синяя линия'),
(2, 'Зеленая линия');

INSERT INTO `metro_lines` (`city_id`, `name`) VALUES
(3, 'Красная линия'),
(3, 'Зеленая линия');

ALTER TABLE `metro_stations` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO `metro_stations` (`line_id`, `name`, `location`) VALUES
(1, 'Держпром', 'ул. Семена'),
(1, 'Метростроителей', 'ул. Романа');

INSERT INTO `metro_stations` (`line_id`, `name`, `location`) VALUES
(2, 'Алибабовска', 'ул. Артема'),
(2, 'Амазонская', 'ул. Романа');

INSERT INTO `metro_stations` (`line_id`, `name`, `location`) VALUES
(3, 'Пушкинская', 'ул. Романа'),
(3, 'Героев', 'ул. Артема');
