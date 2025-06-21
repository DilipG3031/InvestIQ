--group by and sorting rows
select *
from founders
where age > (SELECT AVG(age) FROM founders);

select * 
from startups
where valuation > (select AVG(valuation) from startups);

select startup_id
from investment_rounds
group by startup_id, total_funding
having total_funding >= AVG(total_funding);

SELECT type, count(*) as total_investors
from investors
group by type
having count(*) > 1;

select name, industry_id
from startups
where valuation > (select avg(valuation) from startups);

SELECT experience_years, COUNT(*) AS total_founders
FROM founders
GROUP BY experience_years
HAVING COUNT(*) >=1;


