SELECT menu.pizza_name, pizzeria.name
FROM menu
JOIN pizzeria
ON menu.pizzeria_id=pizzeria.id
JOIN person_order
ON person_order.menu_id=menu.id
JOIN person
ON person_order.person_id=person.id AND (person.name='Denis' OR person.name='Anna')
ORDER BY 1,2;
