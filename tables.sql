-- table on startups
/*create table startups (
startup_id varchar(20) primary key,
name varchar(100),
industry_id varchar(10),
valuation decimal(15,2),
founder_id varchar(20),
stage varchar(30)
);*/

--inserting values into startups table
/*insert into startups (startup_id, name, industry_id, valuation, founder_id, stage)
values
('ST1001', 'InnovX', 'IND5001', 25000000.50, 'FND3002', 'Series A'),
('ST1002', 'VoxVenture', 'IND5002', 33000000.50, 'FND3005', 'Series C'),
('ST1003', 'Flexify', 'IND5003', 18000000.25, 'FND3007', 'Series D'),
('ST1004', 'MediQR', 'IND5004', 13000000.40, 'FND3001', 'Series B'),
('ST1005', 'blowfish', 'IND5005', 10000000.30, 'FND3003', 'Series F');*/

--creating founders table
/*create table founders (
founder_id varchar(10) primary key,
name varchar(100),
age int,
email varchar(100),
experience_years int
);*/

--inserting values into founders table
/*insert into founders (founder_id, name, age, email, experience_years)
values
('FND3002', 'Aarav Patel', 35, 'aarav.patel@email.com', 12),
('FND3005', 'Amogha G', 20, 'amogha.g@email.com', 2),
('FND3007', 'Dilip Y S', 22, 'dilip.ys@email.com', 3),
('FND3001', 'Chandana M V', 21, 'chandana.mv@email.com', 1),
('FND3003', 'Pavan C', 51, 'pavan.c@email.com', 21);*/

-- create table for investors
/*create table investors(
investor_id varchar(10) primary key,
name varchar(100),
networth decimal(15,2),
type varchar(30),
focus_industry varchar(50)
);*/

--inserting values into investors table
/*insert into investors (investor_id, name, networth, type, focus_industry)
values
('INV8001', 'Sanya Mehta', 750000000.75, 'Angel Investor', 'Technology & AI'),
('INV8002', 'Ansar Noor', 1000000000.15, 'Venture Capitalists', 'Innovation & Tech'),
('INV8003', 'Mahesh Reddy', 3500000000.25, 'Private Equity Investors', 'Cyber Security'),
('INV8004', 'Sandeep Sharma', 8000000000.35, 'Institutional investors', 'Data Science'),
('INV8005', 'Kempegowda', 9000000000.85, 'Incubators & accelerators', 'Mechanical');*/

--creating table for pitches
/*create table pitches (
pitch_id varchar(10) primary key,
startup_id varchar(10),
investor_id varchar(10),
pitch_date Date,
asked_amount decimal(15,2),
equity_offered decimal(10,2)
);*/

-- inserting values into pitches table
/*insert into pitches (pitch_id, startup_id, investor_id, pitch_date, asked_amount, equity_offered)
values
('P001', 'ST1001', 'INV8001', '2025-06-01', 500000.00, 10.00),
('P002', 'ST1002', 'INV8002', '2025-06-05', 750000.00, 15.50),
('P003', 'ST1003', 'INV8003', '2025-06-10', 300000.00, 8.00),
('P004', 'ST1004', 'INV8004', '2025-06-15', 900000.00, 20.00),
('P005', 'ST1005', 'INV8005', '2025-06-20', 650000.00, 12.75);*/

--creating tables for deals
/*create table deals (
deal_id varchar(10) primary key,
pitch_id varchar(10),
deal_amount decimal(15,2),
equity_takes decimal(10,2),
deal_states varchar(30),
remarks text);*/

--inserting values into deals table
/*insert into deals (deal_id, pitch_id, deal_amount, equity_takes, deal_states, remarks)
values
('D001', 'P001', 450000.00, 9.00, 'Accepted', 'Investor agreed with slight negotiation on equity.'),
('D002', 'P002', 750000.00, 15.50, 'Rejected', 'Investor declined due to high valuation concerns.'),
('D003', 'P003', 300000.00, 8.00, 'Accepted', 'Deal finalized with no changes to the initial offer.'),
('D004', 'P004', 800000.00, 18.00, 'Accepted', 'Investor agreed but negotiated a lower equity share.'),
('D005', 'P005', 0.00, 0.00, 'Pending', 'Investor reviewing proposal and conducting due diligence.');*/

