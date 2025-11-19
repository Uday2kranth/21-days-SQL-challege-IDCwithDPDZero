-- Create a comprehensive service analysis report for week 20 showing: service name, 
-- total patients admitted that week, total patients refused, average patient satisfaction, 
-- count of staff assigned to service, and count of staff present that week. Order by patients admitted descending.
SELECT 
	sw.service,
	MAX(sw.patients_admitted) AS total_admitted ,
	MAX(sw.patients_refused) AS total_refused,
	AVG(sw.patient_satisfaction) AS AVG_satisfaction_score,
	COUNT(ss.staff_id) AS staff_assigned , 
	COALESCE(sum(ss.present),0) AS staff_present 
FROM 
	services_weekly sw  JOIN  staff_schedule ss ON ss.week=sw.week AND sw.service=ss.service 
WHERE 
	ss.week=20
GROUP BY 
		sw.service 
ORDER BY
		total_admitted DESC;
