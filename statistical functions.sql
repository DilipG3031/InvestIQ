-- Statistical functions

SELECT COUNT(*) AS total_startups
FROM startups;

SELECT COUNT(DISTINCT investor_id) AS total_investors
FROM investors;

SELECT SUM(valuation) AS total_valuation 
FROM startups;

SELECT MAX(total_funding) AS max_funding 
FROM investment_rounds;

SELECT MIN(burn_rate) AS min_burn_rate
FROM startup_metrics;

SELECT COUNT(*) AS helpful_feedback_count
FROM feedback 
WHERE helpful = 1;

SELECT AVG(age) AS average_age
FROM founders;

SELECT SUM(networth) AS total_networth 
FROM investors;

SELECT MAX(growth_rate) AS max_growth_rate
FROM startup_metrics;

SELECT startup_id, COUNT(*) AS pitch_count 
FROM pitches 
GROUP BY startup_id;

SELECT COUNT(*) AS accepted_deals 
FROM deals 
WHERE deal_states = 'Accepted';

SELECT COUNT(*) AS deals_with_positive_amount 
FROM deals 
WHERE deal_amount > 0;

SELECT pitch_id, COUNT(*) AS followup_count 
FROM follow_ups 
GROUP BY pitch_id;









