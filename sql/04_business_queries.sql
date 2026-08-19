/*
=========================================
Travel Data Analysis Project
Step 4 - Create business queries
Author: Priscila
=========================================
*/

-- Pergunta 1: Quais são os destinos mais visitados?

SELECT
    destination,
    COUNT(*) AS total_trips
FROM db_trips
GROUP BY destination
ORDER BY total_trips DESC;

-- Pergunta 2: Qual é o custo médio das viagens por destino?

SELECT
    t.destination,
    AVG(e.accommodation_cost + e.transportation_cost) AS average_trip_cost
FROM db_trips AS t
INNER JOIN db_expenses AS e
    ON t.trip_id = e.trip_id
GROUP BY t.destination
ORDER BY average_trip_cost DESC;

-- Pergunta 3: Qual tipo de hospedagem é o mais utilizado?

SELECT
    accommodation_type,
    COUNT(*) AS total_trips
FROM db_expenses
GROUP BY accommodation_type
ORDER BY total_trips DESC;

-- Pergunta 4: Qual é a média de duração das viagens por destino?

SELECT
    destination,
    COUNT(*) AS total_trips,
    ROUND(AVG(duration_days), 2) AS average_duration
FROM db_trips
GROUP BY destination
ORDER BY average_duration DESC;

-- Pergunta 5: Faixas etárias diferentes têm comportamentos diferentes de viagem?

SELECT
    CASE
        WHEN tr.age < 18 THEN 'Under 18'
        WHEN tr.age BETWEEN 18 AND 29 THEN '18-29'
        WHEN tr.age BETWEEN 30 AND 44 THEN '30-44'
        WHEN tr.age BETWEEN 45 AND 59 THEN '45-59'
        ELSE '60+'
    END AS age_group,

    COUNT(DISTINCT t.trip_id) AS total_trips,

    ROUND(
        AVG(e.accommodation_cost + e.transportation_cost),
        2
    ) AS average_trip_cost,

    ROUND(
        AVG(t.duration_days),
        2
    ) AS average_duration

FROM db_travelers AS tr

INNER JOIN db_trips AS t
    ON tr.traveler_id = t.traveler_id

INNER JOIN db_expenses AS e
    ON t.trip_id = e.trip_id

GROUP BY
    CASE
        WHEN tr.age < 18 THEN 'Under 18'
        WHEN tr.age BETWEEN 18 AND 29 THEN '18-29'
        WHEN tr.age BETWEEN 30 AND 44 THEN '30-44'
        WHEN tr.age BETWEEN 45 AND 59 THEN '45-59'
        ELSE '60+'
    END

ORDER BY average_trip_cost DESC;