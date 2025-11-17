-- 1. Join patients and staff based on their common service field (show patient and staff who work in same service).
-- SELECT * from patients;
-- select * from staff;
SELECT 
	p.patient_id,
	p.name as patient_name,
	p.service as patients_Services,
	s.staff_id,
	s.staff_name,
	s.role,
	s.service as staff_services
FROM 
	patients p 
INNER JOIN 
	staff s ON p.service = s.service;
	
-- 2. Join services_weekly with staff to show weekly service data with staff information.
-- Select * from services_weekly;

SELECT 
	sw.week,sw.service,s.staff_id,s.role 
FROM 
	services_weekly sw 
INNER JOIN  
	staff s ON sw.service = s.service;
-- 3. Create a report showing patient information along with staff assigned to their service.
SELECT 
	* 
FROM  
	patients p 
INNER JOIN 
	staff s 
ON 
	p.service=s.service;