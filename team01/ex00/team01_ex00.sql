SELECT COALESCE(public.user.name, 'not defined') AS name, COALESCE(public.user.lastname , 'not defined') AS lastname, balance.type AS type,
SUM(balance.money) AS volume, COALESCE(cur.currency_name, 'not defined') AS currency_name, COALESCE (cur.last_rate_to_usd, 1) AS last_rate_to_usd,
(SUM(balance.money) *(COALESCE (cur.last_rate_to_usd, 1)))::real AS total_volume_in_usd
FROM public.user
FULL JOIN balance ON public.user.id=balance.user_id
FULL JOIN (SELECT COALESCE(ab.name, 'not defined') AS currency_name, COALESCE(ab.rate_to_usd, 1) AS last_rate_to_usd, id, updated 
FROM currency AS ab
WHERE updated =
  (SELECT MAX(updated) FROM currency AS ab2 WHERE ab.name = ab2.name AND ab.id=ab2.id)) AS cur
ON balance.currency_id=cur.id
GROUP BY 1, lastname, type, currency_name, last_rate_to_usd
ORDER BY 1 DESC, 2,3 ASC;
