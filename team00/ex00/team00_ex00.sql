CREATE TABLE travel (
    city_1 varchar NOT NULL,
    city_2 varchar NOT NULL,
    price int
);

INSERT INTO travel
    VALUES ('a', 'b', 10);

INSERT INTO travel
    VALUES ('b', 'a', 10);

INSERT INTO travel
    VALUES ('a', 'd', 20);

INSERT INTO travel
    VALUES ('d', 'a', 20);

INSERT INTO travel
    VALUES ('a', 'c', 15);

INSERT INTO travel
    VALUES ('c', 'a', 15);

INSERT INTO travel
    VALUES ('b', 'c', 35);

INSERT INTO travel
    VALUES ('c', 'b', 35);

INSERT INTO travel
    VALUES ('d', 'b', 25);

INSERT INTO travel
    VALUES ('b', 'd', 25);

INSERT INTO travel
    VALUES ('d', 'c', 30);

INSERT INTO travel
    VALUES ('c', 'd', 30);

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
),
finish AS (
    SELECT
        total_cost,
        CONCAT('{', tour, ',a}') AS tour
FROM
    tmp
    WHERE
        city_2 = 'a'
        AND LENGTH(tour) = 7
)
SELECT
    total_cost,
    tour
FROM
    finish
WHERE
    total_cost = (
        SELECT
            MIN(total_cost)
        FROM
            finish)
ORDER BY
    total_cost,
    tour;

