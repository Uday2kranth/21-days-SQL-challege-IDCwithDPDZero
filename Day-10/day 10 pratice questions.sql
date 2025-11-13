-- Practice Questions:
-- Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
SELECT *,
	CASE WHEN satisfaction >= 80 THEN 'High' 
	WHEN satisfaction >= 65 THEN 'Medium' 
	ELSE 'Low'
	END AS satisfaction_category
FROM patients;
-- Label staff roles as 'Medical' or 'Support' based on role type.
SELECT role FROM staff group by role;
SELECT *,
CASE
	WHEN role = 'nurse' THEN 'Medical' 
	WHEN role = 'doctor' THEN 'Medical'
	ELSE 'Support'
	END	AS role_Cat
FROM staff ;
-- Create age groups for patients (0-18, 19-40, 41-65, 65+).
SELECT *,
CASE
	WHEN age BETWEEN 0 AND 18 THEN 'minor'
	WHEN age BETWEEN 19 AND 40 THEN 'major'
	WHEN age BETWEEN 41 AND 65 THEN 'Adult'
	ELSE 'Seniors'
	END AS age_group
FROM patients;