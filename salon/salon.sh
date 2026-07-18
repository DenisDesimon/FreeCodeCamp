#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo "~~~~~ MBAPPE SALON ~~~~~"
echo "Welcome to Mbappe salon, how can i help you?"

while true
do
  echo "$($PSQL "SELECT service_id || ') ' || name from services")"

  read SERVICE_ID_SELECTED

  SERVICENAME=$($PSQL "SELECT name from services WHERE service_id='$SERVICE_ID_SELECTED'" )
  if [[ -n $SERVICENAME ]]
  then
    break
  fi
done


echo "What's your phone number?"
read CUSTOMER_PHONE

CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE'" )

if [[ -z $CUSTOMER_ID ]]
then
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  CUSTOMER_ID=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME') RETURNING customer_id" | head -1 | xargs)
else 
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID" )
fi

echo "What time would you like your cut, $CUSTOMER_NAME?"
read SERVICE_TIME
$PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"
echo "I have put you down for a $SERVICENAME at $SERVICE_TIME, $CUSTOMER_NAME."