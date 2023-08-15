(SELECT menu.pizza_name 
FROM menu
ORDER BY menu.pizza_name DESC)
UNION
(SELECT menu.pizza_name 
FROM menu);