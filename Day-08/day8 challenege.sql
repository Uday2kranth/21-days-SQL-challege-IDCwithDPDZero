-- Question: Create a patient summary that shows patient_id, full name in uppercase, service in lowercase,
-- age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. 
-- Only show patients whose name length is greater than 10 characters.

SELECT UPPER(patient_id) ,UPPER(name) , LOWER(service) ,
	CASE
		WHEN age >= 65 THEN 'Senior'
		WHEN age >= 18 THEN 'ADULT'
		ELSE 'Minor'
	END AS age_category,
	LENGTH(name) AS name_lenght	
from patients WHERE LENGTH(name) >10;