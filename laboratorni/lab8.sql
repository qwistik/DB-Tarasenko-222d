-- Таблиця користувачів
CREATE TABLE users3 
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
);

-- Таблиця проектів
CREATE TABLE projects3 
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
);

-- Таблиця тасків
CREATE TABLE tasks3 
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    task_name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    author_id INT UNSIGNED NOT NULL,
    project_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

-- Таблиця виконавців тасків
CREATE TABLE task_assignees3 
(
    task_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (task_id, user_id),
    FOREIGN KEY (task_id) REFERENCES tasks(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Таблиця файли тасків
CREATE TABLE task_files3
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    file_name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    task_id INT UNSIGNED NOT NULL,
    project_id INT UNSIGNED, -- Якщо файл додано до проекту, а не конкретного таску
    FOREIGN KEY (task_id) REFERENCES tasks(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);
