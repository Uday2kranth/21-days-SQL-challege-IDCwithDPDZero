-- day 3 # practice questions
-- 1. List all patients sorted by age in descending order.
SELECT * FROM patients ORDER BY age DESC;
-- 2. Show all services_weekly data sorted by week number ascending and patients_request descending.
<<<<<<< HEAD
SELECT * FROM services_weekly ORDER BY week  ASC , patients_request DESC;
=======
SELECT * FROM services_weekly ORDER BY week DESC , patients_request ASC;
>>>>>>> 01ecc43aa38743b4102a87f072e42a1157fcb528
-- 3. Display staff members sorted alphabetically by their names.
SELECT staff_name FROM staff ORDER BY staff_name ASC;
