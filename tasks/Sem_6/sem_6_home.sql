/*1. Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с
помощью которой можно переместить любого (одного) пользователя из таблицы
users в таблицу users_old. (использование транзакции с выбором commit или rollback
– обязательно).
*/

use sem_4;
SELECT * FROM users;

DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old LIKE users;

-- проверка создания пустой таблицы
SELECT * FROM users_old;

DROP PROCEDURE IF EXISTS moveUser;

-- создание процедуры
DELIMITER //
CREATE PROCEDURE  moveUser (IN user_id_move INT) 
BEGIN
-- создание транзакции
START TRANSACTION;
INSERT INTO users_old (firstname, lastname, email) 
SELECT firstname, lastname, email 
  FROM users 
  WHERE users.id = user_id_move;
DELETE FROM users 
  WHERE id = user_id_move;
COMMIT;
END//
DELIMITER ;
-- вызов процедуры
CALL moveUser(1);

/* 2. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в
зависимости от текущего времени суток. С 6:00 до 12:00 функция должна
возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать
фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй
ночи".
*/

DROP FUNCTION IF EXISTS hello;

DELIMITER //
CREATE FUNCTION hello()
RETURNS TINYTEXT DETERMINISTIC
BEGIN
	DECLARE hour INT;
    SET hour = HOUR(NOW());
    CASE 
		WHEN hour BETWEEN 0 AND 5 THEN RETURN "Доброй ночи";
		WHEN hour BETWEEN 6 AND 11 THEN RETURN "Доброе утро";
		WHEN hour BETWEEN 12 AND 17 THEN RETURN "Добрый день";
		WHEN hour BETWEEN 18 AND 23 THEN RETURN "Добрый вечер";
    END CASE;
END//
DELIMITER ;

SELECT NOW(), hello();