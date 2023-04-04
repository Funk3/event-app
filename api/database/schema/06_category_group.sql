DROP TABLE IF EXISTS category_group CASCADE;
CREATE TABLE category_group (
  place_id INTEGER REFERENCES place(id),
  category_id INTEGER REFERENCES category(id)
);