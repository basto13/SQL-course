-- 1. Создайте представление, в которое попадет информация о пользователях (имя, фамилия,
-- город и пол), которые не старше 20 лет.
USE sem_4;
SELECT * FROM users;
SELECT * FROM profiles;

CREATE OR REPLACE VIEW young_users AS
SELECT 
u.id,
CONCAT(firstname, ' ', lastname) AS name
FROM users u
	inner join profiles p on u.id = p.user_id
WHERE timestampdiff(YEAR, birthday, now()) < 20
group by u.id;

SELECT * FROM young_users;

-- 2. Найдите кол-во, отправленных сообщений каждым пользователем и выведите
-- ранжированный список пользователей, указав имя и фамилию пользователя, количество
-- отправленных сообщений и место в рейтинге (первое место у пользователя с максимальным
-- количеством сообщений) . (используйте DENSE_RANK)

SELECT * FROM messages;
SELECT * FROM users;

SELECT 
from_user_id AS id, 
CONCAT(firstname, ' ', lastname) AS user_name,
count(*) AS messages_amount,
DENSE_RANK() OVER(ORDER BY count(*) desc) AS 'rank'
FROM messages m
	JOIN users u ON m.from_user_id = u.id
GROUP BY id;

-- 3. Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления
-- (created_at) и найдите разницу дат отправления между соседними сообщениями,
-- получившегося списка. (используйте LEAD или LAG)

