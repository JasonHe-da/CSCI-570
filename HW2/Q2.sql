 -- Q2
 -- DB Software used online website : ideone.com
 -- with SQLite
 
SELECT count(symptom_id) as num, symptom_id 
FROM Symptom 
GROUP BY symptom_id 
ORDER BY num desc 
LIMIT 1;