--Сессия 1
BEGIN; -- инициирует транзакцию.
--Сессия 2
BEGIN; -- инициирует транзакцию.
--Сессия 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; --устанавливает уровень изоляции READ COMMITTED
--Сессия 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;--устанавливает уровень изоляции READ COMMITTED
--Сессия 1
SHOW TRANSACTION ISOLATION LEVEL; --показывает уровень изоляции
--Сессия 2
SHOW TRANSACTION ISOLATION LEVEL; --показывает уровень изоляции
--Сессия 1
SELECT SUM(rating) FROM pizzeria; --показывает сумму рейтинга 21.9
--Сессия 2
UPDATE pizzeria SET rating = 1  WHERE pizzeria.name = 'Pizza Hut'; --обновляет рейтинг
COMMIT; --фиксирует транзакцию
--Сессия 1
SELECT SUM(rating) FROM pizzeria; --показывает сумму рейтинга уже обновлённую 19.9
COMMIT; --фиксирует транзакцию
SELECT SUM(rating) FROM pizzeria; --показывает сумму рейтинга 19.9
--Сессия 2
SELECT SUM(rating) FROM pizzeria; --показывает сумму рейтинга 19.9

