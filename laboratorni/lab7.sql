CREATE TABLE news_categories 
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
);

CREATE TABLE news 
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    content TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    author_name VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    publication_date DATETIME NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (category_id) REFERENCES news_categories(id)
);

CREATE TABLE users 
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
);

CREATE TABLE comments 
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    creation_date DATETIME NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    news_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (news_id) REFERENCES news(id)
);

CREATE TABLE news_ratings 
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    value INT NOT NULL CHECK (value >= 1 AND value <= 5),
    user_id INT UNSIGNED NOT NULL,
    news_id INT UNSIGNED NOT NULL,
    ip_address VARCHAR(45) NOT NULL, -- Здесь можно хранить IP-адрес пользователя
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (news_id) REFERENCES news(id)
);
