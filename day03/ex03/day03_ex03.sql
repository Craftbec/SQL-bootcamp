WITH TMP_M(pizzeria_name) AS (
SELECT  pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id=person_visits.pizzeria_id
JOIN person ON person_visits.person_id=person.id
WHERE person.gender='male'
ORDER BY pizzeria.name
),
TMP_F(pizzeria_name) AS (
SELECT  pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id=person_visits.pizzeria_id
JOIN person ON person_visits.person_id=person.id
WHERE person.gender='female'
ORDER BY pizzeria.name
)
(SELECT  *
FROM TMP_F
EXCEPT ALL
SELECT  *
FROM TMP_M)
UNION ALL
(SELECT  *
FROM TMP_M
EXCEPT ALL
SELECT  *
FROM TMP_F)
ORDER BY 1;