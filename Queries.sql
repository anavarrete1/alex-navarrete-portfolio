-- Team 4
-- Alex Navarrete
-- ITEC 3200 Summer 2025
-- Semester Project, Part 3 

-- Query 1 
-- Selects all players who are goalkeepers and anyone who has 'o' in there last name
USE section1_team04;
SELECT First_Name AS 'First Name', Last_Name AS 'Last Name', Player_Position AS 'Position' 
FROM player
WHERE Player_Position = 'GoalKeeper' OR Last_Name LIKE 'o%'
ORDER BY Position;

-- Query 2 
-- Selects the coaches with e, a, and n characters in their name
SELECT t.Team_Name AS 'Team Name', t.Team_Coach AS 'Coach',
l.league_name AS 'League', t.Team_players AS 'Total Players'
FROM section1_team4.team t
JOIN section1_team4.League l ON t.league_id = l.league_id
WHERE Team_Coach LIKE '_e%' or Team_Coach LIKE '%a' OR Team_coach LIKE '%n%'
ORDER BY 'Team Name' DESC;

-- Query 3
-- This query grabs player information and if they have scored 5 or 10 goals.
SELECT First_Name AS 'First Name', Last_Name AS 'Last Name', Player_Goals AS 'Goals Scored'
FROM Player
WHERE Player_Goals BETWEEN 5 AND 10
ORDER BY Player_Goals ASC;

-- Query 4 
-- Combines the tables that shows players, team, and league that they are currently in. 
USE section1_team4;
SELECT p.PlayerID AS 'Player ID', p.First_Name AS 'First Name', p.Last_Name AS 'Last Name', 
p.Player_Position AS 'Player Position', t.Team_Name AS 'Team Name', l.League_Name AS 'League Name', l.League_ID AS 'League ID'
FROM Player p
JOIN Team t ON p.TeamID = t.TeamID
JOIN League l ON t.League_ID = l.League_ID
ORDER BY 1;

-- QUERY 5: This query has an arithmethic expression which will compute each teams overall points accumulated from wins, ties, and losses.
SELECT team_name AS 'Team Name', Team_Wins AS 'Wins', Team_Losses AS 'Losses', Team_Ties AS 'Ties', (Team_Wins * 3) + Team_ties - team_losses as 'Total points'
FROM team
ORDER BY 2 DESC;

-- QUERY 6: This query will use the MAX group function to determine who are the players who have scored the most goals
SELECT CONCAT(First_Name, ' ', Last_Name) AS 'Player Full Name', MAX(Player_Goals) AS 'Top scorers'
FROM player
GROUP BY 1
ORDER BY 2 DESC;

-- QUERY 7: This query will show all the teams who have more trophies than the average team
SELECT Team_Name AS 'Team Name', Team_Trophies AS 'Numnber of Trophies'
FROM team
WHERE team_trophies > (
SELECT ROUND(AVG(Team_Trophies),0)
FROM team)
Order by team_Name;
