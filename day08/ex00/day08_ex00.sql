--Сессия 1
BEGIN; -- инициирует транзакцию
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut' FOR UPDATE; --определяет строки, которые будут затронуты, и блокирует их
UPDATE pizzeria SET rating = 5  WHERE pizzeria.name = 'Pizza Hut'; --обновляет рейтинг
--Сессия 2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; --рейтинг не обновлен
--Сессия 1
COMMIT; --фиксирует транзакцию
--Сессия 2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; --ретинг обновлен
