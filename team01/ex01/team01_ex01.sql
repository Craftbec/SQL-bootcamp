CREATE OR REPLACE FUNCTION test(currency_id integer, updated timestamp)
RETURNS TABLE (b numeric, a timestamp) AS $$
BEGIN
RETURN QUERY
(SELECT currency.rate_to_usd, currency.updated
FROM currency
WHERE currency.id =$1 AND currency.updated<$2
ORDER BY 2 DESC
LIMIT 1)
UNION 
(SELECT currency.rate_to_usd, currency.updated
FROM currency
WHERE currency.id =$1 AND currency.updated>$2
ORDER BY 2
LIMIT 1
)
ORDER BY 2
LIMIT 1;
END;
$$ LANGUAGE plpgsql;

SELECT COALESCE(public.user.name, 'not defined') AS name, COALESCE(public.user.lastname , 'not defined') AS lastname, res.name AS currency_name,
res.res::real AS currency_in_usd
FROM public.user
FULL JOIN balance ON public.user.id=balance.user_id
FULL JOIN (SELECT balance.updated, balance.user_id,
(SELECT b FROM test (balance.currency_id, balance.updated)) AS curs, (balance.money * (SELECT b FROM test (balance.currency_id, balance.updated))) AS res,
	currency.name  
FROM balance
LEFT JOIN currency ON balance.currency_id=currency.id
WHERE currency.id IS NOT NULL
GROUP BY 1,2,3,4,5) AS res ON res.updated=balance.updated AND public.user.id=res.user_id
GROUP BY 1,2,3,4
HAVING res.res::real IS NOT NULL OR res.name IS NOT NULL
ORDER BY 1 DESC, lastname, currency_name ASC;
