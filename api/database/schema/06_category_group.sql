DROP TABLE IF EXISTS category_group CASCADE;
CREATE TABLE category_group (
  user_id INTEGER REFERENCES users(id),
  category_id INTEGER REFERENCES category(id)
);