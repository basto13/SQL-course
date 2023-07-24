-- Home task Sem_4
-- Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.

select u.id,
	(select count(*) 
    from media m 
    inner join likes l on l.media_id = m.id 
    where m.user_id = u.id) AS 'likes_amount'
from users u
	inner join profiles p on u.id = p.user_id
where timestampdiff(YEAR, birthday, now()) < 12;

select m.user_id, count(*)
	from users u
		inner join profiles p on u.id = p.user_id
        inner join media m on m.user_id = u.id
        inner join likes l on l.media_id = m.id
where timestampdiff(YEAR, birthday, now()) < 12
group by m.user_id;

SELECT * FROM likes;
SELECT * FROM users;
SELECT * FROM media;
SELECT * FROM profiles;
SELECT * FROM messages;

/* 2. Определить кто больше поставил лайков (всего): мужчины или
 женщины. 
*/
SELECT gender,
	(SELECT count(*) FROM profiles p
	JOIN likes l 
	WHERE p.user_id=l.user_id and p.gender = p1.gender) AS 'likes_amount'
FROM profiles p1
GROUP BY gender;

-- 3. Вывести всех пользователей, которые не отправляли сообщения.

SELECT id FROM users EXCEPT SELECT from_user_id from messages;

SELECT id, 
CONCAT(firstname, ' ', lastname) AS user_name
from users
where id in (SELECT id FROM users EXCEPT SELECT from_user_id from messages);

SELECT id, CONCAT(firstname, ' ', lastname) AS user_name
FROM users
WHERE (id not in (select from_user_id from messages group by from_user_id));




