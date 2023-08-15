SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name_1, pizzeria_tmp.name AS pizzeria_name_2, menu.price AS price
FROM menu
JOIN (SELECT * FROM menu)AS menu_tmp ON menu.pizzeria_id>menu_tmp.pizzeria_id
JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
JOIN (SELECT * FROM pizzeria) AS pizzeria_tmp ON menu_tmp.pizzeria_id=pizzeria_tmp.id
WHERE menu.pizza_name=menu_tmp.pizza_name AND menu.price=menu_tmp.price
ORDER BY 1;