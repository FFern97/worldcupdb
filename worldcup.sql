psql --username=freecodecamp --dbname=postgres

-- CREATES DATABASE named WOLRDCUP
  
CREATE DATABASE worldcup;

-- CONECTS TO DATABASE 
\c worldcup;


-- CREATES TABLE TEAMS
CREATE TABLE teams (team_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(50) NOT NULL UNIQUE);


-- CREATE TABLES GAMES
CREATE TABLE games (game_id SERIAL PRIMARY KEY NOT NULL, year INT NOT NULL, round VARCHAR(50) NOT NULL, 
winner_goals INT NOT NULL, opponent_goals INT NOT NULL, winner_id INT NOT NULL, opponent_id INT NOT NULL); 

-- ALTERS table games to ADD CONTRAINTS TO winner_id and opponent_id FOREIGN KEY

ALTER TABLE games 
  ADD CONSTRAINT fk_games_winner FOREIGN KEY (winner_id) REFERENCES teams (team_id); 
ALTER TABLE games 
  ADD CONSTRAINT fk_games_opponent FOREIGN KEY (opponent_id) REFERENCES teams (team_id);

