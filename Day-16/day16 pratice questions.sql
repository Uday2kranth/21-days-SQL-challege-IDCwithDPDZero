-- Find patients who are in services with above-average staff count.
-- PART 4: The Final Goal (Select Patients)
SELECT * FROM patients ;
SELECT * FROM staff_schedule ;
SELECT * FROM services_weekly ;
select * from staff;


SELECT * FROM patients 
WHERE service IN (
    SELECT service 
    FROM staff_schedule 
    GROUP BY service 
    -- "Having the count of this service..."
    HAVING COUNT(staff_id) > (
        -- "...greater than the average count of ALL services"
        SELECT AVG(my_count) FROM (
            SELECT COUNT(staff_id) AS my_count 
            FROM staff_schedule 
            GROUP BY service
        ) AS subquery
    )
);

-- List staff who work in services that had any week with patient satisfaction below 70.

select * from staff where service  IN (select  service from services_weekly where patient_satisfaction<70);
SELECT * FROM staff 
WHERE service IN (
    SELECT service 
    FROM services_weekly 
    WHERE patient_satisfaction < 70
);
-- Show patients from services where total admitted patients exceed 1000.
select service,sum(patients_admitted) from services_weekly group by service having sum(patients_admitted )>1000;
-- Show patients from services where total admitted patients exceed 1000.

select * from patients where service in (select service from services_weekly group by service having sum(patients_admitted )>1000)