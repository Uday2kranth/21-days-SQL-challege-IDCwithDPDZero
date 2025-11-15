-- Question: Analyze the event impact by comparing weeks with events vs weeks without events.
-- Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction,
-- and average staff morale. Order by average patient satisfaction descending.
select
	CASE
		WHEN event='none' OR event IS NULL THEN 'NO event'
		ELSE 'with event'
	END AS event_status,
	COUNT(*) AS Count_of_weeks,
	AVG(patient_satisfaction) AS average_satisfaction,
	AVG(staff_morale)  AS avg_morale
FROM services_weekly 
GROUP BY 
		CASE
			WHEN event='none' OR event IS NULL THEN 'NO event'
			ELSE 'with event'
		END 
ORDER BY AVG(patient_satisfaction) DESC ;


