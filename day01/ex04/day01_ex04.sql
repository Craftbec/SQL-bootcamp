SELECT COUNT(person_visits.person_id)
FROM person_visits
WHERE person_visits.visit_date = '2022-01-07'
EXCEPT
SELECT COUNT(person_order.person_id)
FROM person_order
WHERE person_order.order_date = '2022-01-07';