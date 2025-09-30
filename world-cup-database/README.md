# World Cup Database

This project follows the database schema and step-by-step instructions provided by freeCodeCamp.  
The goal was to practice SQL queries, Bash scripting, and database manipulation, so there was little room for creativity.

## Files
- **worldcup.sql** – Full database dump (schema + data)
- **insert_data.sh** – Bash script to populate the database from `games.csv`
- **queries.sh** – Script with the required SQL queries to retrieve data

## Tech Stack
- PostgreSQL  
- Bash  

## Recreate the Database

`worldcup.sql` is a **full database dump**, so running the commands below will restore **both schema and data**:

```bash
# Step 1: Create the database (only needs to be done once and it's a must)
createdb worldcup

# Step 2: Restore schema + data from the dump file into the newly created database
psql -U postgres -d worldcup < worldcup.sql
