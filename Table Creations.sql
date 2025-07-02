-- Team 4
-- Alex Navarrete
-- ITEC 3200 Summer 2025
-- Semester Project, Part 2 ddl/dml

DROP SCHEMA IF EXISTS Section1_Team4;
CREATE SCHEMA Section1_Team4;
USE Section1_Team4;

CREATE TABLE ASSOCIATION_FEDERATION(
Association_Federation_ID INT,
Association_Federation_Name VARCHAR(45),
Association_Federation_President VARCHAR(45),
CONSTRAINT PRIMARY KEY(Association_Federation_ID));
INSERT INTO ASSOCIATION_FEDERATION VALUES (1, 'Royal Spanish Football Federation', 'Rafael Louzan');
INSERT INTO ASSOCIATION_FEDERATION VALUES (2, 'The Football Association', 'Mark Bullingham');
INSERT INTO ASSOCIATION_FEDERATION VALUES (3, 'United States Soccer Federation', 'Cindy Parlow');
INSERT INTO ASSOCIATION_FEDERATION VALUES (4, 'French Football Federation', 'Phelippe Diallo');
INSERT INTO ASSOCIATION_FEDERATION VALUES (5, 'German Football Association', 'Bernd Neuendorf');
INSERT INTO ASSOCIATION_FEDERATION VALUES (6, 'Mexican Football Association', 'Rafael Louzan');
INSERT INTO ASSOCIATION_FEDERATION VALUES (7, 'Saudi Arabian Football Federation', 'Yasser Al-Misehal');
SELECT * FROM ASSOCIATION_FEDERATION;

CREATE TABLE LEAGUE(
League_ID INT,
League_Name VARCHAR(45),
League_President VARCHAR(45),
League_Founded DATE,
Association_Federation_ID INT,
CONSTRAINT PRIMARY KEY(League_ID),
CONSTRAINT FOREIGN KEY(Association_Federation_ID) REFERENCES ASSOCIATION_FEDERATION(Association_Federation_ID));
INSERT INTO LEAGUE VALUES (1111, 'La Liga', 'Javier Medrano', '1929-02-05', 1);
INSERT INTO LEAGUE VALUES (2222, 'Premier League', 'Richard Masters', '1992-05-27', 2);
INSERT INTO LEAGUE VALUES (3333, 'Major League Soccer', 'Don Garber', '1993-12-17', 3);
INSERT INTO LEAGUE VALUES (4444, 'Ligue 1', 'Vincent Labrune', '1932-09-11', 4);
INSERT INTO LEAGUE VALUES (5555, 'Bundesliga', 'Reinhard Rauball', '1962-07-28', 5);
INSERT INTO LEAGUE VALUES (6666, 'Liga MX', 'Mikel Arriola', '1943-10-17', 6);
INSERT INTO LEAGUE VALUES (7777, 'Saudi Pro League', 'Omar Mugharbel', '1976-05-16', 7);
SELECT * FROM League;

--

-- Team Information 
CREATE TABLE Team (
	TeamID INT,
    Team_Name VARCHAR(45), 
    Team_Coach VARCHAR(45),
    Team_Players INT, 
    Team_Wins INT,
    Team_Losses INT, 
    Team_Ties INT, 
    Team_Trophies INT, 
    League_ID INT,
	CONSTRAINT PRIMARY KEY (TeamID),
    CONSTRAINT FOREIGN KEY(League_ID) REFERENCES LEAGUE(League_ID));

-- Adding Data into Teams
INSERT INTO Team VALUES (1, 'Atlanta United', 'Ronny Deila', 18, 201, 103, 32, 4, 3333);
INSERT INTO Team VALUES (2, 'LA Galaxy', 'Greg Vanney', 20, 185, 90, 30, 5, 3333);
INSERT INTO Team VALUES (3, 'New York Red Bulls', 'Troy Lesesne', 19, 175, 95, 25, 3, 3333);
INSERT INTO Team VALUES (4, 'Seattle Sounders', 'Brian Schmetzer', 21, 210, 80, 35, 6, 3333);
INSERT INTO Team VALUES (5, 'Toronto FC', 'John Herdman', 17, 160, 100, 28, 2, 3333);
INSERT INTO Team VALUES (6, 'Inter Miami', 'Gerardo Martino', 18, 145, 110, 22, 1, 3333);
INSERT INTO Team VALUES (7, 'Chicago Fire', 'Frank Klopas', 19, 170, 105, 27, 3, 3333);
SELECT * FROM Team ;


