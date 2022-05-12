CREATE TABLE Team_Details (
	SI_No SERIAL,
	Team_Name VARCHAR(30) NOT NULL,
	Captain VARCHAR(20) NOT NULL,
	Owner VARCHAR(20),
	Home_Ground VARCHAR(30),
	Dummy_Column SERIAL,
	PRIMARY KEY(team_name)
)

COPY Team_Details FROM 'C:\Users\smriti8\Downloads\Team_Details.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM Team_Details;
SELECT COUNT(Team_name) FROM Team_Details;

CREATE TABLE Fixtures (
	Match_Number INT,
	Home_Team VARCHAR(30),
	Away_Team VARCHAR(30),
	Venue VARCHAR(20),
	Team_Won VARCHAR(30),
	Team_Lost VARCHAR(30),
	Dummy_Column SERIAL,
	PRIMARY KEY(match_number)
)

COPY Fixtures FROM 'C:\Users\smriti8\Downloads\Fixtures.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM Fixtures;
SELECT count(match_number) FROM Fixtures;
SELECT * FROM Fixtures WHERE Home_Team = 'RCB' AND Venue = 'Bangalore';
SELECT Team_Lost FROM Fixtures WHERE Venue = 'Kolkata'

CREATE TABLE Points (
	Team_Name VARCHAR(30),
	No_Of_Wins INT,
	No_of_Losses INT,
	Points INT,
	PRIMARY KEY(team_name),
	CONSTRAINT fk_teamDetails FOREIGN KEY(team_name) REFERENCES team_details(team_name)
)

SELECT Team_won, count(*) FROM Fixtures GROUP BY team_won;
SELECT Team_lost, count(*) FROM Fixtures GROUP BY team_lost;

INSERT INTO points (Team_name, No_Of_Wins, No_of_Losses, Points) SELECT f.Team_name, f.Team_won, count(*) FROM Fixtures f GROUP BY team_won;

