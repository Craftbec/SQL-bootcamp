CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10) RETURNS TABLE(fibonacci_numbers integer) AS $$
BEGIN
RETURN QUERY
WITH RECURSIVE fib(tmp1, tmp2) AS (
SELECT 0 , 1
	UNION ALL
SELECT fib.tmp1 +fib.tmp2 AS tmp1, fib.tmp1 AS tmp2
FROM fib WHERE (fib.tmp1 +fib.tmp2)<$1
)
SELECT fib.tmp1
FROM fib;
END;
$$ LANGUAGE plpgsql;