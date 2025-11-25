-- For each service, rank the weeks by patient satisfaction score (highest first).
-- Show service, week, patient_satisfaction, patients_admitted, and the rank. 
-- Include only the top 3 weeks per service.


SELECT * FROM  ( SELECT service ,week,patient_satisfaction,
RANK() OVER (PARTITION BY service ORDER BY  patient_satisfaction) AS sat_rank FROM services_weekly  ) AS top_3_weeks_per_service WHERE sat_rank<=3;






