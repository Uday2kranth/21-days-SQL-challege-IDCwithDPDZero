-- ### Practice Questions:

select * from staff_schedule;
select * from staff;
select * from services_weekly;
select* from patients;
-- 1. Show all staff members and their schedule information (including those with no schedule entries).

select s.staff_id,
s.staff_name,
s.role,
s.service, count(ss.week) AS weeks_scheduled ,
sum(coalesce(ss.present,0)) AS weeks_present
from staff s left join staff_schedule ss on s.staff_id= ss.staff_id
group by s.staff_name,s.staff_id,s.role,s.service;
-- 2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
select distinct sw.service, s.staff_name from services_weekly sw left join staff s on sw.service=s.service;
-- 3. Display all patients and their service's weekly statistics (if available).
select distinct p.name,sw.service,sw.patient_satisfaction,sw.patients_admitted from patients p left join services_weekly sw on p.service=sw.service;