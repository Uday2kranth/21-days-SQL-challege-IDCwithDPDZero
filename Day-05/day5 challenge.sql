-- Question: Calculate the total number of patients admitted, total patients refused, 
-- and the average patient satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.

SELECT SUM(patients_admitted) AS total_patients_admitted , SUM(patients_refused ) AS total_patient_refused, 
ROUND(AVG(patient_satisfaction),2) AS  AVG_patient_satisfaction FROM services_weekly;


