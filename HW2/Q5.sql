 -- Q5
 -- DB Software used online website : ideone.com
 -- with SQLite
 WITH NoAllMeetingsAttendends as(
	SELECT employee_id,meeting_id
	FROM Employee
	CROSS JOIN ( SELECT DISTINCT meeting_id FROM Meeting) as UniqueNames
	EXCEPT
	SELECT employee_id,meeting_id
	FROM EmployeeMeeting
 )
 
 SELECT DISTINCT employee_id
 FROM Employee
 
 EXCEPT
 
 SELECT DISTINCT employee_id
 FROM NoAllMeetingsAttendends;


-- Question: find all employees who attend all meetings existing.
-- Division operation in sql with subquery:
-- The sentence will do find all employees who attend all the meetings.
-- The logic behind it:
-- All the employees / desired meeting session = the employee with all desired meeting
-- Expected result:
-- employee_id 101 (employee Jason attends all the 3 meetings). 