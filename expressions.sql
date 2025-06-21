--LIKE, AND, OR, BETWEEN, IN, IS NULL, NOT, and precedence.

--LIKE operator (Pattern Matching)

SELECT name 
FROM startups
where name like 'V%';

SELECT name
FROM founders
WHERE name like '%a%';

SELECT type
FROM investors
WHERE type like '%investors';

SELECT name
FROM investors
WHERE name like '%me%'

SELECT description
FROM industries
WHERE name like '%media%'


-- AND operators

select name, experience_years 
from founders
where age > 25 and experience_years >  5;

select name
from startups
where valuation > 2000000 and stage = 'Series B';

select pitch_id
from pitches
where equity_offered > 10  and asked_amount < 700000;

select followup_id, notes
from follow_ups
where followup_date > '2025-06-15' and notes like '%negoyiation%';

--IN operator

select name 
from startups
where stage in ('Seed', 'Series B', 'Series C');

--arthmetic expressions 

select 
	startup_id,
	name,
	valuation + 1000000 as updated_valuation
from
startups;

--select * from investors;

select 
	investor_id,
	name,
	networth / 10 as updated_networth
from
investors;

select 
	founder_id,
	name,
	age,
	experience_years,
	age + experience_years as updated_column
from
founders;


select * from pitches;

select * from deals;

select
	pitch_id,
	asked_amount,
	(asked_amount - (
		select deal_amount
		from deals
		where deals.pitch_id = pitches.pitch_id
		)) as amount_difference
from
pitches;

select
	pitch_id,
	deal_amount,
	equity_takes,
	deal_amount / equity_takes as funding_per_equity_percent
from
	deals
where
	equity_takes != 0;


--select * from deals;

select 
	startup_id,
	name
from 
	startups
where valuation + 5000000 > 20000000;

select name
from founders 
where age - experience_years > 25;


select stage as current_stage
from startups;

select 
	pitch_date as Presented_on,
	asked_amount as final_deal
from pitches;












