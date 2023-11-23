SELECT cities.name, regions.name AS region_name
FROM cities, regions
WHERE cities.region = regions.uuid AND cities.population > 350000;
-----------------
SELECT cities.name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';
-----------------
CREATE TABLE `cities` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `stations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`city_id`) REFERENCES `cities`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `lines` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`city_id`) REFERENCES `cities`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `station_lines` (
  `station_id` INT UNSIGNED NOT NULL,
  `line_id` INT UNSIGNED NOT NULL,
  `position` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`station_id`, `line_id`),
  FOREIGN KEY (`station_id`) REFERENCES `stations`(`id`),
  FOREIGN KEY (`line_id`) REFERENCES `lines`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `connections` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `station_id_from` INT UNSIGNED NOT NULL,
  `station_id_to` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`station_id_from`) REFERENCES `stations`(`id`),
  FOREIGN KEY (`station_id_to`) REFERENCES `stations`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO lines (name, city_id) VALUES
('Зелена', 1),
('Червона', 1),
('Синя', 1),
;

INSERT INTO station_lines (station_id, line_id) VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 3),
(5, 2), 
(6, 1),
;
