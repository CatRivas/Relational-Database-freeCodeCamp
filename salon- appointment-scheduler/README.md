# Salon Appointment Scheduler

The main goal of this project was to create a Bash-based appointment scheduler that interacts directly with a PostgreSQL database.
Unlike my previous projects, this one required much more programming logic — handling user input, validating data, and dynamically querying the database — all from the command line.

## What Made It Interesting

This project was more challenging and interesting because it involved deeper logic implementation and real-time interaction with the database through sub-shells.
I learned how psql could be combined with xargs to clean and handle query outputs without needing to manually format them with regex — which made the process much cleaner.

Still, I ended up using regex for validating phone numbers and other user inputs. Even though I’m not a big fan of regex, it turned out to be very useful for ensuring proper input validation (for example, checking that a phone number matched the xxx-xxx-xxxx pattern).

Overall, this project helped me understand:

- How to manage user flow in Bash
- How sub-shells and SQL queries interact
- How to combine logic, validation, and database operations smoothly

## Files

- **salon.sql** – Full database dump (schema + data)

- **salon.sh** – Main Bash script that interacts with the user and manages appointments

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
CREATE DATABASE salon;
\q  # Exit psql

# Step 2: Restore schema + data from the dump file into the database
# Run this in your terminal (bash)
psql -U postgres -d salon < salon.sql

# Step 3: After restoring, you can run the script
./salon.sh
