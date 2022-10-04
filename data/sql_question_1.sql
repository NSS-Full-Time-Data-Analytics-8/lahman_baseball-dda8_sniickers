select *
from fielding;
select * 
from people; 
select * 
from pitching;
select * 
from batting;


SELECT min(f.yearid),Max(f.yearid) 
from people as p
	INNER JOIN fielding AS f
		on p.playerid= f.playerid
	inner join pitching AS pi
		on p.playerid=pi.playerid
	INNER JOIN batting AS b
		on p.playerid = b.playerid

