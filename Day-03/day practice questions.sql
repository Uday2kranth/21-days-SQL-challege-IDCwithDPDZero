-- day 3 # 
-- 1. List all patients sorted by age in descending order.
select * from patients order by age desc;
-- 2. Show all services_weekly data sorted by week number ascending and patients_request descending.
select * from services_weekly order by week desc , patients_request asc;
-- 3. Display staff members sorted alphabetically by their names.
select staff_name from staff order by staff_name asc;
