DROP TABLE IF EXISTS ingredients;

CREATE TABLE ingredients (
   id SERIAL PRIMARY KEY,
   step INTEGER,
   name VARCHAR(255)
);
