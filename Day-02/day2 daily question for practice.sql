-- Find all patients who are older than 60 years.
select * from patients where age>60;

-- Retrieve all staff members who work in the 'Emergency' service.
select staff_name from staff where service = 'emergency';

-- List all weeks where more than 100 patients requested admission in any service.
select service from services_weekly where  patients_request>100;
