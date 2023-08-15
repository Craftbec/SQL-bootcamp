SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id=person_visits.pizzeria_id
JOIN person ON person_visits.person_id=person.id
JOIN person_order ON person_order.person_id=person.id
WHERE person.name='Andrey' AND person_order.order_date<>person_visits.visit_date
GROUP BY pizzeria.name
ORDER BY 1;