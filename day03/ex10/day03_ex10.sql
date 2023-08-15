insert into person_order values (
	(SELECT MAX(person_order.id)+1 FROM person_order), 
	(SELECT id FROM person WHERE person.name='Denis'), 
	(SELECT id FROM menu WHERE menu.pizza_name='sicilian pizza'), 
	'2022-02-24'),
	((SELECT MAX(person_order.id)+2 FROM person_order), 
	(SELECT id FROM person WHERE person.name='Irina'), 
	(SELECT id FROM menu WHERE menu.pizza_name='sicilian pizza'), 
	'2022-02-24');
