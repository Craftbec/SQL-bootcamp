CREATE INDEX idx_person_name ON person USING btree (UPPER(name));


SET enable_seqscan TO OFF; 
EXPLAIN ANALYZE
SELECT UPPER(person.name), age
FROM person 
WHERE UPPER(person.name)='ANNA';