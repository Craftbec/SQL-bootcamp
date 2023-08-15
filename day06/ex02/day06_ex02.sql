SELECT person.name AS name, menu.pizza_name AS pizza_name, menu.price AS price,(menu.price/100 *(100-person_discounts.discount))::int AS discount_price, pizzeria.name AS pizzeria_name
from person_order
JOIN person ON person.id=person_order.person_id
JOIN menu ON person_order.menu_id=menu.id
JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
JOIN person_discounts ON person.id=person_discounts.person_id AND person_discounts.pizzeria_id=menu.pizzeria_id
ORDER BY 1,2;