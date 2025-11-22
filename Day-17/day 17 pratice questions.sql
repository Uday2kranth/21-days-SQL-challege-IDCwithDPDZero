-- ### Practice Questions:
select * from patients;
select * from services_weekly;
-- 1. Show each patient with their service's average satisfaction as an additional column.
select *,(select AVG(satisfaction) as AVG_satisfaction_patients from patients p1 where p1.service=p2.service ) from patients p2;
-- 2. Create a derived table of service statistics and query from it.
select service,Total_rejected,total_admitted, total_requested from 
(select service ,sum(patients_refused) as Total_rejected,sum(patients_request) as total_requested,
sum(patients_admitted) as total_admitted ,AVg(patient_satisfaction) as avg_score from services_weekly group by service ) as services_stats;

-- 3. Display staff with their service's total patient count as a calculated field.

select *, (select  SUM(patients_admitted) from services_weekly where staff.service=services_weekly.service) as total_patient_by_service from staff;