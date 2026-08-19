/*
=========================================
Travel Data Analysis Project
Step 3 - Clean data
Author: Priscila
=========================================
*/

-- Limpa a coluna de hospedagem
UPDATE db_travel
SET Accommodation_cost = TRIM(REPLACE(REPLACE(Accommodation_cost, 'USD', ''), ',', ''));

-- Limpa a coluna de transporte(Trim remove espaços extras)
UPDATE db_travel
SET Transportation_cost = TRIM(REPLACE(REPLACE(Transportation_cost, 'USD', ''), ',', ''));

-- Corrige as variações de nomes de destinos
UPDATE db_trips
SET destination = 'Amsterdam, Netherlands'
WHERE destination = 'Amsterdam';

UPDATE db_trips
SET destination = 'Barcelona, Spain'
WHERE destination = 'Barcelona';

UPDATE db_trips
SET destination = 'Sydney, Australia'
WHERE destination = 'Sydney' OR destination = 'Sydney, Aus' OR destination = 'Australia';