#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Capture first cli argument
ARGUMENT="$1"

# Check if an argument was provided
if [ -z "$ARGUMENT" ] 
then
  echo "Please provide an element as an argument."
  exit  
fi
  
# Checking the argument type 
if [[ $ARGUMENT =~ ^[0-9]+$ ]]; then
  # Is an atomic number
  ATOMIC_NUMBER_ELEMENT="SELECT atomic_number FROM elements WHERE atomic_number=$ARGUMENT;"
elif [[ $ARGUMENT =~ ^[A-Z][a-z]?$ ]]; then
  # Is a chemical symbol
  ATOMIC_NUMBER_ELEMENT="SELECT atomic_number FROM elements WHERE symbol='$ARGUMENT';"
elif [[ $ARGUMENT =~ ^[A-Za-z]+$ ]]; then
  # Is an element name
  ATOMIC_NUMBER_ELEMENT="SELECT atomic_number FROM elements WHERE name='$ARGUMENT';"
fi


# Execute the query and store the atomic_number
ATOMIC_NUMBER_RESULT=$($PSQL "$ATOMIC_NUMBER_ELEMENT")

# Check if no result was found
if [[ -z $ATOMIC_NUMBER_RESULT ]]
then
  echo "I could not find that element in the database."
else
  # Fetching all the data 
  ELEMENT_INFO_RESULT=$($PSQL "
    SELECT e.name, e.symbol, t.type, p.atomic_mass, 
           p.melting_point_celsius, p.boiling_point_celsius
    FROM elements e 
    JOIN properties p USING(atomic_number) 
    JOIN types t USING(type_id) 
    WHERE atomic_number=$ATOMIC_NUMBER_RESULT;")
  
  # Split the output into separate variables 
  IFS='|' read -r NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$ELEMENT_INFO_RESULT"

  # Final message
  echo "The element with atomic number $ATOMIC_NUMBER_RESULT is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius." 
fi
