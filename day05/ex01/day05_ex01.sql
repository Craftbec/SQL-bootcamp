SET enable_seqscan TO OFF; 
EXPLAIN ANALYZE
SELECT pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria
ON menu.pizzeria_id=pizzeria.id;