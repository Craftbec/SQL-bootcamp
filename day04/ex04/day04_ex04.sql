CREATE VIEW v_symmetric_union AS
WITH tmp2 AS (SELECT person_id
FROM person_visits
WHERE visit_date='2022-01-02'),
tmp6 AS (
SELECT person_id
FROM person_visits
WHERE visit_date='2022-01-06')
(select * 
from tmp2
EXCEPT
select * 
from tmp6)
UNION
(select * 
from tmp6
EXCEPT ALL
select * 
from tmp2)
ORDER BY 1;