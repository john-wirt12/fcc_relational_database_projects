#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_RESULT=$($PSQL "SELECT * FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number = $1")
else
  ELEMENT_RESULT=$($PSQL "SELECT * FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE elements.name = '$1' OR elements.symbol = '$1'")
fi


if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
elif [[ -z $ELEMENT_RESULT ]]
then
  echo "I could not find that element in the database."
else
  echo $ELEMENT_RESULT | while IFS="|" read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELT_CEL BOIL_CEL SYMBOL NAME TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_CEL celsius and a boiling point of $BOIL_CEL celsius."
  done
fi


