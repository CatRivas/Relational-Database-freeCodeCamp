#! /bin/bash

# Variable with PostgreSQL command for database interaction
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# BANNER
echo -e "~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  # Display a message if one is passed as argument
  if [[ $1 ]] 
  then
    echo -e "\n$1"
  fi

  # WELCOME MESSAGE
  echo -e "Welcome to My Salon, how can I help you?\n"

  # all available services from the database
  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")

  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo -e "$SERVICE_ID) $NAME"
  done
  
  read SERVICE_ID_SELECTED
  
  # validate that the input is a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Please enter a valid service number." 
  fi

  # check if the selected service exists in the database
  SERVICE_ID_RESULT=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # if service doesn't exist, reload menu
  if [[ -z $SERVICE_ID_RESULT ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # gooo to appointment menu
    APPOINTMENT_AGENDA_MENU $SERVICE_ID_SELECTED
  fi
}


APPOINTMENT_AGENDA_MENU() {
  SERVICE_ID_SELECTED=$1

  # ask for customer's phone 
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # validate phone number format: xxx-xxx-xxxx
  while [[ ! $CUSTOMER_PHONE =~ ^[0-9]{3}-[0-9]{3}-[0-9]{4}$ ]]
  do
    echo "Invalid format. Please enter again (e.g., 555-123-4567):"
    read CUSTOMER_PHONE
  done

  # check if customer already exists
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  # if customer doesn't exist, register a new one
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # insert new customer into database
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    
    # get new customer's ID (this is crucial)
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi

  # get customer's name
  CUSTOMER_NAME_RESULT=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
  
  # get selected service name
  SERVICE_NAME_RESULT=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # trim extra spaces returned by psql with xargs (awesome!)
  CUSTOMER_NAME_RESULT=$(echo $CUSTOMER_NAME_RESULT | xargs)
  SERVICE_NAME_RESULT=$(echo $SERVICE_NAME_RESULT | xargs)

  # ask for appointment time
  echo -e "\nWhat time would you like your $SERVICE_NAME_RESULT, $CUSTOMER_NAME_RESULT?"
  read SERVICE_TIME

  # validate that time is not empty
  while [[ -z $SERVICE_TIME ]]
  do
    echo -e "You must provide a time to schedule your appointment."    
    read SERVICE_TIME
  done  

  # insert appointment into database
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # BYE BYE MESSAGE
  echo -e "\nI have put you down for a $SERVICE_NAME_RESULT at $SERVICE_TIME, $CUSTOMER_NAME_RESULT."
}


MAIN_MENU
