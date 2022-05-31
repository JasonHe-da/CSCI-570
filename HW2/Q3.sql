 -- Q3
 -- DB Software used online website : ideone.com
 -- with SQLite
SELECT count(Employee.employee_id) as sickest ,floor_number 
FROM Employee INNER JOIN Test ON Employee.employee_id = Test.employee_id 
where Test.test_result = 'positive' 
GROUP BY floor_number 
ORDER BY sickest desc LIMIT 1;