/*
=========================================
Travel Data Analysis Project
Step 1 - Create database tables
Author: Priscila
=========================================
*/

CREATE TABLE db_travelers(
	traveler_id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	age INT,
	gender VARCHAR(30),
	nationality VARCHAR(100)
);

CREATE TABLE db_trips(
	trip_id INT IDENTITY(1,1) PRIMARY KEY,
	traveler_id INT,
    original_trip_id INT,
	destination VARCHAR (100),
	start_date DATE,
	end_date DATE,
	duration_days INT,
	FOREIGN KEY (traveler_id) REFERENCES db_travelers(traveler_id)
);

CREATE TABLE db_expenses(
	expense_id INT PRIMARY KEY IDENTITY(1,1),
	trip_id INT NOT NULL,
	accommodation_type VARCHAR(100),
	accommodation_cost DECIMAL(10,2),
	transportation_type VARCHAR(100),
	transportation_cost DECIMAL(10,2)
	FOREIGN KEY (trip_id) REFERENCES db_trips(trip_id)
);
