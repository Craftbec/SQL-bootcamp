SELECT person_order.order_date AS action_date, tmp_person.name || ' (age:'|| ' ' || tmp_person.age ||')' AS person_information
FROM person_order 
NATURAL JOIN (SELECT id AS person_id, name, age FROM person) AS tmp_person
ORDER BY action_date, person_information;