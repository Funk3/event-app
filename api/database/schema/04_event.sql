DROP TABLE IF EXISTS event CASCADE;
CREATE TABLE event (
  id SERIAL PRIMARY KEY UNIQUE NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  start_date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_date DATE NOT NULL,
  end_time TIME NOT NULL,
  location_id INTEGER REFERENCES place(id),
  organizer_id INTEGER REFERENCES users(id),
  created_at TIMESTAMP default now(),
  updated_at TIMESTAMP
);