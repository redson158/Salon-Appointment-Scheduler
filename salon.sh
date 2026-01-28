#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~ Welcome to the Salon! ~~~"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "\nWhat service would you like today?"
  SERVICES=$($PSQL "SELECT service_id || ') ' || name FROM services ORDER BY service_id")
  echo "$SERVICES"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) HAIR_CUT_MENU ;;
    2) COLOR_MENU ;;
    3) MANICURE_MENU ;;
    4) STYLE_MENU ;;
    5) TRIM_MENU ;;
    *) MAIN_MENU "Please enter a valid option" ;;
  esac
}

HAIR_CUT_MENU(){
  # get phone number
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  # check if associated with customer
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # adds new customer if needed
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nThere is no existing account under that number. What is your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
  # get time
  echo -e "\nWhat time would you like your hair cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  # add to appointments
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 1, '$SERVICE_TIME')")
  # confirmation
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = 1")
  echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME. Thank you!"
}

COLOR_MENU(){
  # get phone number
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  # check if associated with customer
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # adds new customer if needed
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nThere is no existing account under that number. What is your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
  # get time
  echo -e "\nWhat time would you like your hair color, $CUSTOMER_NAME?"
  read SERVICE_TIME
  # add to appointments
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 2, '$SERVICE_TIME')")
  # confirmation
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = 2")
  echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME. Thank you!"
}

MANICURE_MENU(){
  # get phone number
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  # check if associated with customer
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # adds new customer if needed
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nThere is no existing account under that number. What is your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
  # get time
  echo -e "\nWhat time would you like your manicure, $CUSTOMER_NAME?"
  read TIME
  # add to appointments
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 3, '$SERVICE_TIME')")
  # confirmation
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = 3")
  echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME. Thank you!"
}

STYLE_MENU(){
  # get phone number
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  # check if associated with customer
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # adds new customer if needed
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nThere is no existing account under that number. What is your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
  # get time
  echo -e "\nWhat time would you like your style appointment, $CUSTOMER_NAME?"
  read SERVICE_TIME
  # add to appointments
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 4, '$SERVICE_TIME')")
  # confirmation
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = 4")
  echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME. Thank you!"
}

TRIM_MENU(){
  # get phone number
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  # check if associated with customer
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # adds new customer if needed
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nThere is no existing account under that number. What is your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
  # get time
  echo -e "\nWhat time would you like your trim, $CUSTOMER_NAME?"
  read SERVICE_TIME
  # add to appointments
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 5, '$SERVICE_TIME')")
  # confirmation
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = 5")
  echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME. Thank you!"
}

MAIN_MENU