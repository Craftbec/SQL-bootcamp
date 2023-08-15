SELECT name
FROM pizzeria
EXCEPT
SELECT name
FROM pizzeria
WHERE id IN (SELECT pizzeria_id FROM person_visits);

SELECT name
FROM pizzeria
EXCEPT
SELECT name
FROM pizzeria
WHERE  EXISTS (SELECT pizzeria_id FROM person_visits WHERE person_visits.pizzeria_id=pizzeria.id);