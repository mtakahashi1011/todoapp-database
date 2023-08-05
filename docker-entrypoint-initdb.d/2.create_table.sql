SET CHARACTER_SET_CLIENT = utf8;
SET CHARACTER_SET_CONNECTION = utf8;

CREATE TABLE IF NOT EXISTS `todo_app`.`users` (
  `id`          INT UNSIGNED AUTO_INCREMENT NOT NULL,
  `name`        VARCHAR(255) UNIQUE,
  `password`    VARCHAR(255),
  PRIMARY KEY (`id`)
  );

CREATE TABLE IF NOT EXISTS `todo_app`.`tasks` (
  `id`          INT UNSIGNED AUTO_INCREMENT NOT NULL,
  `user_id`     INT NOT NULL,
  `content`     VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
);

USE todo_app; 

INSERT INTO `tasks` VALUES (12, 2, `Node.js`);
