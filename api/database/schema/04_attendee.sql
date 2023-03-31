DROP TABLE IF EXISTS attendee CASCADE;
CREATE TABLE attendee (
  id PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id),
  event_id INTEGER REFERENCES event(id),
  status VARCHAR(30) NOT NULL,
  created_at TIMESTAMP default now(),
  updated_at TIMESTAMP
);