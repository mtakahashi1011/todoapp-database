SET CHARACTER_SET_CLIENT = utf8;
SET CHARACTER_SET_CONNECTION = utf8;

-- CREATE DATABASE 'keiba';

-- USE 'todo_app';

CREATE TABLE IF NOT EXISTS 'todo_app'.'users' (
  'id'          INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
  'name'        VARCHAR(255) UNIQUE,
  'password'    VARCHAR(255)
  );

CREATE TABLE IF NOT EXISTS 'todo_app'.'tasks' (
  'id'          INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
  'user_id'     INT NOT NULL,
  'content'     VARCHAR(255) NOT NULL
);

-- INSERT INTO 'todo_app'.'tasks' VALUES (1, 1, "Node.js");
