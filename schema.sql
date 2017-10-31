DROP TABLE IF EXISTS ingredients;

CREATE TABLE ingredients (
   id SERIAL PRIMARY KEY,
   step INTEGER,
   name VARCHAR(255)
);

-- CREATE TABLE ingredients (
--    id SERIAL PRIMARY KEY,
--    name VARCHAR(255)
-- );
