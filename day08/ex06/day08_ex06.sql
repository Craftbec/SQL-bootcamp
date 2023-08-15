--Сессия 1
BEGIN; -- инициирует транзакцию.
--Сессия 2
BEGIN; -- инициирует транзакцию.
--Сессия 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; --устанавливает уровень изоляции REPEATABLE READ
--Сессия 2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;--устанавливает уровень изоляции REPEATABLE READ
--Сессия 1
SHOW TRANSACTION ISOLATION LEVEL; --показывает уровень изоляции
--Сессия 2
SHOW TRANSACTION ISOLATION LEVEL; --показывает уровень изоляции
--Сессия 1
SELECT SUM(rating) FROM pizzeria; --показывает сумму рейтинга 19.9
--Сессия 2
UPDATE pizzeria SET rating = 5  WHERE pizzeria.name = 'Pizza Hut'; --обновляет рейтинг
COMMIT; --фиксирует транзакцию
--Сессия 1
SELECT SUM(rating) FROM pizzeria; --показывает сумму рейтинга 19.9, обновлений не видно
COMMIT; --фиксирует транзакцию
SELECT SUM(rating) FROM pizzeria; --показывает сумму рейтинга обновлённую 23.9
--Сессия 2
SELECT SUM(rating) FROM pizzeria; --показывает сумму рейтинга обновлённую 23.9
