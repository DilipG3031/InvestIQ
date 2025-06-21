-- 21
SELECT DISTINCT s.*
FROM startups s
JOIN industries i ON s.industry_id = i.industry_id
WHERE i.name IN (
  SELECT focus_industry FROM investors
);

-- 22
SELECT investor_id
FROM feedback
GROUP BY investor_id
HAVING COUNT(DISTINCT pitch_id) > 1;

-- 23
SELECT founder_id
FROM startups
GROUP BY founder_id
HAVING COUNT(*) > 1;

-- 24
SELECT * FROM deals
WHERE deal_amount > ANY (
  SELECT asked_amount FROM pitches
);

-- 25
SELECT s1.*
FROM startups s1
WHERE valuation > ALL (
  SELECT s2.valuation FROM startups s2
  WHERE s1.stage = s2.stage AND s1.startup_id <> s2.startup_id
);

-- 26
SELECT DISTINCT s.name
FROM startups s
JOIN pitches p ON s.startup_id = p.startup_id
JOIN feedback f ON p.pitch_id = f.pitch_id
WHERE f.score > 7;

-- 27
SELECT DISTINCT f.*
FROM founders f
WHERE EXISTS (
  SELECT 1
  FROM startups s
  JOIN industries i ON s.industry_id = i.industry_id
  JOIN investors iv ON iv.focus_industry = i.name
  WHERE s.founder_id = f.founder_id
);

-- 28
SELECT DISTINCT s.*
FROM startups s
JOIN pitches p ON s.startup_id = p.startup_id
WHERE p.pitch_id IN (SELECT pitch_id FROM follow_ups);

-- 29
SELECT DISTINCT s.*
FROM startups s
JOIN pitches p ON s.startup_id = p.startup_id
JOIN deals d ON p.pitch_id = d.pitch_id
WHERE d.equity_takes > (SELECT AVG(equity_offered) FROM pitches);

-- 30
SELECT investor_id
FROM pitches p
JOIN deals d ON p.pitch_id = d.pitch_id
GROUP BY investor_id
HAVING COUNT(DISTINCT startup_id) > 1;

-- 31
SELECT startup_id
FROM investment_rounds
GROUP BY startup_id
HAVING COUNT(*) > 1;

-- 32
SELECT pitch_id
FROM feedback
GROUP BY pitch_id
HAVING COUNT(DISTINCT investor_id) > 1;

-- 33
SELECT DISTINCT f1.name
FROM founders f1
JOIN founders f2 ON f1.experience_years = f2.experience_years AND f1.founder_id <> f2.founder_id;

-- 34
SELECT startup_id
FROM investment_rounds
INTERSECT
SELECT startup_id
FROM startup_metrics;

-- 35
SELECT DISTINCT i.name
FROM investors i
JOIN pitches p ON i.investor_id = p.investor_id
JOIN startups s ON s.startup_id = p.startup_id
WHERE s.valuation > 20000000;

-- 36
SELECT s1.*
FROM startups s1
WHERE s1.valuation > (
  SELECT AVG(s2.valuation) FROM startups s2
  WHERE s2.stage = s1.stage
);

-- 37
SELECT f1.*
FROM founders f1
WHERE f1.experience_years > ALL (
  SELECT f2.experience_years FROM founders f2
  WHERE f2.age = f1.age AND f2.founder_id <> f1.founder_id
);

-- 38
SELECT d.*
FROM deals d
WHERE equity_takes > (
  SELECT AVG(p.equity_offered) FROM pitches p
  WHERE p.startup_id = (
    SELECT startup_id FROM pitches WHERE pitch_id = d.pitch_id
  )
);

-- 39
SELECT sm.*
FROM startup_metrics sm
JOIN startups s ON sm.startup_id = s.startup_id
WHERE sm.burn_rate > (
  SELECT AVG(sm2.burn_rate)
  FROM startup_metrics sm2
  JOIN startups s2 ON sm2.startup_id = s2.startup_id
  WHERE s2.industry_id = s.industry_id
);

-- 40
SELECT s.name
FROM startups s
JOIN pitches p ON s.startup_id = p.startup_id
JOIN feedback f ON p.pitch_id = f.pitch_id
GROUP BY s.name
HAVING COUNT(f.comment) > 1;

-- 41
SELECT * FROM pitches p1
WHERE asked_amount > ALL (
  SELECT asked_amount FROM pitches p2
  WHERE p2.startup_id = p1.startup_id AND p2.pitch_id <> p1.pitch_id
);

-- 42
SELECT i.investor_id
FROM investors i
JOIN pitches p ON i.investor_id = p.investor_id
JOIN startups s ON s.startup_id = p.startup_id
JOIN deals d ON d.pitch_id = p.pitch_id
GROUP BY i.investor_id
HAVING COUNT(DISTINCT s.industry_id) > 1;

-- 43
SELECT * FROM follow_ups f
WHERE EXISTS (
  SELECT 1 FROM pitches p
  WHERE p.pitch_id = f.pitch_id AND p.pitch_date < f.followup_date
);

-- 44
SELECT s.name
FROM startups s
JOIN startup_metrics sm ON s.startup_id = sm.startup_id
JOIN investment_rounds ir ON s.startup_id = ir.startup_id
WHERE sm.growth_rate > (
  SELECT AVG(sm2.growth_rate)
  FROM startups s2
  JOIN startup_metrics sm2 ON s2.startup_id = sm2.startup_id
  JOIN investment_rounds ir2 ON s2.startup_id = ir2.startup_id
  WHERE ir2.round_type = ir.round_type
);

-- 45
SELECT f.*
FROM founders f
WHERE EXISTS (
  SELECT 1 FROM startups s
  JOIN pitches p ON s.startup_id = p.startup_id
  WHERE s.founder_id = f.founder_id
)
AND NOT EXISTS (
  SELECT 1 FROM startups s
  JOIN pitches p ON s.startup_id = p.startup_id
  JOIN deals d ON d.pitch_id = p.pitch_id
  WHERE s.founder_id = f.founder_id
);

-- 46
SELECT DISTINCT i.*
FROM investors i
WHERE NOT EXISTS (
  SELECT 1
  FROM deals d
  JOIN pitches p ON d.pitch_id = p.pitch_id
  JOIN startups s ON p.startup_id = s.startup_id
  WHERE p.investor_id = i.investor_id AND s.valuation <= 15000000
);

-- 47
SELECT s.*
FROM startups s
JOIN pitches p ON s.startup_id = p.startup_id
JOIN deals d ON p.pitch_id = d.pitch_id
JOIN feedback f ON p.pitch_id = f.pitch_id
WHERE f.helpful = 0;

-- 48
SELECT d.*
FROM deals d
JOIN pitches p ON d.pitch_id = p.pitch_id
WHERE d.deal_amount > (
  SELECT AVG(d2.deal_amount)
  FROM deals d2
  JOIN pitches p2 ON d2.pitch_id = p2.pitch_id
  WHERE p2.investor_id = p.investor_id
);

-- 49
SELECT DISTINCT f.*
FROM founders f
WHERE NOT EXISTS (
  SELECT 1
  FROM startups s
  JOIN pitches p ON s.startup_id = p.startup_id
  WHERE s.founder_id = f.founder_id
  AND p.pitch_id NOT IN (SELECT pitch_id FROM follow_ups)
);

-- 50
SELECT s.*
FROM startups s
JOIN pitches p ON s.startup_id = p.startup_id
WHERE p.pitch_id NOT IN (
  SELECT pitch_id FROM feedback
)
AND p.pitch_id NOT IN (
  SELECT pitch_id FROM follow_ups
);
