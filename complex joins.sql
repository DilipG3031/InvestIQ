--Founders with more than one startup in different industries
SELECT f.name
FROM founders f
JOIN startups s ON f.founder_id = s.founder_id
GROUP BY f.name
HAVING COUNT(DISTINCT s.industry_id) > 1;

--Startups where founder has more than 5 years of experience

SELECT s.name
FROM startups s
JOIN founders f ON s.founder_id = f.founder_id
WHERE f.experience_years > 5;

-- Investors who haven’t made any deals
SELECT i.name
FROM investors i
LEFT JOIN pitches p ON i.investor_id = p.investor_id
LEFT JOIN deals d ON p.pitch_id = d.pitch_id
WHERE d.deal_id IS NULL;

--Startups whose pitch was rejected
SELECT DISTINCT s.name
FROM startups s
JOIN pitches p ON s.startup_id = p.startup_id
JOIN deals d ON p.pitch_id = d.pitch_id
WHERE d.deal_states = 'Rejected';

--Startups that received deal amount > average deal
SELECT DISTINCT s.name
FROM startups s
JOIN pitches p ON s.startup_id = p.startup_id
JOIN deals d ON p.pitch_id = d.pitch_id
WHERE d.deal_amount > (
    SELECT AVG(deal_amount) FROM deals
);