-- Player Information
CREATE TABLE Player (
	PlayerID INT, 
	First_Name VARCHAR(45),
    Last_Name VARCHAR(45),
    Player_Goals INT, 
    Player_Assists INT,
    Player_Position VARCHAR(45), 
    Player_Nationality VARCHAR(45),
    Player_Yellows INT, 
    Player_Reds INT, 
    TeamID INT,
    CONSTRAINT PRIMARY KEY (PlayerID),
    CONSTRAINT FOREIGN KEY (TeamID) REFERENCES team(TeamID));

-- Atlanta United Players
INSERT INTO Player VALUES (101, 'Thiago', 'Almada', 10, 12, 'Midfielder', 'Argentina', 4, 0, 1);
INSERT INTO Player VALUES (102, 'Miles', 'Robinson', 2, 1, 'Defender', 'USA', 5, 0, 1);
INSERT INTO Player VALUES (103, 'Brad', 'Guzan', 0, 0, 'Goalkeeper', 'USA', 1, 0, 1);
INSERT INTO Player VALUES (104, 'Brooks', 'Lennon', 3, 7, 'Right Back', 'USA', 3, 0, 1);
INSERT INTO Player VALUES (105, 'Giorgos', 'Giakoumakis', 14, 4, 'Striker', 'Greece', 2, 1, 1);
INSERT INTO Player VALUES (106, 'Caleb', 'Wiley', 1, 3, 'Left Back', 'USA', 2, 0, 1);
INSERT INTO Player VALUES (107, 'Franco', 'Ibarra', 1, 2, 'Defensive Mid', 'Argentina', 6, 1, 1);
INSERT INTO Player VALUES (108, 'Luis', 'Araújo', 5, 6, 'Winger', 'Brazil', 4, 0, 1);
INSERT INTO Player VALUES (109, 'Matheus', 'Rossetto', 1, 4, 'Midfielder', 'Brazil', 3, 0, 1);
INSERT INTO Player VALUES (110, 'Andrew', 'Gutman', 2, 1, 'Left Back', 'USA', 5, 0, 1);  
SELECT * FROM Player WHERE TeamID =1;

-- LA Gaxay Players
INSERT INTO Player VALUES (201, 'Riqui', 'Puig', 6, 8, 'Midfielder', 'Spain', 3, 0, 2);
INSERT INTO Player VALUES (202, 'Javier', 'Hernández', 15, 2, 'Striker', 'Mexico', 2, 1, 2);
INSERT INTO Player VALUES (203, 'Douglas', 'Costa', 4, 6, 'Winger', 'Brazil', 4, 0, 2);
INSERT INTO Player VALUES (204, 'Jonathan', 'Bond', 0, 0, 'Goalkeeper', 'England', 1, 0, 2);
INSERT INTO Player VALUES (205, 'Julian', 'Araujo', 1, 3, 'Right Back', 'Mexico', 5, 0, 2);
INSERT INTO Player VALUES (206, 'Gastón', 'Brugman', 2, 4, 'Midfielder', 'Uruguay', 2, 0, 2);
INSERT INTO Player VALUES (207, 'Martin', 'Cáceres', 1, 1, 'Defender', 'Uruguay', 3, 1, 2);
INSERT INTO Player VALUES (208, 'Mark', 'Delgado', 2, 5, 'Midfielder', 'USA', 3, 0, 2);
INSERT INTO Player VALUES (209, 'Chris', 'Mavinga', 0, 0, 'Center Back', 'France', 4, 0, 2);
INSERT INTO Player VALUES (210, 'Dejan', 'Joveljić', 10, 3, 'Forward', 'Serbia', 2, 0, 2);
SELECT * FROM Player WHERE TeamID = 2;

