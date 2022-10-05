SELECT CASE 
	   WHEN f.pos IN ('SS', '1B', '2B', '3B') THEN 'Infield'
	   WHEN f.pos = 'OF' THEN 'OUTFIELD'
	   WHEN F.POS in ('P','C') THEN 'Battery' END AS position, 
	   SUM(po) AS putouts
 FROM fielding AS f
 WHERE yearid = 2016 
 GROUP BY position;