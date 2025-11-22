-- Question: Create a report showing each service with: service name, total patients admitted,
-- the difference between their total admissions and the average admissions across all services,
-- and a rank indicator ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.
SELECT service,sum(patients_admitted) as total_admitted,
sum(patients_admitted)-(select avg(total_count)
from (
select sum(patients_admitted) as total_count
from services_weekly 
group by service
) as diff_of_total_and_avg_admision
) as admission_differnece ,
case when sum(patients_admitted)> (select avg(total_count)
from (
select sum(patients_admitted) as total_count
from services_weekly 
group by service) )then 'above average'
when sum(patients_admitted)<(select avg(total_count)
from (
select sum(patients_admitted) as total_count
from services_weekly 
group by service)) then 'below average'
else 'average'
end as rank_indicator
from services_weekly 
group by service 
order by total_admitted desc;