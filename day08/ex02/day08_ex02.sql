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
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; --рейтинг равен 3.6
--Сессия 2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; --рейтинг равен 3.6
--Сессия 1
UPDATE pizzeria SET rating = 4  WHERE pizzeria.name = 'Pizza Hut'; -- --обновляет рейтинг
--Сессия 2
UPDATE pizzeria SET rating = 3.6  WHERE pizzeria.name = 'Pizza Hut'; --повторяемая транзакция не может изменять или блокировать строки, 
--измененные другими транзакциями после начала повторяемой транзакции
--Сессия 1
COMMIT; --фиксирует транзакцию
--Сессия 2
COMMIT; --фиксирует транзакцию, отказ
--Сессия 1 
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; --рейтинг обновлен и равен 4
--Сессия 2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; --рейтинг обновлен и равен 4