-- New York Red Bulls
INSERT INTO Player VALUES (301, 'Lewis', 'Morgan', 9, 4, 'Winger', 'Scotland', 2, 0, 3);
INSERT INTO Player VALUES (302, 'Carlos', 'Coronel', 0, 0, 'Goalkeeper', 'Paraguay', 1, 0, 3);
INSERT INTO Player VALUES (303, 'Sean', 'Nealis', 1, 1, 'Defender', 'USA', 3, 0, 3);
INSERT INTO Player VALUES (304, 'Frankie', 'Amaya', 3, 5, 'Midfielder', 'USA', 4, 0, 3);
INSERT INTO Player VALUES (305, 'Dru', 'Yearwood', 2, 3, 'Midfielder', 'England', 2, 1, 3);
INSERT INTO Player VALUES (306, 'Andrés', 'Reyes', 2, 0, 'Center Back', 'Colombia', 5, 0, 3);
INSERT INTO Player VALUES (307, 'John', 'Tolkien', 1, 6, 'Left Back', 'USA', 3, 0, 3);
INSERT INTO Player VALUES (308, 'Tom', 'Barlow', 7, 1, 'Striker', 'USA', 2, 0, 3);
INSERT INTO Player VALUES (309, 'Cristian', 'Cásseres', 2, 7, 'Midfielder', 'Venezuela', 3, 0, 3);
INSERT INTO Player VALUES (310, 'Elias', 'Manel', 5, 2, 'Forward', 'Brazil', 2, 0, 3);
SELECT * FROM Player WHERE TeamID= 3;

-- Seattle Sounders Players
INSERT INTO Player VALUES (401, 'Jordan', 'Morris', 12, 8, 'Forward', 'USA', 3, 0, 4);
INSERT INTO Player VALUES (402, 'Nicolás', 'Lodeiro', 7, 12, 'Midfielder', 'Uruguay', 4, 0, 4);
INSERT INTO Player VALUES (403, 'Xavier', 'Arreaga', 1, 2, 'Defender', 'Ecuador', 5, 0, 4);
INSERT INTO Player VALUES (404, 'Stefan', 'Freitag', 0, 1, 'Defender', 'New Zealand', 2, 0, 4);
INSERT INTO Player VALUES (405, 'Raúl', 'Ruidíaz', 15, 3, 'Striker', 'Peru', 3, 1, 4);
INSERT INTO Player VALUES (406, 'Andy', 'Rose', 2, 5, 'Midfielder', 'England', 4, 0, 4);
INSERT INTO Player VALUES (407, 'Brad', 'Smith', 0, 4, 'Left Back', 'Australia', 3, 0, 4);
INSERT INTO Player VALUES (408, 'Alphonso', 'Davies', 6, 7, 'Winger', 'Canada', 2, 0, 4);
INSERT INTO Player VALUES (409, 'Andy', 'Kaut', 1, 0, 'Goalkeeper', 'USA', 1, 0, 4);
INSERT INTO Player VALUES (410, 'Joe', 'vinci', 3, 1, 'Midfielder', 'USA', 2, 0, 4);
SELECT * FROM Player WHERE TeamID= 4;


