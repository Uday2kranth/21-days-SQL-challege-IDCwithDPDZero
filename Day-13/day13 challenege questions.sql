-- Question: Create a comprehensive report showing patient_id, patient name, age, service, and the total 
-- number of staff members available in their service. Only include patients from services that have more 
-- than 5 staff members. Order by number of staff descending, then by patient name.

SELECT 
    p.patient_id,
    p.name,
    p.age,
    p.service, 
    COUNT(s.staff_id) AS no_of_staff
FROM 
    patients p INNER JOIN staff s ON p.service = s.service 
GROUP BY  
    p.patient_id , p.name, p.age, p.service  HAVING COUNT(s.staff_id) >5 
ORDER BY 
    no_of_staff DESC,p.name;


-- SELECT * from patients;
-- SELECT * from staff_schedule;
-- select * from services_weekly;
-- select * from staff;
-- SELECT staff.service ,staff.role,services_weekly.week,services_weekly.patients_admitted FROM staff
-- INNER JOIN services_weekly ON staff.service = services_weekly.service;