-- create a new database called "Test_DB"
CREATE DATABASE NBA_DB;
GO -- seperates out statements that should be in their own files

-- use switches you into the database you specify
-- can also use the drop down menu next to where it says "Change Connection"
USE NBA_DB;
GO

/*****************
* INSERT COMMAND *
******************/
-- insert a new player to the bucks roster table

INSERT INTO dbo.bucks_roster_stats (Players, Age, G, MP, FGA, FG1, _3P)
            VALUES ('Mamadou Ba', '31', '62', '1991', '176', '0.71', '80');
GO
-- since no value given to other variable, set to NULL by default
SELECT * FROM dbo.bucks_roster_stats;
GO

/*****************
* UPDATE COMMAND *
******************/
--Update a player to the bucks roster table
UPDATE dbo.bucks_roster_stats
SET Age = '23'
WHERE  Players = 'Mamadou Ba';
GO

SELECT * FROM dbo.bucks_roster_stats;
GO

/*****************
* DELETE COMMAND *
******************/
-- delete a player in the bucks roster table
DELETE FROM dbo.bucks_roster_stats
WHERE Players = 'Mamadou Ba';
GO

SELECT * FROM dbo.bucks_roster_stats;
GO

/*****************
* SELECT COMMAND *
******************/
--Select all data from nba_2020-21 table 
SELECT * FROM dbo.[nba_2020-21]
GO

--Select Player, Pos, Age data from nba_2020-21 table 
SELECT Player, Pos, Age FROM dbo.[nba_2020-21]
GO

--Select TMs, G, MP data from team total stats 
SELECT TMs, G, MP FROM dbo.team_total_stats
GO

--Select all data from team total stats 
SELECT * FROM dbo.team_total_stats
GO

--Select all data from bucks roster stats
SELECT * FROM dbo.bucks_roster_stats
GO

--Select Players, Age, data from bucks roster stats
SELECT Players, Age  FROM dbo.bucks_roster_stats
GO
/*****************
* ORDER BY COMMAND *
******************/
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
SELECT Players, Age, PTS, G, (PTS/G) AS AveragePoint
FROM  dbo.bucks_roster_stats
where Players IS NOT NULL
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
where Players IS NOT NULL;
GO

--join all data from nba_2020-21 table and all data from team total stats 
SELECT * FROM dbo.[nba_2020-21]
JOIN dbo.team_total_stats
ON Tm = TMs; 

/***********
* GROUP BY *
************/
--Select data that we are going to use from nba_2020-21 table group by player
SELECT Player FROM dbo.[nba_2020-21]
GROUP BY Player;
GO

--Select data that we are going to use from nba_2020-21 table group by player 
--use aggregate function count() to see how many rows are in each grouping
SELECT 
    Player, COUNT(*) 'Number of players'
FROM 
    dbo.[nba_2020-21]
GROUP BY 
    Player;
GO

/***********
* HAVING *
************/

--looking for players of the bucks team  with same age only groups selected are those with less than 1 player

SELECT 
    Age, COUNT(*) 'Number of players'
FROM  
    dbo.bucks_roster_stats
GROUP BY
    Age
HAVING
    COUNT(*) > 1 ; 
GO


--looking for players in the NBA with same age only groups selected are those with less than 1 player in 2020-21 season
SELECT 
    Age, COUNT(*) 'Number of players'
FROM 
    dbo.[nba_2020-21]
GROUP BY 
     Age 
HAVING 
    COUNT(*)>1; 
GO


/*************
* INNER JOIN *
**************/
-- inner join selects all rows between tables if there is a common field between them 
-- select inner joint between player in 2020-21 season Bucks players.
SELECT 
    *
FROM 
    dbo.[nba_2020-21]
INNER JOIN
    dbo.bucks_roster_stats
ON
    Player = Players;
