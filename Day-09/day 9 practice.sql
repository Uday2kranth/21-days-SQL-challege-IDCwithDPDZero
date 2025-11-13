--   ### Practice Questions:


-- 1. Extract the year from all patient arrival dates.
--  we can use both date_part or else EXTRACT to answer the same query
SELECT *, date_part('year',arrival_date) as patient_arrival_by_year from patients;
SELECT EXTRACT(YEAR FROM arrival_date) as patient_arrival_by_year FROM  patients;
-- to make sense of the only dates i have taken liberty of the adding the names arrival_date 
SELECT name,arrival_date, EXTRACT(YEAR FROM arrival_date)  FROM patients ;

-- 2. Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT name ,age(departure_date, arrival_date) AS length_of_stay_patients from patients;


-- 3. Find all patients who arrived in a specific month.
SELECT name FROM patients WHERE date_part('month', arrival_date) = '06' ;  


SELECT * FROM patients
WHERE EXTRACT(MONTH FROM arrival_date) = 8;




