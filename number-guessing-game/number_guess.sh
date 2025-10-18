#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

## USER SECTION
# Validate that the username is not empty 
#while true
#do
#  echo "Enter your username:" 
#  read USERNAME
#
#  USERNAME=$(echo "$USERNAME" | xargs)
#  if [[ -z "$USERNAME" ]]; then
#    continue
#  fi
#
#  break
#done

echo "Enter your username:" 
read USERNAME

# Fetch user info if it exists
USER_INFO_RESULT=$($PSQL "SELECT user_id, username, COUNT(*) AS games_played, MIN(guesses) AS best_game   
FROM users
JOIN games 
USING (user_id)
WHERE username = '$USERNAME'
GROUP BY user_id")

# Check if the user exists or not
if [[ -z $USER_INFO_RESULT ]]
then 
  echo "Welcome, $USERNAME! It looks like this is your first time here." 
  # Insert new user into the database
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")  
  # Fetch the new user's ID
  USER_ID_RESULT=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
else
  # If user already exists, read their data from the query 
  IFS='|' read -r USER_ID_RESULT DB_USERNAME GAMES_PLAYED BEST_GAME <<< "$USER_INFO_RESULT"
  
  echo "Welcome back, $DB_USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


## GAME SECTION
# Function to validate user input
validate_input() {
  while true
  do
    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:" 
      read GUESS
      continue
    fi
  
    # Validate that the number is within the range
    # if (( GUESS < 1 || GUESS > 1000 )); then
    #   echo "The secret number must be between 1 and 1000, guess again:" 
    #   read GUESS
    #   continue
    # fi   
    break
  done
}

# Start game
echo "Guess the secret number between 1 and 1000:" 
read GUESS

validate_input

# Generate a random number between 1 and 1000
RANDOM_NUM=$((RANDOM % 1000 + 1))
# echo "Debug: $RANDOM_NUM"

# Counter for the number of guesses
GUESSES=1

# Main game loop
while [ $GUESS -ne $RANDOM_NUM ]
do
  ((GUESSES++))

  if [[ $GUESS -gt $RANDOM_NUM ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi 

  read GUESS
  validate_input
done

# Record the game results in the games table
INSERT_NEW_GUESSES=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID_RESULT, $GUESSES)")

# Final output
echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUM. Nice job!"
