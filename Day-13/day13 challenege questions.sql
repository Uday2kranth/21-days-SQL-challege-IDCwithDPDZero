-- Question: Create a comprehensive report showing patient_id, patient name, age, service, and the total 
-- number of staff members available in their service. Only include patients from services that have more 
-- than 5 staff members. Order by number of staff descending, then by patient name.
SELECT p.patient_id,p.name,p.age,p.service, count(s.staff_id) as no_of_staff
FROM patients p INNER JOIN staff s on p.service = s.service 
group by  p.patient_id , p.name, p.age, p.service  having count(s.staff_id) >5 order by no_of_staff DESC,p.name;





-- SELECT * from patients;
-- SELECT * from staff_schedule;
-- select * from services_weekly;
-- select * from staff;
-- SELECT staff.service ,staff.role,services_weekly.week,services_weekly.patients_admitted FROM staff
-- INNER JOIN services_weekly ON staff.service = services_weekly.service;