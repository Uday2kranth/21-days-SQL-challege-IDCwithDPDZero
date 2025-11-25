-- 1. Rank patients by satisfaction score within each service.
Select patient_id,name,service,satisfaction,
rank() over (partition by service order by satisfaction desc) as rank_patients
from patients;
-- 2. Assign row numbers to staff ordered by their name.
select * , row_number() over (order by staff_name desc) as row_num from staff;
-- 3. Rank services by total patients admitted.
SELECT  service , RANK() OVER ( ORDER BY SUM(patients_admitted) DESC) AS ranK_service FROM services_weekly GROUP BY service;



SELECT
    patient_id,
    name,
    service,
    satisfaction,
    ROW_NUMBER() OVER (PARTITION BY service ORDER BY satisfaction DESC) AS row_num
FROM patients;
select * from services_weekly;