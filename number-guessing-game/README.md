# Number Guessing Game

The main goal of this project was to build a number guessing game that stores user data and game statistics in a PostgreSQL database, while interacting with it through a Bash script.
At first glance, it might look simple — but it quickly becomes a great exercise in logic, Bash scripting, and database interaction.

## What Made It Interesting

Even though it seemed like a straightforward task, this project kept me fully engaged, thinking about how to make the logic as clean and efficient as possible.
The experience I had from previous Bash projects definitely helped me move around faster this time.

There was also some creativity involved in how I designed the database schema and implemented the game logic inside the script.

I decided not to follow a fully modular approach, since it didn’t make much sense for a small script, but I did implement a reusable validation function to keep the code more DRY and readable.

## Problems with passing FCC tests
What really made it challenging was passing all the FreeCodeCamp tests.
Two tests in particular gave me trouble:

- When an existing username is entered, the script should print:
Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.

- When the secret number is guessed, the script should print:
You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!

After debugging, reading the FreeCodeCamp forums, and comparing solutions, I discovered a few issues:
**The forum said the program should end with the last output and I had placed the INSERT into the game table after the final output instead of before, so I moved it earlier.**
**I also remembered that some automated tests have execution time limits, which means that fewer validations can make the script run more smoothly. So, I removed a few extra checks I had added (like verifying if the username was empty or if the number was within range), and after that, the script finally passed all the tests.**

Overall this project gave me some good practice in debugging and patience.

## Files
- **number_guess.sql** – Full database dump (schema + data)
- **number_guess.sh** – Bash script that runs the interactive game

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
CREATE DATABASE number_guess;
\q  # Exit psql

# Step 2: Restore schema + data from the dump file into the database
# Run this in your terminal (bash)
psql -U postgres -d number_guess < number_guess.sql

# Step 3: Run the script
./number_guess.sh
