#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Limpiar la tabla antes de procesar el CSV
$PSQL "TRUNCATE TABLE teams, games RESTART IDENTITY;"



tail -n +2 games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS  
do 
  # Limpiar espacios alrededor de cada campo
  YEAR=$(echo "$YEAR" | sed 's/^ *//;s/ *$//')
  ROUND=$(echo "$ROUND" | sed 's/^ *//;s/ *$//')
  WINNER=$(echo "$WINNER" | sed 's/^ *//;s/ *$//')
  OPPONENT=$(echo "$OPPONENT" | sed 's/^ *//;s/ *$//')
  WINNER_GOALS=$(echo "$WINNER_GOALS" | sed 's/^ *//;s/ *$//')
  OPPONENT_GOALS=$(echo "$OPPONENT_GOALS" | sed 's/^ *//;s/ *$//')

  WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
  OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
  
  echo $WINNER_ID $OPPONENT_ID
  
  if [[ -z $WINNER_ID ]]
  then
      $PSQL "INSERT INTO teams (name) values ('$WINNER')"
      WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
  fi

  if [[ -z $OPPONENT_ID ]]
  then
      $PSQL "INSERT INTO teams (name) values ('$OPPONENT')"
      OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
      
  fi

  $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)"

done  