-- Toronto FC Players 
INSERT INTO Player VALUES (501, 'Michael', 'Bradley', 4, 6, 'Midfielder', 'USA', 4, 0, 5);
INSERT INTO Player VALUES (502, 'Jozy', 'Altidore', 10, 3, 'Striker', 'USA', 2, 1, 5);
INSERT INTO Player VALUES (503, 'Emanuel', 'Pogatetz', 0, 1, 'Defender', 'Austria', 3, 0, 5);
INSERT INTO Player VALUES (504, 'Chris', 'Mavinga', 2, 4, 'Center Back', 'France', 4, 0, 5);
INSERT INTO Player VALUES (505, 'Jonathan', 'Osorio', 5, 7, 'Midfielder', 'Canada', 3, 0, 5);
INSERT INTO Player VALUES (506, 'Ayo', 'Akinola', 3, 2, 'Forward', 'Canada', 2, 0, 5);
INSERT INTO Player VALUES (507, 'Nick', 'DeLeon', 1, 4, 'Midfielder', 'USA', 5, 0, 5);
INSERT INTO Player VALUES (508, 'Marky', 'Delgado', 4, 6, 'Midfielder', 'USA', 3, 0, 5);
INSERT INTO Player VALUES (509, 'Lukas', 'MacNaughton', 0, 1, 'Defender', 'Canada', 2, 0, 5);
INSERT INTO Player VALUES (510, 'Quentin', 'Westberg', 0, 0, 'Goalkeeper', 'USA', 1, 0, 5);
SELECT * FROM Player WHERE TeamID= 5;

-- Inter Miami Players 
INSERT INTO Player VALUES (601, 'Rodrigo', 'Herrería', 5, 8, 'Midfielder', 'Argentina', 3, 0, 6);
INSERT INTO Player VALUES (602, 'Gonzalo', 'Higuaín', 14, 4, 'Striker', 'Argentina', 2, 1, 6);
INSERT INTO Player VALUES (603, 'Chris', 'McCann', 1, 2, 'Defender', 'Ireland', 3, 0, 6);
INSERT INTO Player VALUES (604, 'Greg', 'Garza', 0, 0, 'Left Back', 'USA', 4, 0, 6);
INSERT INTO Player VALUES (605, 'Lewis', 'Morgan', 7, 5, 'Winger', 'Scotland', 3, 0, 6);
INSERT INTO Player VALUES (606, 'Leandro', 'González Pirez', 1, 1, 'Center Back', 'Argentina', 3, 0, 6);
INSERT INTO Player VALUES (607, 'Blaise', 'Matuidi', 3, 7, 'Midfielder', 'France', 4, 0, 6);
INSERT INTO Player VALUES (608, 'Diego', 'Alonso', 0, 0, 'Coach', 'Uruguay', 0, 0, 6);
INSERT INTO Player VALUES (609, 'Luis', 'Robles', 0, 0, 'Goalkeeper', 'USA', 2, 0, 6);
INSERT INTO Player VALUES (610, 'Matías', 'Pereira', 6, 4, 'Midfielder', 'Uruguay', 2, 0, 6);
SELECT * FROM Player WHERE TeamID= 6;

-- Chicago Fire Players 
INSERT INTO Player VALUES (701, 'Nemanja', 'Nikolić', 12, 2, 'Striker', 'Serbia', 3, 1, 7);
INSERT INTO Player VALUES (702, 'Jhon', 'Kennedy', 3, 5, 'Midfielder', 'USA', 2, 0, 7);
INSERT INTO Player VALUES (703, 'Gustavo', 'Bou', 9, 6, 'Forward', 'Argentina', 4, 0, 7);
INSERT INTO Player VALUES (704, 'Jon', 'Gustafson', 1, 1, 'Midfielder', 'USA', 3, 0, 7);
INSERT INTO Player VALUES (705, 'Bastian', 'Schweinsteiger', 0, 0, 'Midfielder', 'Germany', 5, 0, 7);
INSERT INTO Player VALUES (706, 'Dax', 'McCarty', 2, 3, 'Midfielder', 'USA', 3, 0, 7);
INSERT INTO Player VALUES (707, 'Brandon', 'Vincent', 0, 0, 'Defender', 'USA', 4, 0, 7);
INSERT INTO Player VALUES (708, 'C.J.', 'Sapong', 6, 1, 'Striker', 'USA', 2, 0, 7);
INSERT INTO Player VALUES (709, 'Patrick', 'Nyarko', 2, 4, 'Winger', 'Ghana', 3, 0, 7);
INSERT INTO Player VALUES (710, 'Joel', 'Lappin', 1, 0, 'Goalkeeper', 'USA', 1, 0, 7);
SELECT * FROM Player WHERE TeamID= 7;







