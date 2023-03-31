DROP TABLE IF EXISTS event CASCADE;
CREATE TABLE event (
  id PRIMARY KEY UNIQUE NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  category_id INTEGER REFERENCES category(id),
  start_date_time DATETIME NOT NULL,
  end_date_time DATETIME NOT NULL,
  latitude VARCHAR(40) NOT NULL,
  longitude VARCHAR(40) NOT NULL,
  organizer_id INTEGER REFERENCES users(id),
  created_at TIMESTAMP default now(),
  updated_at TIMESTAMP
);