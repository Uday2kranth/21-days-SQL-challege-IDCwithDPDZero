SELECT *FROM patients ;
SELECT satisfaction from patients where name = 'Julia Torres';
SELECT name,satisfaction  FROM patients WHERE satisfaction >=96 ORDER BY satisfaction ASC limit 10;