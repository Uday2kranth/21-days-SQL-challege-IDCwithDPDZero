-- ### Practice Questions:
SELECT* from staff;
-- 1. Convert all patient names to uppercase.
SELECT UPPER(NAME) AS Patient_names_upper FROM patients;
-- 2. Find the length of each staff member's name.
SELECT LENGTH(staff_name) AS lenght_staff_name FROM staff;
-- 3. Concatenate staff_id and staff_name with a hyphen separator.
SELECT CONCAT(staff_id ,' - ', staff_name) AS staff_info FROM staff;