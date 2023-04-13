SELECT DISTINCT school
FROM teachers;

SELECT DISTINCT school, salary
FROM teachers;

SELECT first_name, last_name, salary
FROM teachers
ORDER BY salary DESC;

SELECT last_name, school, hire_date
FROM teachers
ORDER BY school ASC, hire_date DESC;

SELECT first_name
FROM teachers
WHERE first_name LIKE 'sam%'; 

SELECT first_name
FROM teachers
WHERE first_name ILIKE 'sam%';

SELECT * FROM teachers
WHERE school = 'Myers Middle School' AND salary < 40000;
  
SELECT * FROM teachers
WHERE last_name = 'Cole'
OR last_name = 'Bush';

SELECT * FROM teachers
WHERE school = 'F.D. Roosevelt HS' 
AND (salary < 38000 OR salary > 40000);