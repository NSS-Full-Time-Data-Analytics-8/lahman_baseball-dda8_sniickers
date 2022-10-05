SELECT *
FROM people

-- -Question 1

SELECT min(yearid) AS earliest_year, max(yearid) AS latest_year
FROM teams;



-- (1)What range of years for baseball games played does the provided database cover

SELECT homegames.team, YEAR AS Mandla_games
FROM homegames 
GROUP BY Mandla_games,homegames.team 
ORDER BY Mandla_games DESC

THE RANGE OF YEARS IS BETWEEN 1871-2016( I SUSPECT THAT THIS NEEDS A LITTLE BIT MORE WORK)

SELECT MIN yearid AS newest_year,
		MAX yearid AS oldest_year
FROM teams
SELECT CONCAT( p.namefirst,' ',p.namelast) AS name, p.height, ap.g_all, tm.name


\\2. Find the name and height of the shortest player in the database.
//How many games did he play in? What is the name of the team for which he played//

SELECT DISTINCT CONCAT(p.namefirst, ' ', p.namelast) AS player_name , t.name AS team, a.g_all AS "Games Played"
FROM people AS p
JOIN appearances AS a
ON p.playerid=a.playerid  eee   
JOIN teams AS t
ON a.teamid=t.teamid
WHERE height =
	(SELECT MIN(height)
	FROM people);
SELECT MIN(height) namefirst, namelast
FROM people
GROUP BY namefirst,namelast

SELECT *
FROM people
WHERE height=(SELECT MIN(height)
			 FROM people)

FROM people AS p
LEFT JOIN appearances AS ap
ON p.playerid = ap.playerid
RIGHT JOIN teams AS tm
ON ap.teamid = tm.teamid
WHERE height IS NOT NULL
ORDER BY height
LIMIT 1;

SELECT p.namegiven AS name, height, G_all, t.name AS team
FROM people AS p INNER JOIN appearances AS a ON p.playerid = a.playerid
				 INNER JOIN teams AS t ON a.teamid=t.teamid
ORDER BY height
LIMIT 1
SELECT * FROM public.people
ORDER BY height ASC


-- //3. Find all players in the database who played at Vanderbilt University.
-- Create a list showing each player’s first and last names as well as the total salary 
-- they earned in the major leagues. Sort this list in descending order by the total salary earned.
-- Which Vanderbilt player earned the most money in the majors?//

SELECT SUM(sa.salary) AS dough,
       s.schoolname, p.namefirst, p.namelast
  FROM schools s
       INNER JOIN collegeplaying c
       ON s.schoolid = c.schoolid
	  INNER JOIN people p
       ON p.playerid = c.playerid
	  INNER JOIN salaries sa
	  ON p.playerid = sa.playerid 
 WHERE LOWER(s.schoolname) LIKE '%vanderbilt%'
 GROUP BY namefirst, namelast, s.schoolname
 ORDER BY dough DESC
----------------------------------------------------------------------------------------------------

-- //(4) 4. Using the fielding table, group players into three groups based on their position:
-- label players with position OF as "Outfield", those with position "SS", 
-- "1B", "2B", and "3B" as "Infield",
-- and those with position "P" or "C" as "Battery".
-- Determine the number of putouts made by each of these
-- three groups in 2016.

SELECT CASE
	   WHEN f.pos IN ('SS', '1B', '2B', '3B') THEN 'Infield'
	   WHEN f.pos = 'OF' THEN 'Outfield'
	   WHEN f.pos IN ('P', 'C') THEN 'Battery' END AS position,
	   SUM(po) AS putouts
FROM fielding AS f
WHERE yearid = 2016
GROUP BY position;
------------------------------------------------------------------------------------------------
-- 5. Find the average number of strikeouts per game by decade since 1920.
-- Round the numbers you report to 2 decimal places.
-- Do the same for home runs per game. Do you see any trends? vvv
--------------------------------------------------------------------------------------------------
SELECT CASE
		WHEN yearid BETWEEN 1920 AND 1929 THEN '1920s' 
		WHEN yearid BETWEEN 1930 AND 1939 THEN '1930s'
		WHEN yearid BETWEEN 1940 AND 1949 THEN '1940s'
		WHEN yearid BETWEEN 1950 AND 1959 THEN '1950s'
		WHEN yearid BETWEEN 1960 AND 1969 THEN '1960s'
		WHEN yearid BETWEEN 1970 AND 1979 THEN '1970s'
		WHEN yearid BETWEEN 1980 AND 1989 THEN '1980s'
		WHEN yearid BETWEEN 1990 AND 1999 THEN '1990s'
		WHEN yearid BETWEEN 2000 AND 2009 THEN '2000s'
		WHEN yearid BETWEEN 2010 AND 2016 THEN '2010s' END AS decade,
	   ROUND((AVG(t.so))/(AVG(t.g)),2) AS "KOs/game",
	   ROUND((AVG(t.hr))/(AVG(t.g)),2) AS "HRs/game"
FROM teams AS t
WHERE yearid > 1919
GROUP BY decade
ORDER BY decade;
----------------------------------------------------------------------------------------------------
-- (6) Find the player who had the most success stealing bases in 2016,
-- where __success__ is measured as the percentage of stolen base attempts
-- which are successful. (A stolen base attempt results either in a stolen
-- base or being caught stealing.) Consider only players 
-- who attempted _at least_ 20 stolen bases.

SELECT CONCAT(p.namefirst, ' ',  p.namelast) AS name,
	   ROUND((AVG(sb) / AVG(sb + cs)),3) * 100 AS sb_percentage
FROM batting
JOIN people AS p
ON batting.playerid=p.playerid
WHERE yearid = 2016 AND (sb + cs) >= 20
GROUP BY p.namefirst, p.namelast
ORDER BY sb_percentage DESC;  
---------------------------------------------------------------------------------------------------

-- (7)From 1970 – 2016, what is the largest number of wins for a team that did not win 
-- the world series? What is the smallest number of wins for a team that did win the world
-- series? Doing this will probably result in an unusually small number of wins for a world
-- series champion – determine why this is the case. Then redo your query, excluding the problem year.
-- How often from 1970 – 2016 was it the case that a team with the most wins
-- also won the world series? What percentage of the time?   



