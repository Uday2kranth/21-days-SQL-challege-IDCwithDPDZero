
-- Question: Calculate the total number of patients admitted, total patients refused, 
-- and the average patient satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.
SELECT COUNT(patients_admitted) AS total_patients_in,
COUNT(patients_refused) AS total_patients_out  , 
ROUND(AVG(patient_satisfaction),2) AS overall_avg_satisfaction 
FROM Services_weekly GROUP BY service, week ;