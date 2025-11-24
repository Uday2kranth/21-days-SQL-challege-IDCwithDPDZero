--  UNION, UNION ALL, combining result sets
--  1. Combine patient names and staff names into a single list.
SELECT  
	name AS full_name,
	'patient' AS type ,
	service 
FROM 
	patients 
UNION ALL 
SELECT 
	staff_name AS full_name,
	'staff' AS type,
	service 
FROM staff 
ORDER BY service,type,full_name;
-- 2. Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
SELECT  name,patient_id,satisfaction, 'Highly_satisfied' as category FROM patients
WHERE satisfaction>=90 UNION SELECT patient_id,name,satisfaction,'Low_satisfaction' as category FROM patients
WHERE satisfaction<50 ORDER by satisfaction DESC;
-- 3. List all unique names from both patients and staff tables.
SELECT DISTINCT name as full_name , service FROM patients UNION  SELECT 
DISTINCT service ,staff_name as full_name from staff;
