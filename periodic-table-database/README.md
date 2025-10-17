# Periodic Table Database

The main goal of this project was to create a PostgreSQL database based on specific requirements and then query it through a Bash script.
It was a straightforward project in terms of creativity, but it served as a solid exercise in both database logic and Bash scripting.

## What Made It Interesting

Even though the project seemed simple at first, I found it interesting because it required minimizing database queries to improve performance — something that made me think more carefully about efficiency and how Bash interacts with PostgreSQL.
It also reminded me how command-line arguments work — a concept I had previously used in Python but don’t often practice.
This project also helped me refresh my Bash syntax knowledge and apply several PostgreSQL functions I hadn’t used in a while.
Also I had the chance to practice Git. Basically I could have worked directly on the main branch, but I created a new one to implement the script — which gave me the chance to use commands I don’t usually need when working solo, like rebase (which honestly still intimidates me a little, but it was a good learning experience).

## Files

- **periodic_table.sql** – Full database dump (schema + data)

- **elements.sh** – Bash script that queries the database based on user input
## Tech Stack

- PostgreSQL
- Bash

> **Prerequisites:**  
> Make sure you have PostgreSQL installed and available in your PATH.  

```bash
# Step 1: Create the database (only the first time)
# Open the Postgres CLI (psql)
psql -U postgres

# Inside psql, create the database
CREATE DATABASE periodic_table;
\q  # Exit psql

# Step 2: Restore schema + data from the dump file into the database
# Run this in your terminal (bash)
psql -U postgres -d periodic_table < periodic_table.sql

# Step 3: Run the script
./elements.sh <argument>
