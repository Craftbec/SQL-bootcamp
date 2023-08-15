SELECT name
FROM person
JOIN person_order
ON person.id=person_order.person_id
JOIN menu
ON menu.id=person_order.menu_id AND (pizza_name='pepperoni pizza' OR pizza_name='cheese pizza')
WHERE person.gender='female' 
GROUP BY person.id
HAVING  count(menu.pizza_name)=2
ORDER BY name ASC;