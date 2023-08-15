insert into person_visits values (
	(SELECT MAX(person_visits.id)+1 FROM person_visits), 
	(SELECT id FROM person WHERE person.name='Dmitriy'), 
	(SELECT pizzeria.id FROM pizzeria
	JOIN menu ON menu.pizzeria_id=pizzeria.id
	WHERE menu.price<800
	EXCEPT
	SELECT pizzeria.id FROM pizzeria
	JOIN person_visits ON pizzeria.id=person_visits.pizzeria_id
	JOIN person ON person_visits.person_id=person.id
	WHERE person.name='Dmitriy' AND person_visits.visit_date='2022-01-08'
	LIMIT 1),
	'2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;