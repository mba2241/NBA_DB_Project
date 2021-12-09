-- create a new database called "Test_DB"
CREATE DATABASE NBA_DB;
GO -- seperates out statements that should be in their own files

-- use switches you into the database you specify
-- can also use the drop down menu next to where it says "Change Connection"
USE NBA_DB;
GO

--Select all data from nba_2020-21 table 
SELECT * FROM dbo.[nba_2020-21]
GO

--Select all data from team total stats 
SELECT * FROM dbo.team_total_stats
GO

--Select all data from bucks roster stats
SELECT * FROM dbo.bucks_roster_stats
GO

--Select data that we are going to use from nba_2020-21 table order by age Descending 
SELECT Player, Pos, Age, Tm FROM dbo.[nba_2020-21]
ORDER BY Age Desc;
GO

--Select data that we are going to use from nba_2020-21 table order by age Ascending 
SELECT Player, Pos, Age, Tm FROM dbo.[nba_2020-21]
ORDER BY Age ASC;
GO

--Select data that we are going to use from nba_2020-21 table 
SELECT Player, Pos, Age, Tm FROM dbo.[nba_2020-21]
ORDER BY Age ASC, Pos DESC
GO


--Select data that we are going to use from nba_2020-21 table 
SELECT Player, Pos, Age, Tm FROM dbo.[nba_2020-21]
ORDER BY Age ASC, Pos DESC
GO

--Looking for Average Minute played per game (Game Vs Minutes Played ) from Milwaukee Bucks (MIL) team order by Age Ascending  
SELECT Player, Pos, Age, Tm, G, MP, (MP/G) AS AverageMinute
FROM dbo.[nba_2020-21]
WHERE Tm LIKE'%MIL%'
ORDER BY Age ASC; 
GO

--looking for players with the Highest point rate compared to player from bucks 
SELECT column2, Age, PTS, G, (PTS/G) AS AveragePoint
FROM  dbo.bucks_roster_stats
where column2 IS NOT NULL
ORDER BY AveragePoint Desc; 
GO

--looking for top 10 player with Highest game Played of nba Season 2020-21
SELECT TOP 10 G, Player, Pos, Age
FROM dbo.[nba_2020-21]
ORDER BY G DESC; 
GO

--looking for top 5 player with Highest game Played by Lakers in the nba Season 2020-21
SELECT TOP 5 G, Player, Pos, Age
FROM dbo.[nba_2020-21]
WHERE Tm LIKE'%LAL%'
ORDER BY Age ASC; 
GO

--looking for the oldest point gard in the nba Season 2020-21
SELECT TOP 1 Age, Player, Pos
FROM dbo.[nba_2020-21]
WHERE Pos LIKE'%PG%'
ORDER BY Age DESC; 
GO

--looking for average point/game of the bucks team in season 2020-21 (72 games total)
SELECT SUM(PTS)/72 AS AveragePoint 
FROM  dbo.bucks_roster_stats
where column2 IS NOT NULL;
GO

--join all data from nba_2020-21 table and all data from team total stats 
SELECT * FROM dbo.[nba_2020-21]
JOIN dbo.team_total_stats
ON 
; 