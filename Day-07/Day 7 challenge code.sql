-- ### Daily Challenge:

 -- Identify services that refused more than 100 patients in total and 
 -- had an average patient satisfaction below 80.Show service name, total refused, and average satisfaction.
 SELECT service,SUM(patients_refused),AVG(patient_satisfaction) FROM services_weekly 
 GROUP BY service HAVING SUM(patients_refused) > 100 and AVG(patient_satisfaction)<80 ;