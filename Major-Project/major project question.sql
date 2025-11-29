select * from calls;
select * from alibis;
select * from employees;
select * from evidence;
select * from keycard_logs;
-- Who entered the CEO’s Office close to the time of the murder?
select e.employee_id,e.role,e.name,e.department, kl.room, kl.entry_time,kl.exit_time from employees e
inner join keycard_logs kl on e.employee_id=kl.employee_id 
where kl.room='CEO Office' and kl.entry_time between '2025-10-15 20:30:00' and '2025-10-15 21:00:00';
-- Who claimed to be somewhere else but was not?
select e.name ,kl.employee_id,kl.room,a.claimed_location,a.claim_time,a.claimed_location  from alibis a  join keycard_logs kl on 
a.employee_id = kl.employee_id inner join employees e on e.employee_id =a.employee_id 
where a.claim_time between kl.entry_time and kl.exit_time and a.claimed_location != kl.room;
-- Who made or received calls around 20:50–21:00?
-- 1	Identify where and when the crime happened
select room , found_time  from evidence where room like 'CEO Office' order by found_time limit 1;

-- Analyze who accessed critical areas at the time
select e.name, e.role, kl.room , kl.entry_time , kl.exit_time from keycard_logs kl 
inner join employees e on kl.employee_id = e.employee_id where kl.room ='CEO Office' 
and kl.entry_time between '2025-10-15 20:30:00' and '2025-10-15 21:00:00'
order by kl.entry_time;
-- Cross-check alibis with actual logs
SELECT 
    e.name, 
    kl.employee_id, 
    kl.room AS actual_location, 
    a.claimed_location AS story_location, 
    a.claim_time
FROM 
    alibis a 
JOIN 
    keycard_logs kl ON a.employee_id = kl.employee_id 
INNER JOIN 
    employees e ON e.employee_id = a.employee_id 
WHERE 
    a.claim_time BETWEEN kl.entry_time AND kl.exit_time 
    AND a.claimed_location != kl.room;
-- Investigate suspicious calls made around the time
select e.name as caller ,e2.name as receiver , c.caller_id ,c.receiver_id,c.call_time ,c.duration_sec from calls c join employees e on c.caller_id=e.employee_id
join employees e2 on c.receiver_id=e2.employee_id
where c.call_time between '2025-10-15 20:40:00' and '2025-10-15 21:00:00'; 
-- Match evidence with movements and claims
SELECT 
    e.name,
    e.employee_id,
    a.claim_time,
    a.claimed_location AS what_they_said,
    kl.room AS what_badge_logs_show,
    CASE 
        WHEN a.claimed_location = kl.room THEN 'Truth'
        ELSE 'LIE DETECTED' 
    END AS status
FROM 
    employees e
JOIN 
    alibis a ON e.employee_id = a.employee_id
JOIN 
    keycard_logs kl ON e.employee_id = kl.employee_id
WHERE 
    a.claim_time BETWEEN kl.entry_time AND kl.exit_time
ORDER BY 
    status ASC; 
-- Combine all findings to identify the killer(INTERSECT, multiple JOINs)
SELECT 
    e.name,
    e.employee_id,
    kl.room AS actual_location,
    c.duration_sec AS call_duration
FROM 
    employees e
JOIN keycard_logs kl ON e.employee_id = kl.employee_id
JOIN calls c ON e.employee_id = c.caller_id
JOIN alibis a ON e.employee_id = a.employee_id
WHERE 
    kl.room = 'CEO Office' -- <--- FIXED HERE
    AND c.call_time BETWEEN '2025-10-15 20:40:00' AND '2025-10-15 21:00:00'
    AND a.claimed_location != kl.room;