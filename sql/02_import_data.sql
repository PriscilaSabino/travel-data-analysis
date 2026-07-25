/*
=========================================
Travel Data Analysis Project
Step 2 - Import data into tables
Author: Priscila
=========================================
*/

INSERT INTO db_travelers (
	name,
	age, 
	gender, 
	nationality
)
SELECT DISTINCT 
	Traveler_name,
	Traveler_age, 
	Traveler_gender, 
	Traveler_nationality 
FROM db_travel;



INSERT INTO db_trips (
	traveler_id,
	original_trip_id, -- identifica a chave de origem
	destination, 
	start_date, 
	end_date, 
	duration_days
)
SELECT 
	t.traveler_id,
	d.Trip_ID,
	d.Destination,
	TRY_CAST(d.Start_date AS DATE),
	TRY_CAST(d.End_date AS DATE),
	d.Duration_days

FROM db_travel AS d
INNER JOIN db_travelers AS t -- usado durante a importação dos dados para recuperar chaves primárias de db_travelers
	ON d.Traveler_name = t.name
	AND Traveler_age = t.age
	AND Traveler_gender = t.gender
	AND Traveler_nationality = t.nationality;


INSERT INTO db_expenses (
	trip_id,
	accommodation_type,
	accommodation_cost,
	transportation_type,
	transportation_cost
)
SELECT
	t.trip_id,
	d.Accommodation_type,
	TRY_CAST(d.Accommodation_cost AS DECIMAL (10,2)),
	d.Transportation_type,
	TRY_CAST(d.Transportation_cost AS DECIMAL (10,2))

FROM db_travel AS d
INNER JOIN db_trips AS t
    ON d.Trip_ID = t.original_trip_id;