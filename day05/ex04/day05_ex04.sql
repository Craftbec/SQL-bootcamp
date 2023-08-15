CREATE UNIQUE INDEX idx_menu_unique ON menu USING btree (pizzeria_id, pizza_name);


SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT pizza_name
FROM menu
WHERE pizza_name='cheese pizza';