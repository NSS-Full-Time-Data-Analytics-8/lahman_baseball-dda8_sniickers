select yearid/10*10 AS decade,
round(avg(hr),2) AS avg_homeruns,
round(avg(so),2) as avg_strike_outs
from batting
where yearid >= 1920
group by yearid/10*10
ORDER by yearid/10*10 