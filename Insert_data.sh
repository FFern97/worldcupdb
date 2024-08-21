chmod +x insert_data.sh
./insert_data.sh


#--------------------------
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then

    
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");
    if [[ -z $WINNER_ID ]]
    then 
      echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi

  #----------------------------  
    
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'");
    if [[ -z $OPPONENT_ID ]]
    then 
      echo $($PSQL "INSERT INTO teams(name) WHERE VALUES ('$OPPONENT')") 
    fi


#--------------------------
     echo $($PSQL "INSERT INTO games(winner_id, opponent_id, winner_goals, opponent_goals, year, round) VALUES ($WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS, $YEAR, '$ROUND')")


  fi
done


