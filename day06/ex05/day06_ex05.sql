COMMENT ON TABLE person_discounts IS 'Таблица с информацией о персональной скидке в пиццерии';
COMMENT ON COLUMN person_discounts.id IS 'первичный ключ';
COMMENT ON COLUMN person_discounts.person_id IS 'внешний ключ к человеку';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'внешний ключ к пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'величина персональной скидки';