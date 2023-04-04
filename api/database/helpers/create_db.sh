# Set the database name and credentials
DB_NAME="event_app"
DB_USER="zak"
DB_PASS="dadrock"

# Create the database and grant permissions to the user
psql -c "CREATE DATABASE $DB_NAME;"
psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_PASS';"
psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;"