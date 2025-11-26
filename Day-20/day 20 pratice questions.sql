SELECT
    service,
    week,
    patients_admitted,
    SUM(patients_admitted) OVER (
        PARTITION BY service
        ORDER BY week
    ) AS cumulative_admissions
FROM services_weekly
ORDER BY service, week;

SELECT
    service,
    week,
    patient_satisfaction,
    ROUND(AVG(patient_satisfaction) OVER (
        PARTITION BY service
        ORDER BY week
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW    ), 2) AS moving_avg_3week
FROM services_weekly
ORDER BY service, week;
-- 1. Calculate running total of patients admitted by week for each service.


select service,week, patients_admitted , sum(patients_admitted) over (partition by service order by week ) as comulative_admission from services_weekly 
order by service ,week;
-- 2. Find the moving average of patient satisfaction over 4-week periods.
select service, week , patient_satisfaction , round(avg( patient_satisfaction) over
( partition by service order by  week  rows between 3 preceding and current row),2)
as moving_avg_week4 from services_weekly order by service,week;
-- 3. Show cumulative patient refusals by week across all services.
select service,week , patients_refused ,sum(patients_refused) over 
( partition by service  order by week) as comulative_refused  from services_weekly order by service,week;