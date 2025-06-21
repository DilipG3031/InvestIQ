-- Selecting specific columns from the table using select 

SELECT name,valuation
FROM startups;   -- name and valuation from startups table

SELECT name, networth
FROM investors;    --name and networth from investors table

SELECT email, experience_years
FROM founders;     -- email and experience from founders table

SELECT feedback_id, score, helpful
FROM feedback;   --- SElecting feedback_id,score,helpful from feedback table

SELECT notes
FROM follow_ups;  --Selecting notes from follow_ups table 

-- Selecting Specific Rows (using WHERE clause)

SELECT name, stage
FROM startups
WHERE stage = 'Series A';  -- list startups that are in series A stage

SELECt name, experience_years
FROM founders
WHERE experience_years > 10;  -- founders who whave experience > 10 yrs

SELECT name, networth
FROM investors
WHERE networth > 1000000000;  --investors with networth more than 1 billion

SELECT followup_id, followup_date
FROM follow_ups
WHERE followup_date > '2025-06-10';  --followps ups date exceeding the given date

-- Sorting Rows (using ORDER BY)

SELECT name, valuation
FROM startups
ORDER BY valuation DESC ;   --sorting startups in Descending order of valuation

SELECT name, founder_id
FROM founders
ORDER BY name ASC;     -- sorting names of founders 

SELECT feedback_id, score
FROM feedback
ORDER BY score ASC;     --sorting feedback based on score

-- Eliminating Duplicate Rows (using DUSTINCT)

SELECT DISTINCT stage
FROM startups;

SELECT DISTINCT focus_industry
FROM investors;

SELECT DISTINCT round_type
FROM investment_rounds;

SELECT * FROM pitches;         --if you see in the pitches tables
--the equity offered is noy in sorted way

SELECT DISTINCT equity_offered  --but when you use distinct key word, the the table i got was sorted values of equity offered in ascending order
FROM pitches;                   -- it is due to temporary internal sorting to find distinct values in  the column

SELECT DISTINCT round_type
FROM investment_rounds;


