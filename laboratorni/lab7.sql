CREATE TABLE `category` 
(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
);

CREATE TABLE `news` 
(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `content` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    `author` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    `creation_date` DATETIME NOT NULL,
    `category_id` INT UNSIGNED NOT NULL,
    FOREIGN KEY (`category_id`) REFERENCES `category`(`id`)
);

CREATE TABLE `user` 
(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
);

CREATE TABLE `comment` 
(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `content` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    `creation_date` DATETIME NOT NULL,
    `user_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci ,
    `news_id` INT UNSIGNED NOT NULL,
    FOREIGN KEY (`news_id`) REFERENCES `news`(`id`) 
);

CREATE TABLE `rating` 
(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `value` INT NOT NULL CHECK (value >= 1 AND value <= 5),
    `user_id` INT UNSIGNED NOT NULL,
    `news_id` INT UNSIGNED NOT NULL,
    `ip_address` VARCHAR(45) NOT NULL,
    UNIQUE INDEX `unique_rating` (`user_id`, `news_id`, `ip_address`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`news_id`) REFERENCES `news`(`id`)
);
