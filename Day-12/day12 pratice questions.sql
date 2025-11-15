-- ## Practice Questions:

-- 1. Find all weeks in services_weekly where no special event occurred.
SELECT
    service,
    week,
	event
FROM services_weekly
    WHERE event='none';

-- 2. Count how many records have null or empty event values.
SELECT
	 COUNT(*) from services_weekly where event is null or event ='';
-- 3. List all services that had at least one week with a special event.

select service,event from services_weekly where event is not null or event !='none';