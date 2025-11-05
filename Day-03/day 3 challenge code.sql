
-- Question: Retrieve the top 5 weeks with the highest patient refusals across all services, showing week, service, patients_refused, and patients_request. Sort by patients_refused in descending order.
SELECT week,service,patients_refused,patients_request 
FROM services_weekly ORDER BY patients_refused DESC LIMIT 5;