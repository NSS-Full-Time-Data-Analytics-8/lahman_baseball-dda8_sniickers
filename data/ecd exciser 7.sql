select distinct county,
				max(population) OVER(PARTITION BY county) AS Max_pop,
				min(population) OVER(PARTITION BY county) AS min_pop
				from population 
				
				
				