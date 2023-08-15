WITH TMP_M(pizzeria_name) AS (
SELECT  pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON pizzeria.id=menu.pizzeria_id
JOIN person_order ON menu.id=person_order.menu_id
JOIN person ON person_order.person_id=person.id
WHERE person.gender='male'
ORDER BY pizzeria.name
),
TMP_F(pizzeria_name) AS (
SELECT  pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON pizzeria.id=menu.pizzeria_id
JOIN person_order ON menu.id=person_order.menu_id
JOIN person ON person_order.person_id=person.id
WHERE person.gender='female'
ORDER BY pizzeria.name
)
(SELECT  *
FROM TMP_F
EXCEPT
SELECT  *
FROM TMP_M)
UNION
(SELECT  *
FROM TMP_M
EXCEPT
SELECT  *
FROM TMP_F)
ORDER BY 1;