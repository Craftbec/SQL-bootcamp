SELECT address AS address, ROUND((MAX(age)::numeric- MIN(age)/MAX(age)::numeric),2) AS formula, ROUND(AVG(age),2) AS average,
CASE
WHEN (MAX(age)- MIN(age)/MAX(age))>ROUND(AVG(age),2) THEN true
else false
END AS comparison
FROM person
GROUP BY address
ORDER BY 1;