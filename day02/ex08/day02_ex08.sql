SELECT name
FROM person
JOIN person_order
ON person.id=person_order.person_id
JOIN menu
ON menu.id=person_order.menu_id AND (pizza_name='pepperoni pizza' OR pizza_name='mushroom pizza')
WHERE person.gender='male' AND (address='Moscow' OR address='Samara')
GROUP BY name
ORDER BY name DESC;