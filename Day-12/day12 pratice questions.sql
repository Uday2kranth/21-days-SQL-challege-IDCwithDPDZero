-- ## Practice Questions:

-- 1. Find all weeks in services_weekly where no special event occurred.
SELECT
    service,
    week,
	event
FROM services_weekly
WHERE event='none' AND event IS NULL;

-- 2. Count how many records have null or empty event values.
SELECT
	 COUNT(*) 
FROM  
	services_weekly 
WHERE event IS NULL OR event ='';
-- 3. List all services that had at least one week with a special event.

SELECT 
	service,event 
FROM 
	services_weekly 
WHERE event IS NOT NULL OR event !='none';