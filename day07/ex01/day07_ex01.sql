SELECT person.name AS name, COUNT(person_visits.person_id) AS count_of_visits
FROM person_visits
JOIN person ON person_visits.person_id=person.id
GROUP BY person_id, person.name
ORDER BY 2 DESC, 1 ASC
LIMIT 4;