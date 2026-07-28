#!/bin/bash

SECRET_NUMBER=$((RANDOM % 1000 + 1))
COUNT=0

echo $SECRET_NUMBER

PSQL="psql --username=freecodecamp --dbname=number_guess  --no-align --tuples-only -c"

echo Enter your username:
read USERNAME

USER_INFO=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]] 
then
  echo -e "\n Welcome, $USERNAME! It looks like this is your first time here."
  GAMES_PLAYED=0
  BEST_GAME=100000
  USER_ID=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME') RETURNING user_id" | head -1 | xargs)
else
  IFS="|" read -r USER_ID GAMES_PLAYED BEST_GAME   <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\n Guess the secret number between 1 and 1000:"

while true
do
read CUR_GUESS
if ! [[ $CUR_GUESS =~ ^[0-9]+$ ]]
then 
  echo "That is not an integer, guess again:"
  continue
fi
(( COUNT++ ))
if [[ $CUR_GUESS -eq $SECRET_NUMBER ]]
then
  echo "You guessed it in $COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
  NEW_BEST_GAME=$(( $BEST_GAME < $COUNT ? $BEST_GAME : $COUNT ))
  NEW_GAMES_PLAYED=$(( GAMES_PLAYED + 1))
  RES=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED, best_game=$NEW_BEST_GAME WHERE user_id=$USER_ID")
  break
elif [[ $CUR_GUESS -gt $SECRET_NUMBER ]]
then
  echo "It's lower than that, guess again:"
else
  echo "It's higher than that, guess again:"
fi
done
