SELECT menu.pizza_name, pizzeria.name AS pizzeria_name, menu.price
FROM menu
JOIN pizzeria
ON menu.pizzeria_id=pizzeria.id AND (pizza_name='mushroom pizza' OR pizza_name='pepperoni pizza')
ORDER BY 1,2;
