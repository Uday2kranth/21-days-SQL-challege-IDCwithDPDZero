# Day-03 - SQL Challenge

## Challenge Description
<!-- Add the challenge description here -->
Question: Retrieve the top 5 weeks with the highest patient refusals across all services, showing week, service, patients_refused, and patients_request. Sort by patients_refused in descending order.

## Solution
<!-- Add your SQL solution here -->
SELECT week,service,patients_refused,patients_request 
FROM services_weekly ORDER BY patients_refused DESC LIMIT 5;
## Notes
<!-- Add any notes, learnings, or explanations here -->
i had good learning experience with the DESC and ASC and ORDER BY 
