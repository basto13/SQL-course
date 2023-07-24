SELECT * FROM staff
ORDER BY age;

SELECT * FROM staff
ORDER BY firstname;

SELECT firstname, lastname, age FROM staff
ORDER BY firstname DESC; 

SELECT * FROM staff
ORDER BY firstname DESC, age DESC;

SELECT DISTINCT firstname FROM staff ORDER BY firstname;
SELECT * FROM staff 
ORDER BY id
LIMIT 4, 3;

SELECT * FROM staff 
ORDER BY id DESC
LIMIT 2, 3;

SELECT COUNT(*) FROM STAFF
WHERE post = 'рабочий';

SELECT AVG(age) FROM staff AS avg_age WHERE salary > 30000;

SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM staff;

SELECT staff_id, SUM(count_pages) 
FROM activity_staff 
GROUP BY staff_id;

SELECT * FROM activity_staff;
SELECT date_activity, AVG(count_pages)
FROM activity_staff
GROUP BY date_activity;

SELECT man_age, SUM(salary)
FROM 
(
SELECT salary, 
CASE
	WHEN age < 20 THEN 'младше 20'
    WHEN age BETWEEN 20 AND 40 THEN 'от 20 до 40 лет'
    WHEN age > 40 THEN 'старше 40 лет'
    ELSE 'undefined'
END AS man_age
FROM staff) AS my_table
GROUP BY man_age;

SELECT staff_id FROM activity_staff
GROUP BY staff_id
HAVING SUM(count_pages) > 500;

SELECT date_activity, COUNT(count_pages) AS employees_worked FROM activity_staff
GROUP BY date_activity
HAVING employees_worked > 3;

SELECT post, AVG(salary) AS avg_salary FROM staff
GROUP BY post
HAVING avg_salary > 30000;


-- home task
SELECT * FROM staff
ORDER BY salary; 

SELECT * FROM staff
ORDER BY salary DESC; 

SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5; 

SELECT post, SUM(salary) 
FROM staff 
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(post) FROM staff
WHERE post = 'рабочий' AND age BETWEEN 24 and 49;

-- Найдите количество специальностей
SELECT COUNT(DISTINCT post) as post_amount from staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT post, AVG(age) as avg_age FROM staff
GROUP BY post
HAVING avg_age > 40;


