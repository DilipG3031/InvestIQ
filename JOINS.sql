Select 
	s.name as startup_name,
	f.name as founders_name
from 
	startups s
join
	founders f
on
	s.founder_id=f.founder_id;

	select * from industries;
	select * from startups;

Select 
	s.name as startup_name,
	i.name as industry_name
from
	startups s
join
	industries i
on 
	s.industry_id=i.industry_id;

SELECT 
    p.pitch_id,
    s.name AS startup_name,
    i.name AS investor_name
FROM 
    pitches p
JOIN 
    startups s ON p.startup_id = s.startup_id
JOIN 
    investors i ON p.investor_id = i.investor_id;

select 
s.name as startup_names,
i.round_type
from 
startups s
join
investment_rounds i
on
s.startup_id=i.startup_id;

SELECT d.deal_id, s.name AS startup_name
FROM deals d
JOIN pitches p ON d.pitch_id = p.pitch_id
JOIN startups s ON p.startup_id = s.startup_id;

SELECT f.name AS founder_name, s.name AS startup_name
FROM founders f
JOIN startups s ON f.founder_id = s.founder_id;

SELECT fb.comment, s.name AS startup_name
FROM feedback fb
JOIN pitches p ON fb.pitch_id = p.pitch_id
JOIN startups s ON p.startup_id = s.startup_id;

SELECT fu.followup_id, fu.notes, p.pitch_id, i.name AS investor_name
FROM follow_ups fu
JOIN pitches p ON fu.pitch_id = p.pitch_id
JOIN investors i ON p.investor_id = i.investor_id;

SELECT s.name AS startup_name, COUNT(ir.round_id) AS total_rounds
FROM startups s
LEFT JOIN investment_rounds ir ON s.startup_id = ir.startup_id
GROUP BY s.name;

-- Display all investment rounds with investor name via pitch linkage
SELECT ir.*, i.name AS investor_name
FROM investment_rounds ir
JOIN startups s ON ir.startup_id = s.startup_id
JOIN pitches p ON s.startup_id = p.startup_id
JOIN investors i ON p.investor_id = i.investor_id;
	