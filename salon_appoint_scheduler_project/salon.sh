#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "~~~ Welcome to Ballard's ~~~"
echo -e "\nPlease select a service\n"

SERVICES() {
  SERVICES_OFFERED=$($PSQL "SELECT * FROM services")
  echo "$SERVICES_OFFERED" | while IFS="|" read SERVICE_ID SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
}

SERVICES

read SERVICE_ID_SELECTED

while [[ ! $SERVICE_ID_SELECTED =~ ^[123]$ ]]
do
  SERVICES
  read SERVICE_ID_SELECTED
done

echo -e "\nWhat is your phone number?"
read CUSTOMER_PHONE
CUSTOMER_PHONE_RESULT=$($PSQL "SELECT name, phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ $CUSTOMER_PHONE_RESULT ]]
then
  echo "$CUSTOMER_PHONE_RESULT" | while IFS="|" read NAME PHONE
  do
    echo -e "\nWelcome back $NAME! We have you saved under the number: $PHONE."
  done
else
  echo -e "\nIt appears you are a new customer! Please tell us your name..."
  read CUSTOMER_NAME
  CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  echo -e "\nWelcome $CUSTOMER_NAME! We have now saved you under the number: $CUSTOMER_PHONE."
fi

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

echo -e "\nWhat time would you like your appointment to be (ex. 12pm)?"
read SERVICE_TIME
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."

