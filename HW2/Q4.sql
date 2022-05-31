 --Q4
 -- DB Software used online website : ideone.com
 -- with SQLite
SELECT count(employee_id) as numforSymptom
FROM Symptom
WHERE date_reported BETWEEN '2021-10-01' AND '2021-10-11';
SELECT count(test_id) as positive
FROM TEST
WHERE test_result = 'positive' and test_date BETWEEN '2021-10-01' AND '2021-10-11';
SELECT count(test_id) as numtest
FROM TEST
WHERE test_date BETWEEN '2021-10-01' AND '2021-10-11';
SELECT count(scan_id) as numscan
FROM SCAN
WHERE scan_date BETWEEN '2021-10-01' AND '2021-10-11';