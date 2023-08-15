insert into person_order
SELECT
    generate_series((SELECT MAX(id) + 1 FROM person_order), (SELECT MAX(id)FROM person_order) + ( SELECT COUNT(person.id)
        FROM person), 1) AS id,
    generate_series((SELECT MIN(id)FROM person), (SELECT MAX(id) FROM person), 1) AS person_i, menu.id AS menu_id, '2022-02-25'
	FROM menu
	WHERE menu.pizza_name='greek pizza';