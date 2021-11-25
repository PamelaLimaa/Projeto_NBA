Drop database if exists NBA;

create database NBA;

USE NBA;

CREATE TABLE TEAM(
	LEAGUE_ID INT,
	TEAM_ID INT,
	MIN_YEAR INT,
	MAX_YEAR INT,
	ABBREVIATION VARCHAR(3),
	NICKNAME VARCHAR(10),
	YEARFOUNDED VARCHAR(4),
	CITY VARCHAR(20),
	ARENA VARCHAR(20),
	ARENACAPACITY INT,
	`OWNER` VARCHAR(20),
	GENERALMANAGER VARCHAR(20),	
	HEADCOACH VARCHAR(20),
	DLEAGUEAFFILIATION VARCHAR(30),
    PRIMARY KEY (TEAM_ID)
);

CREATE TABLE PLAYER(
	PLAYER_NAME VARCHAR(40),
	TEAM_ID INT,
	PLAYER_ID INT,
    SEASON INT,
    PRIMARY KEY (PLAYER_ID),
    CONSTRAINT FK_TeamPlayer FOREIGN KEY (TEAM_ID) REFERENCES TEAM(TEAM_ID)
);

CREATE TABLE RANKING(
	TEAM_ID INT,
	LEAGUE_ID INT,
    SEASON_ID INT,
    STANDINGSDATE DATE,
    CONFERENCE VARCHAR(5),
    TEAM VARCHAR(20),
    G INT,
    W INT,
    L INT,
    W_PCT FLOAT,
    HOME_RECORD VARCHAR(7),
    ROAD_RECORD VARCHAR(7),
    CONSTRAINT FK_TeamRanking FOREIGN KEY (TEAM_ID) REFERENCES TEAM(TEAM_ID)
);

CREATE TABLE GAMES(
	GAME_DATE_EST DATE,
    GAME_ID INT,
    GAME_STATUS_TEXT VARCHAR(10),
	HOME_TEAM_ID INT,
    VISITOR_TEAM_ID INT,
    SEASON INT,
	TEAM_ID_home INT,
    PTS_home INT,
    FG_PCT_home DOUBLE,
    FT_PCT_home DOUBLE,
    FG3_PCT_home DOUBLE,
    AST_home INT,
    REB_home INT,
    TEAM_ID_away INT,
    PTS_away INT,
    FG_PCT_away DOUBLE,
    FT_PCT_away DOUBLE,
    FG3_PCT_away DOUBLE,
    AST_away INT,
    HOME_TEAM_WINS TINYINT,
    PRIMARY KEY (GAME_ID),
    CONSTRAINT FK_HomeTeamGames FOREIGN KEY (HOME_TEAM_ID) REFERENCES TEAM (TEAM_ID),
    CONSTRAINT FK_VisitorTeamGames FOREIGN KEY (VISITOR_TEAM_ID) REFERENCES TEAM (TEAM_ID),
    CONSTRAINT FK_TeamHomeGames FOREIGN KEY (TEAM_ID_home) REFERENCES TEAM (TEAM_ID),
    CONSTRAINT FK_TeamAwayGames FOREIGN KEY (TEAM_ID_away) REFERENCES TEAM (TEAM_ID)
);

CREATE TABLE GAMES_DETAILS(
    GAME_ID INT,
    TEAM_ID INT,
    TEAM_ABBREVIATION VARCHAR(5),
    TEAM_CITY VARCHAR(20),
	PLAYER_ID INT,
    PLAYER_NAME VARCHAR(40),
    START_POSITION VARCHAR(5),
    `COMMENT` TEXT,
    `MIN` TIME,
    FGM DOUBLE,
    FGA DOUBLE,
    FG_PCT DOUBLE,
    FG3M DOUBLE,
    FG3A DOUBLE,
    FG3_PCT DOUBLE,
    FTM DOUBLE,
    FTA DOUBLE,
    FT_PCT DOUBLE,
    OREB DOUBLE,
    DREB DOUBLE,
    REB DOUBLE,
    AST DOUBLE,
    STL DOUBLE,
    BLK DOUBLE,
    `TO` DOUBLE,
    PF DOUBLE,
    PTS DOUBLE,
    PLUS_MINUS DOUBLE,
    CONSTRAINT FK_GameDetailsGames FOREIGN KEY (GAME_ID) REFERENCES GAMES (GAME_ID),
    CONSTRAINT FK_GameDetailsTeams FOREIGN KEY (TEAM_ID) REFERENCES TEAM (TEAM_ID),
    CONSTRAINT FK_GameDetailsPlayer FOREIGN KEY (PLAYER_ID) REFERENCES PLAYER (PLAYER_ID)
);

LOAD DATA LOCAL INFILE "c:/NBA/teams.csv" 
INTO TABLE TEAM 
FIELDS TERMINATED by ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "c:/NBA/players.csv" 
INTO TABLE PLAYER 
FIELDS TERMINATED by ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "c:/NBA/ranking.csv" 
INTO TABLE RANKING 
FIELDS TERMINATED by ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "c:/NBA/games.csv" 
INTO TABLE GAMES 
FIELDS TERMINATED by ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "c:/NBA/games_details.csv" 
INTO TABLE GAMES_DETAILS 
FIELDS TERMINATED by ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
