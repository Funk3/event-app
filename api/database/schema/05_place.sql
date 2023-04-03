DROP TABLE IF EXISTS category CASCADE;
CREATE TABLE place (
  id SERIAL PRIMARY KEY NOT NULL,
  name UNIQUE NOT NULL,
  description TEXT NOT NULL,
  category_id INTEGER REFERENCES category(id),
  owner_id INTEGER REFERENCES users(id),
  address TEXT NOT NULL,
  latitude VARCHAR(40) NOT NULL,
  longitude VARCHAR(40) NOT NULL
);