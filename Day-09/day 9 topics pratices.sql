-- Extract year from date example
-- # get the local date time or system time query 
SElECT CLOCK_TIMESTAMP(),
CURRENT_DATE,
CURRENT_TIME,
CURRENT_TIMESTAMP,
LOCALTIME,
LOCALTIMESTAMP
NOW;
SELECT CURRENT_TIMESTAMP();
--  extract the year form patient arrival_date and display the corresponding the patient name and id a
-- when you want to display the date time along with the timezone you go with the NOW;
SELECT * FROM patients;
-- # age 
SELECT name , arrival_date, departure_date , age(departure_date, arrival_date) AS count_of_patients_stay_in_days from patients;
SELECT patient_id,name , arrival_date, departure_date , age(departure_date, arrival_date) AS count_of_patients_stay_in_days from patients where patient_id ='PAT-09484753';
-- **Question:** Calculate the average length of stay (in days) for each service, 
-- showing only services where the average stay is more than 7 days.
-- Also show the count of patients and order by average stay descending.
SELECT  service, count(*)As patient_count  ,avg(age(departure_date,arrival_date)) as avg_stay FROM patients 
group by service having avg(age(departure_date,arrival_date)) >'7 days' order by  avg_stay DESC; -- almost correct but not exactly correct

SELECT
    service,
    COUNT(*) AS patient_count,
    -- This (date - date) gives an integer (days)
    -- AVG() of that integer gives a number, not a weird interval
    AVG(departure_date - arrival_date) AS avg_stay_in_days
FROM
    patients
GROUP BY
    service
HAVING
    AVG(departure_date - arrival_date) > 7 -- 1. Now you're comparing a number to a number. Easy.
ORDER BY
    avg_stay_in_days DESC; -- 2. Sorted from longest to shortest.


--  answer for same question but used the round functions 



SELECT 
    service,
    COUNT(patient_id) AS patient_count,
    ROUND(AVG(departure_date-arrival_date),0) AS avg_stay
FROM 
    patients
GROUP BY 
    service
HAVING 
    AVG(departure_date-arrival_date) > 7
ORDER BY 
    avg_stay DESC;
