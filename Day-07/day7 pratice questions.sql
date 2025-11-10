SELECT * FROM staff_schedule;
SELECT * FROM services_weekly;
SELECT * FROM patients;
--  Practice Questions:

-- 1. Find services that have admitted more than 500 patients in total.
SELECT service , COUNT(*) AS admit_count FROM patients  GROUP BY SERVICE  HAVING Count(*) > 500 ;
SELECT service , COUNT(*) AS admit_count FROM patients  where service = 'surgery' GROUP BY SERVICE  HAVING Count(*) < 500 ;


-- 2. Show services where average patient satisfaction is below 75.
SELECT service, AVG(satisfaction) as avg_satifaction_score FROM  patients  GROUP BY service  Having AVG(satisfaction) <75;

-- 3. List weeks where total staff presence across all services was less than 50.
SELECT week , SUM(present) total_weekly_presents_staff  FROM  staff_schedule GROUP BY  week HAVING SUM (present) < 50;