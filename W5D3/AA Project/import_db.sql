PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
-- DROP TABLE IF EXISTS question_follows;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL, -- subject/summary of the question
  body TEXT NOT NULL, -- actual text of the question 
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users (id)
);

CREATE TABLE question_follows (
  user_id INTEGER PRIMARY KEY, 
  question_id INTEGER NOT NULL
);

CREATE TABLE replies ( 
  id INTEGER PRIMARY KEY,
  parent_id INTEGER,
  author_id INTEGER NOT NULL, 
  body TEXT NOT NULL, 
  title TEXT NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions (id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ("Brandon", "Estano"),
  ("Justin", "Souza");

INSERT INTO
  questions (title, body, author_id)
VALUES
  ("Database setup", "What is the format to set up a databse and how do you check to see that it exists?", 1),
  ("SQL", "How to SQL?", 2); 

INSERT INTO 
  replies (body, question_id, title) 
VALUES 
  ('you just do it', 2, 'do it')