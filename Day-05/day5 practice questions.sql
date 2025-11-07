SELECT * FROM Services_weekly;

-- 1. Count the total number of patients in the hospital.

SELECT COUNT(*) FROM patients;
-- 2. Calculate the average satisfaction score of all patients.
SELECT AVG(satisfaction) from patients;
-- 3. Find the minimum and maximum age of patients.
SELECT MIN(age) AS youngest ,MAX(age) AS oldest from patients;
