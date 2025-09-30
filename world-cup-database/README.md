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

Follow these steps to recreate the database from `worldcup.sql`, that is a **full database dump**, so running the commands below will restore **both schema and data**:

> **Prerequisites:**  
> Make sure you have PostgreSQL installed and available in your PATH.  

```bash
# Step 1: Create the database (only the first time)
# Open the Postgres CLI (psql)
psql -U postgres

# Inside psql, create the database
CREATE DATABASE worldcup;
\q  # Exit psql

# Step 2: Restore schema + data from the dump file into the database
# Run this in your terminal (bash)
psql -U postgres -d worldcup < worldcup.sql
