#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=usernames -t --no-align -c"
SECRET=$((RANDOM % 1001))
echo $SECRET

echo -e "\nEnter your username:"
read USERNAME

USERNAME_RESULT=$($PSQL "SELECT * FROM usernames WHERE username = '$USERNAME'")
if [[ $USERNAME_RESULT ]]
then
  echo "$USERNAME_RESULT" | while IFS="|" read USERNAME BEST_SCORE GAMES_PLAYED
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_SCORE guesses."
  done
else
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  USERNAME_RESULT=$($PSQL "INSERT INTO usernames(username, best_score, games_played) VALUES('$USERNAME', 0, 0)")
fi

echo -e "\nGuess the secret number between 1 and 1000:"

read GUESS
COUNT=1

while [[ ! $GUESS -eq $SECRET ]]
do
  while [[ ! $GUESS =~ ^[0-9]+$ ]]
  do
    echo -e "\nThat is not an integer, guess again:"
    read GUESS
  done
  if [[ $GUESS -gt $SECRET ]]
  then
    ((COUNT+=1))
    echo -e "\nIt's lower than that, guess again:"
    read GUESS
  elif [[ $GUESS -lt $SECRET ]]
  then
    ((COUNT+=1))
    echo -e "\nIt's higher than that, guess again:"
    read GUESS
  fi
done

BEST_SCORE=$($PSQL "SELECT best_score FROM usernames WHERE username = '$USERNAME'")

if [[ $BEST_SCORE -gt $COUNT ]]
then
  UPDATE_BEST_SCORE=$($PSQL "UPDATE usernames SET best_score = $COUNT WHERE username = '$USERNAME'")
elif [[ $BEST_SCORE = 0 ]]
then
  UDPATE_BEST_SCORE=$($PSQL "UPDATE usernames SET best_score = $COUNT WHERE username = '$USERNAME'")
fi

UPDATE_GAMES_PLAYED=$($PSQL "UPDATE usernames SET games_played = games_played + 1 WHERE username = '$USERNAME'")

echo -e "You guessed it in $COUNT tries. The secret number was $SECRET. Nice job!"

