# Uber Data Science Interview Challenge 

## Question 1
**Part 1**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This is a relatively simple query that does not need many qualifying statements

```sql
select min(score)  as Precentila_90th 
from (SELECT (a.predicted_eta-a.actual_eta) as score, 
ntile(100) OVER (ORDER by a.predicted_eta-a.actual_eta) AS percentile
FROM trips a
JOIN cities b ON a.city_id=b.city_id 
WHERE b.city_name in ('Meereen','Qarth') and a.request_at > current_date - 30
) c where percentile = 90
```

**Part 2**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In this query I tried to apply constraints early and before joins are make to improve the speed. I also assumed that there would be only one sign up success event per rider.  If this assumption is violated you could get a cross product like effect.    

```sql
elect d.city_name,date_trunc('day',d._ts) as theday , count(t.client_id) as num_rides, count(d.client_id) as num_events,div(100.0*count(t.city_id), count(d.client_id)) as Precent_Rides_Completed

from 
(SELECT a.rider_id as client_id,a.city_id,b.city_name,a._ts
from 
	events a	
 	JOIN cities b ON a.city_id=b.city_id

WHERE a.event_name = 'sign_up_success' AND b.city_name in ('Meereen','Qarth') AND a._ts >= '2016-01-01' and a._ts < '2016-01-08'
GROUP BY a.rider_id,a.city_id,b.city_name,a._ts) d

left join (SELECT min(request_at) as request_at,a.client_id,a.city_id
	From trips a
	JOIN cities b ON a.city_id=b.city_id 
	WHERE b.city_name in ('Meereen','Qarth') and a.status ='complete'
	and request_at >= '2016-01-01' and request_at< '2016-01-15' 
	GROUP BY a.client_id,a.city_id) t 
	
	on d.client_id=t.client_id 
	and d.city_id=t.city_id 
	and EXTRACT(EPOCH FROM t.request_at-d._TS)/3600 < 168	

group by d.city_name,date_trunc('day',d._ts)
order by d.city_name,date_trunc('day',d._ts)
```

## Question 2

## Question 3

## Time Allocation
 
 
1. Question 1
 
 	* Part 1: 2-3 minutes.  I had to google how to calculate quantiles in PostgreSQL. 
 	* Part 2: 30 mintues
2. Question 2
 	* 30 minutes total thinking about metrics and researching the Uber Partners App.

3. Question 3
 	* Data cleaning and exploration: 45 minutes.
 	* Predictive Modeling: 1 hour.  
 	* Write up: 20 mintues 
 	
 
 
 
 
 
 
 
