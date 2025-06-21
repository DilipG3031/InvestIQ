-- 1. Founder-startup pairs who either made a pitch or got an investment
SELECT f.name AS founder_name, s.name AS startup_name
FROM founders f
JOIN startups s ON f.founder_id = s.founder_id
JOIN pitches p ON s.startup_id = p.startup_id
UNION
SELECT f.name, s.name
FROM founders f
JOIN startups s ON f.founder_id = s.founder_id
JOIN investment_rounds ir ON s.startup_id = ir.startup_id;

-- 2. Names of all founders and investors as person_name
SELECT name AS person_name FROM founders
UNION ALL
SELECT name FROM investors;

-- 3. All pitch IDs whether or not they resulted in a deal
SELECT p.pitch_id, d.deal_id
FROM pitches p
LEFT JOIN deals d ON p.pitch_id = d.pitch_id;

-- 4. Startups not in investment_rounds or startup_metrics
SELECT startup_id FROM startups
WHERE startup_id NOT IN (SELECT startup_id FROM investment_rounds)
UNION
SELECT startup_id FROM startups
WHERE startup_id NOT IN (SELECT startup_id FROM startup_metrics);

-- 5. Investors who gave feedback but not associated with any pitch
SELECT DISTINCT i.name
FROM investors i
JOIN feedback f ON i.investor_id = f.investor_id
WHERE i.investor_id NOT IN (SELECT DISTINCT investor_id FROM pitches);

-- 6. Startup name, total funding, average revenue
SELECT s.name, 
       SUM(ir.total_funding) AS total_funding, 
       AVG(sm.revenue) AS avg_revenue
FROM startups s
LEFT JOIN investment_rounds ir ON s.startup_id = ir.startup_id
LEFT JOIN startup_metrics sm ON s.startup_id = sm.startup_id
GROUP BY s.name;

-- 7. Startups with accepted deals and positive feedback
SELECT DISTINCT s.name
FROM startups s
JOIN pitches p ON s.startup_id = p.startup_id
JOIN deals d ON p.pitch_id = d.pitch_id
JOIN feedback f ON p.pitch_id = f.pitch_id
WHERE d.deal_states = 'Accepted' AND f.score > 7;

-- 8. Investors who gave feedback but did not participate in deals
SELECT i.name
FROM investors i
JOIN feedback f ON i.investor_id = f.investor_id
WHERE i.investor_id NOT IN (
    SELECT p.investor_id
    FROM deals d
    JOIN pitches p ON d.pitch_id = p.pitch_id
);

-- 9. All unique startup names from startups and investment_rounds
SELECT name FROM startups
UNION
SELECT s.name
FROM investment_rounds ir
JOIN startups s ON ir.startup_id = s.startup_id;

-- 10. Founder-wise total valuation of all their startups
SELECT f.name, SUM(s.valuation) AS total_valuation
FROM founders f
JOIN startups s ON f.founder_id = s.founder_id
GROUP BY f.name;

-- 11. Investor types who funded startups with above-average growth
SELECT DISTINCT i.type
FROM deals d
JOIN pitches p ON d.pitch_id = p.pitch_id
JOIN startups s ON p.startup_id = s.startup_id
JOIN startup_metrics sm ON s.startup_id = sm.startup_id
JOIN investors i ON p.investor_id = i.investor_id
WHERE sm.growth_rate > (SELECT AVG(growth_rate) FROM startup_metrics);

-- 12. Pitch IDs with both deals and feedback
SELECT DISTINCT p.pitch_id
FROM pitches p
JOIN deals d ON p.pitch_id = d.pitch_id
JOIN feedback f ON p.pitch_id = f.pitch_id;

-- 13. Founders whose startups got funded but no follow-up
SELECT DISTINCT f.name
FROM founders f
JOIN startups s ON f.founder_id = s.founder_id
JOIN pitches p ON s.startup_id = p.startup_id
JOIN deals d ON p.pitch_id = d.pitch_id
WHERE p.pitch_id NOT IN (
    SELECT pitch_id FROM follow_ups
);

-- 14. For each startup, show revenue, growth_rate, funding rounds, deal_status
SELECT s.name, sm.revenue, sm.growth_rate, ir.total_funding, d.deal_states
FROM startups s
LEFT JOIN startup_metrics sm ON s.startup_id = sm.startup_id
LEFT JOIN investment_rounds ir ON s.startup_id = ir.startup_id
LEFT JOIN pitches p ON s.startup_id = p.startup_id
LEFT JOIN deals d ON p.pitch_id = d.pitch_id;

-- 15. Top 3 startups by valuation with founder and deal status
SELECT TOP 3 s.name, f.name AS founder_name, d.deal_states
FROM startups s
JOIN founders f ON s.founder_id = f.founder_id
LEFT JOIN pitches p ON s.startup_id = p.startup_id
LEFT JOIN deals d ON p.pitch_id = d.pitch_id
ORDER BY s.valuation DESC;

-- 16. Investors and founders as stakeholder with their emails
SELECT name AS stakeholder, email FROM founders
UNION
SELECT name, 'N/A' FROM investors; -- if no email column in investors

-- 17. Founders whose pitch was followed up and accepted
SELECT DISTINCT f.name
FROM founders f
JOIN startups s ON f.founder_id = s.founder_id
JOIN pitches p ON s.startup_id = p.startup_id
JOIN follow_ups fu ON p.pitch_id = fu.pitch_id
JOIN deals d ON p.pitch_id = d.pitch_id
WHERE d.deal_states = 'Accepted';

-- 18. Founders with either pitch or follow-up
SELECT DISTINCT f.name
FROM founders f
JOIN startups s ON f.founder_id = s.founder_id
JOIN pitches p ON s.startup_id = p.startup_id
UNION
SELECT DISTINCT f.name
FROM founders f
JOIN startups s ON f.founder_id = s.founder_id
JOIN pitches p ON s.startup_id = p.startup_id
JOIN follow_ups fu ON p.pitch_id = fu.pitch_id;

-- 19. Startups with both investment round and a deal from pitch in June 2025
SELECT DISTINCT s.name
FROM startups s
JOIN investment_rounds ir ON s.startup_id = ir.startup_id
JOIN pitches p ON s.startup_id = p.startup_id
JOIN deals d ON p.pitch_id = d.pitch_id
WHERE MONTH(p.pitch_date) = 6 AND YEAR(p.pitch_date) = 2025;

-- 20. Startups that had either feedback or follow-up but not both
SELECT s.name
FROM startups s
JOIN pitches p ON s.startup_id = p.startup_id
WHERE p.pitch_id IN (
    SELECT pitch_id FROM feedback
    EXCEPT
    SELECT pitch_id FROM follow_ups
)
UNION
SELECT s.name
FROM startups s
JOIN pitches p ON s.startup_id = p.startup_id
WHERE p.pitch_id IN (
    SELECT pitch_id FROM follow_ups
    EXCEPT
    SELECT pitch_id FROM feedback
);
