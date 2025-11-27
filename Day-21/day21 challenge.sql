--  Create a comprehensive hospital performance dashboard using CTEs. Calculate: 1) Service-level metrics (total admissions, refusals,
-- avg satisfaction), 2) Staff metrics per service (total staff, avg weeks present), 3) Patient demographics per service (avg age, count). 
-- Then combine all three CTEs to create a final report showing service name, all calculated metrics, 
-- and an overall performance score (weighted average of admission rate and satisfaction). Order by performance score descending.
WITH service_metrics AS (
    SELECT
        service,
        SUM(patients_admitted) AS total_admitted,
        SUM(patients_refused) AS total_refused,
        AVG(patient_satisfaction) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
),
staff_metrics AS (
    SELECT
        service,
        COUNT(staff_id) AS total_staff,
        AVG(COALESCE(present_count, 0)) AS avg_weeks_present
    FROM (
        SELECT service, staff_id, COUNT(week) AS present_count
        FROM staff_schedule
        GROUP BY service, staff_id
    ) AS internal_calc
    GROUP BY service
),
patient_demographics AS (
    SELECT
        service,
        COUNT(patient_id) AS patient_count,
        AVG(age) AS avg_patient_age
    FROM patients
    GROUP BY service
)
SELECT
    sm.service,
    sm.total_admitted,
    sm.total_refused,
    ROUND(sm.avg_satisfaction, 2) AS avg_satisfaction,
    stm.total_staff,
    ROUND(stm.avg_weeks_present, 1) AS avg_staff_weeks,
    pd.avg_patient_age,
    ROUND(
        (
            (sm.total_admitted * 100.0 / NULLIF(sm.total_admitted + sm.total_refused, 0)) * 0.5
        )
        +
        (
            sm.avg_satisfaction * 0.5
        )
    , 2) AS performance_score
FROM
    service_metrics sm
JOIN
    staff_metrics stm ON sm.service = stm.service
JOIN
    patient_demographics pd ON sm.service = pd.service
ORDER BY
    performance_score DESC;