select h.park,p.park_name,team,(attendance/games::numeric) AS avg_att
from homegames h INNER JOIN parks as p On h.park=p.park
where year ='2016' AND games >=10 
ORDER BY avg_att desc;

select h.park,p.park_name,team,(attendance/games::numeric) AS avg_att
from homegames h INNER JOIN parks as p On h.park=p.park
where year ='2016' AND games >=10 
order By avg_att LIMIT 5;

