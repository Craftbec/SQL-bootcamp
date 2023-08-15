WITH tmp AS ((SELECT pizzeria.name, COUNT(person_visits.pizzeria_id) AS count
FROM pizzeria
JOIN person_visits ON pizzeria.id=person_visits.pizzeria_id
GROUP BY pizzeria.name)
UNION 
(
SELECT pizzeria.name, COUNT(person_order.menu_id) AS count
FROM pizzeria
JOIN menu ON pizzeria.id=menu.pizzeria_id
JOIN person_order ON menu.id=person_order.menu_id
GROUP BY pizzeria.name))
SELECT tmp.name AS name, SUM(tmp.count) AS total_count
FROM tmp
GROUP BY tmp.name
ORDER BY total_count DESC, name ASC;