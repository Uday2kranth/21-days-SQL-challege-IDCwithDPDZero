
-- Find all patients admitted to 'Surgery' service with a satisfaction score below 70, showing their patient_id, name, age, and satisfaction score.
select patient_id,name,age,satisfaction from patients where satisfaction <70  and service='surgery';