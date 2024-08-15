psql --username=freecodecamp --dbname=postgres

CREATE DATABASE worldcup;

\c worldcup;

CREATE TABLE teams (team_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(50) NOT NULL UNIQUE);

CREATE TABLE games (game_id SERIAL PRIMARY KEY NOT NULL, year INT NOT NULL, round VARCHAR(50) NOT NULL, 
winner_goals INT NOT NULL, opponent_goals INT NOT NULL, winner_id INT NOT NULL, opponent_id INT NOT NULL); 
