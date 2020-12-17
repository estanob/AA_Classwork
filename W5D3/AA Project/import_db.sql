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

-- CREATE TABLE question_follows (
--   SELECT 
--     Customers.CustomerName, Orders.OrderID
--   FROM 
--     Customers
--   FULL OUTER JOIN Orders 
--   ON 
--     Customers.CustomerID=Orders.CustomerID
--   ORDER BY 
--     Customers.CustomerName;
-- );

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