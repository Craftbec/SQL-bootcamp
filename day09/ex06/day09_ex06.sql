CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy', pprice numeric default 500, pdate date default '2022-01-08')
RETURNS TABLE (pizzeria_name varchar) AS $$
BEGIN
RETURN QUERY
SELECT DISTINCT pizzeria.name
FROM pizzeria
JOIN person_visits ON pizzeria.id=person_visits.pizzeria_id
JOIN person ON person_visits.person_id=person.id
JOIN person_order ON person.id=person_order.person_id
JOIN menu ON person_order.menu_id=menu.id
WHERE person.name=$1 AND menu.price<$2 AND person_order.order_date=$3;
END;
$$ LANGUAGE plpgsql;