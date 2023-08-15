WITH RECURSIVE tmp AS (
    SELECT
        city_1 AS tour,
        city_1,
        city_2,
        price,
        price AS total_cost
    FROM
        travel
    WHERE
        city_1 = 'a'
    UNION ALL
    SELECT
        maxi.tour || ',' || mini.city_1 AS tour,
        mini.city_1,
        mini.city_2,
        mini.price,
        maxi.total_cost + mini.price AS total_cost
    FROM
        travel AS mini
        INNER JOIN tmp AS maxi ON mini.city_1 = maxi.city_2
    WHERE
        tour NOT LIKE '%' || mini.city_1 || '%'
)
SELECT
    total_cost,
    CONCAT('{', tour, ',a}')
FROM
    tmp
WHERE
    city_2 = 'a'
    AND LENGTH(tour) = 7
ORDER BY
    1,
    2;

