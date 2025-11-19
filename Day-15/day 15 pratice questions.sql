-- 1. Join patients, staff, and staff_schedule to show patient service and staff availability.
select count(s.staff_id)AS available_staff,p.patient_id,p.service,p.name,ss.present
from 
	patients p join staff s on  p.service=s.service
left join staff_schedule ss on ss.staff_id =s.staff_id  
AND EXTRACT(WEEK FROM p.arrival_date) = ss.week where ss.present=1 
group by  p.patient_id,p.service,p.name ,ss.present;
-- 2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
-- select  * from staff join   staff_schedule on staff.staff_id =staff_schedule.staff_id
-- left join services_weekly on services_weekly.service = staff.service and services_weekly.week = staff_schedule.week ;
SELECT 
    p.patient_id,
    p.name AS patient_name,
    s.staff_name AS staff_available,
    s.service
FROM 
    patients p 
JOIN 
    staff s ON p.service = s.service
LEFT JOIN 
    staff_schedule ss ON s.staff_id = ss.staff_id 
    AND EXTRACT(WEEK FROM p.arrival_date) = ss.week 
WHERE 
    ss.present = 1;

-- 3. Create a multi-table report showing patient admissions with staff information.
Select sw.week,ss.week, sw.service ,sw.patients_admitted,ss.staff_id,ss.role,ss.service
from staff_schedule ss join services_weekly sw on ss.service =sw.service and sw.week =ss.week;


-- select * from patients;
-- select * from staff;
-- select * from staff_schedule;
-- select * from services_weekly;