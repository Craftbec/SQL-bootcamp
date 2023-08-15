insert into person_visits values (
	(SELECT MAX(person_visits.id)+1 FROM person_visits), 
	(SELECT id FROM person WHERE person.name='Denis'), 
	(SELECT id FROM pizzeria WHERE pizzeria.name='Dominos'), 
	'2022-02-24'),
	((SELECT MAX(person_visits.id)+2 FROM person_visits), 
	(SELECT id FROM person WHERE person.name='Irina'), 
	(SELECT id FROM pizzeria WHERE pizzeria.name='Dominos'), 
	'2022-02-24');