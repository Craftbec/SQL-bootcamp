CREATE SEQUENCE seq_person_discounts start with 1;

SELECT setval ('seq_person_discounts', (SELECT MAX(id) FROM person_discounts));

ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT (NEXTVAL('seq_person_discounts'));