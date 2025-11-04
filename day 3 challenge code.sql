
-- Question: Retrieve the top 5 weeks with the highest patient refusals across all services, showing week, service, patients_refused, and patients_request. Sort by patients_refused in descending order.
select service ,patients_request, patients_refused, week from services_weekly order by week desc limit 5;