-- ### Practice Questions:

select * from staff_schedule;
select * from staff;
select * from services_weekly;
select* from patients;
-- 1. Show all staff members and their schedule information (including those with no schedule entries).

SELECT 
	s.staff_id,
	s.staff_name,
	s.role,
	s.service,
	COUNT(ss.week) AS weeks_scheduled ,
	SUM(COALESCE(ss.present,0)) AS weeks_present
FROM staff s LEFT JOIN staff_schedule ss ON s.staff_id= ss.staff_id
	GROUP BY s.staff_name,s.staff_id,s.role,s.service;
-- 2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
SELECT DISTINCT sw.service, s.staff_name FROM  services_weekly sw LEFT JOIN  staff s ON sw.service=s.service;
-- 3. Display all patients and their service's weekly statistics (if available).
SELECT 	DISTINCT 
		p.name,
		sw.service,
		sw.patient_satisfaction,
		sw.patients_admitted 
FROM 
	patients p 	LEFT JOIN  services_weekly sw ON  p.service=sw.service;