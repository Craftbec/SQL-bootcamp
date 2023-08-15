CREATE VIEW v_price_with_discount AS
SELECT person.name, menu.pizza_name, menu.price, tmp.pr AS discount_price
FROM person
JOIN person_order
ON person.id=person_order.person_id
JOIN menu
ON person_order.menu_id=menu.id
JOIN (SELECT menu.id, ((price - price*0.1)::int) AS pr FROM menu) AS tmp
ON person_order.menu_id=tmp.id
ORDER BY 1, 2;