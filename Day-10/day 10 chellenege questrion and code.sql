-- Daily Challenge:
-- Question: Create a service performance report showing service name, total patients admitted, 
-- and a performance category based on the following:
-- 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'.
-- Order by average satisfaction descending.
SELECT * FROM services_weekly ;
SELECT   service ,SUM(patients_admitted) AS total_Patient_admitts,
CASE 
	WHEN AVG(patient_satisfaction) >=85 THEN 'Excellent' 
	WHEN AVG(patient_satisfaction) >= 75 THEN 'Good' 
	WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair' 
	ELSE 'Need Improvement' 
	END AS performance_category
FROM services_weekly GROUP BY service Order by AVG(patient_satisfaction) DESC;

