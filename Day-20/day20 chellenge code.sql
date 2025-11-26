 -- Create a trend analysis showing for each service and week: week number, patients_admitted, running total of
 -- patients admitted (cumulative), 3-week moving average of patient satisfaction (current week and 2 prior weeks),
 -- and the difference between current week admissions and the service average. Filter for weeks 10-20 only.
 SELECT 
    service,
    week,
    patients_admitted,
    running_total,
    ROUND(moving_avg_sat, 2) AS moving_avg_sat,
    (patients_admitted - service_avg) AS admission_diff_vs_avg
FROM (
    SELECT 
        service,
        week,
        patients_admitted,
        patient_satisfaction,
        SUM(patients_admitted) OVER (
            PARTITION BY service 
            ORDER BY week
        ) AS running_total,
        AVG(patient_satisfaction) OVER (
            PARTITION BY service 
            ORDER BY week 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS moving_avg_sat,
        AVG(patients_admitted) OVER (
            PARTITION BY service
        ) AS service_avg
    FROM services_weekly
) AS trend_stats
WHERE 
    week BETWEEN 10 AND 20 
ORDER BY 
    service, week;