--creating industries tables
/*create table industries (
industry_id varchar(10) primary key,
name varchar(100),
description text
);*/

--inserting values into industry table
/*INSERT INTO industries (industry_id, name, description) 
VALUES
('I001', 'Technology', 'Includes software development, AI research, cybersecurity, and emerging tech innovations.'),
('I002', 'Healthcare', 'Covers pharmaceuticals, medical devices, hospital management, and biotech advancements.'),
('I003', 'Finance', 'Encompasses banking, investment, insurance, fintech startups, and financial consulting.'),
('I004', 'Retail', 'Involves e-commerce, brick-and-mortar stores, fashion, and consumer goods distribution.'),
('I005', 'Entertainment', 'Focuses on film, music, gaming, digital media, and content production companies.');*/

--creating investment_rounds table
/*create table investment_rounds (
round_id varchar(10) primary key,
startup_id varchar(10),
round_type varchar(30),
round_date DATE,
total_funding decimal(15,2)
);*/

--inserting values into investment_rounds table
/*INSERT INTO investment_rounds (round_id, startup_id, round_type, round_date, total_funding) VALUES
('R001', 'ST1001', 'Seed', '2025-01-15', 250000.00),
('R002', 'ST1002', 'Series A', '2025-03-20', 1500000.00),
('R003', 'ST1003', 'Series B', '2025-06-10', 5000000.00),
('R004', 'ST1004', 'Series C', '2025-09-05', 12000000.00),
('R005', 'ST1005', 'Angel', '2025-11-22', 50000.00);*/

--creating feedback taable
/*create table feedback (
feedback_id varchar(10) primary key,
pitch_id varchar(10),
investor_id varchar(10),
score int,
comment text,
helpful BIT
);*/

--insert values into feedback
/*INSERT INTO feedback (feedback_id, pitch_id, investor_id, score, comment, helpful) VALUES
('F001', 'P001', 'INV8001', 8, 'Impressive pitch with strong market potential.', 1),
('F002', 'P002', 'INV8002', 6, 'Valuation seemed slightly high for the current stage.', 1),
('F003', 'P003', 'INV8003', 9, 'Clear and compelling business model, well-presented.', 1),
('F004', 'P004', 'INV8004', 5, 'Needs better clarity on revenue streams and scalability.', 0),
('F005', 'P005', 'INV8005', 7, 'Innovative idea but requires more traction evidence.', 1);*/

--creating followup table
/*create table follow_ups (
followup_id varchar(10) primary key,
pitch_id varchar(10),
followup_date DATE,
notes text
);*/

--inserting values into followups table
/*insert into follow_ups (followup_id, pitch_id, followup_date, notes)
values
('F001', 'P001', '2025-06-05', 'Investor requested a detailed financial projection.'),
('F002', 'P002', '2025-06-10', 'Startup provided additional market research insights.'),
('F003', 'P003', '2025-06-15', 'Investor scheduled a second meeting for further discussion.'),
('F004', 'P004', '2025-06-20', 'Negotiation ongoing regarding valuation adjustments.'),
('F005', 'P005', '2025-06-25', 'Startup refining pitch based on feedback received.');*/

--creating startup metrics table
/*create table startup_metrics (
metric_id varchar(10) primary key,
startup_id varchar(10),
revenue decimal(15,2),
burn_rate decimal(15,2),
growth_rate decimal(10,2),
recorded_on date
);*/


--inserting values into startup_metrics table
/*INSERT INTO startup_metrics (metric_id, startup_id, revenue, burn_rate, growth_rate, recorded_on) VALUES
('M001', 'ST1001', 1200000.00, 300000.00, 12.50, '2025-06-01'),
('M002', 'ST1002', 850000.00, 200000.00, 9.75, '2025-06-05'),
('M003', 'ST1003', 2400000.00, 500000.00, 15.20, '2025-06-10'),
('M004', 'ST1004', 4600000.00, 1200000.00, 18.00, '2025-06-15'),
('M005', 'ST1005', 600000.00, 150000.00, 8.30, '2025-06-20');*/

