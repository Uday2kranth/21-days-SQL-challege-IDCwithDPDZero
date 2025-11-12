--  ### Daily Challenge:

-- **Question:** Calculate the average length of stay (in days) for each service, 
-- showing only services where the average stay is more than 7 days.
-- Also show the count of patients and order by average stay descending.

SELECT service , count(*) as Patients_count_per_service, AVG(departure_date-arrival_date) AS  AVg_stay_length FROM patients
GROUP BY service HAVING AVG(departure_date-arrival_date) >7 ORDER BY AVg_stay_length DESC;

