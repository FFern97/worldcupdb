chmod +x insert_data.sh
./insert_data.sh


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then

    
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");
    if [[ -z $WINNER_ID ]]
    then 
      $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi

  #----------------------------  
    
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'");
    if [[ -z $OPPONENT_ID ]]
    then 
      $($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')") 
    fi
  fi
done

# ./insert_data.sh test 
