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
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; --рейтинг равен 4
--Сессия 2
UPDATE pizzeria SET rating = 3.6  WHERE pizzeria.name = 'Pizza Hut'; --обновляет рейтинг
COMMIT; --фиксирует транзакцию
--Сессия 1
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; --рейтинг обновлен и равен 3.6
COMMIT; --фиксирует транзакцию
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; --рейтинг равен 3.6
--Сессия 2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; --рейтинг равен 3.6
