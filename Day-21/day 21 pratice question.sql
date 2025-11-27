
-- 1. Create a CTE to calculate service statistics, then query from it.
with service_stats as ( select 
service,count(*) as total_patients,
avg(satisfaction) as avg_satisfaction from patients group by service   )
select * from service_stats order by avg_satisfaction desc ;
-- 2. Use multiple CTEs to break down a complex query into logical steps.
with service_totals as ( select service ,sum(patients_admitted) as total_admitted 
from services_weekly group by service),
hospital_benchmark as (
select avg(total_admitted) as avg_admitted from service_totals)
select st.service,st.total_admitted,hb .avg_admitted,
case  when st.total_admitted >hb.avg_admitted then 'busy' else 'quiet'
end as stauts
from service_totals st cross join hospital_benchmark hb;
)
-- 3. Build a CTE for staff utilization and join it with patient data.

with staff_details as ( 
select 
service , staff_name from staff 
)
select p.service , p.name,sd.service,sd.staff_name  from  patients p  join staff_details sd on  p.service=sd.service ;
-- select * from staff ;