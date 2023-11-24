DROP DATABASE IF EXISTS nc_snacks;
CREATE DATABASE nc_snacks;

\c nc_snacks

CREATE TABLE categories(
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(40) NOT NULL
);

INSERT INTO categories(category_name)
VALUES
('crisps'),
('pastry'),
('biscuits'),
('cake');

CREATE TABLE snacks(
  snack_id SERIAL PRIMARY KEY,
  snack_name VARCHAR(40) NOT NULL,
  snack_description VARCHAR(100),
  price_in_pence INT,
  category_id INT REFERENCES categories(category_id)
);

INSERT INTO snacks
  (snack_name, snack_description, price_in_pence, category_id)
VALUES
  ('Party Rings', 'No party is complete without them!', 120, 3),
  ('Hula Hoops', 'The party ring of the crisp world', 80, 1),
  ('Pasty', null, 300, 2),
  ('Nice Biscuits', 'More like ''alright'' biscuits', 150, 3),
  ('Gyoza', 'Like a tiny pasty', 450, 2),
  ('Vol-au-vents', 'ooh lala!', 320, 2);

SELECT snack_name AS title, snack_description, price_in_pence, category_name FROM snacks
JOIN categories ON snacks.category_id = categories.category_id;
