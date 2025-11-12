--   ### Practice Questions:


-- 1. Extract the year from all patient arrival dates.
 SELECT *, date_part('year',arrival_date) as patient_arrival_by_year from patients;



-- 2. Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT name ,age(departure_date, arrival_date) AS length_of_stay_patients from patients;


-- 3. Find all patients who arrived in a specific month.
SELECT name FROM patients WHERE date_part('month', arrival_date) = '06' ;  


