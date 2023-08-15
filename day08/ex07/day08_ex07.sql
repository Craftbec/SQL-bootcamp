--Сессия 1
BEGIN; -- инициирует транзакцию
--Сессия 2
BEGIN; -- инициирует транзакцию
--Сессия 1
UPDATE pizzeria SET rating = 1  WHERE id=1; --yстанавливает рейтинг пиццерии с id=1
--Сессия 2
UPDATE pizzeria SET rating = 2  WHERE id=2; --yстанавливает рейтинг пиццерии с id=2
--Сессия 1
UPDATE pizzeria SET rating = 2  WHERE id=2; --yстанавливает рейтинг пиццерии с id=2
--Сессия 2
UPDATE pizzeria SET rating = 1  WHERE id=1; --yстанавливает рейтинг пиццерии с id=1
--происходит взаимоблокировка
--Сессия 1
COMMIT; --фиксирует транзакцию
--Сессия 2
COMMIT; --фиксирует транзакцию, отказ