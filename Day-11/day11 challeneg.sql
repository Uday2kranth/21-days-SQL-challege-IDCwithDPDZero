-- SELECT * from services_weekly;
-- Find all unique combinations of service and event type from the services_weekly table where events are not null or none,
--  along with the count of occurrences for each combination. Order by count descending.


select DISTINCT service, event ,COUNT(*) as event_count FROM services_weekly where event !='none' and event IS NOT NULL
GROUP BY service,event
ORDER BY event_count DESC;
