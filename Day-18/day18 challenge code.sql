 -- Create a comprehensive personnel and patient list showing: identifier (patient_id or staff_id), 
 -- full name, type ('Patient' or 'Staff'), and associated service. Include only those in 'surgery' 
 -- or 'emergency' services. Order by type, then service, then name.
 SELECT 
 	patient_id AS id_of_person,
	name AS  full_name,
	'patient' AS type,
	service
 FROM 
 	patients
 WHERE service ='surgery' OR service='emergency'
 UNION ALL
 SELECT 
 	staff_id,
	staff_name,
	'staff' AS type ,
	service
 FROM  
 	staff
 where service='surgery' OR service 'emergency'
 ORDER BY 
 	type,
	service,
	full_name;