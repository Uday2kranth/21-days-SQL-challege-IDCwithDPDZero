-- Find all patients who were admitted to services that had at least one week where patients were refused 
-- AND the average patient satisfaction for that service was below the overall hospital average satisfaction.
-- Show patient_id, name, service, and their personal satisfaction score.

SELECT 
    patient_id, 
    name, 
    service, 
    satisfaction
FROM 
    patients
WHERE 
    service IN (
        SELECT service 
        FROM services_weekly 
        GROUP BY service
        HAVING 
            MAX(patients_refused) > 0 AND AVG(patient_satisfaction) < (
                SELECT AVG(patient_satisfaction) 
                FROM services_weekly
            )
    );