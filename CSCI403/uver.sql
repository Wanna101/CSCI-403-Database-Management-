/*
    Lab 3 - Uver ERD SQL script
    
    Name: David Young
 */
 
-- set your search path to include your username and public, 
-- but *not* in this script.

-- windows psql needs the following line uncommented
-- \encoding utf-8

-- add other environment changes here (pager, etc.)
DROP TABLE customer, ride, driver, car, feature, customer_ride_xref CASCADE;
DROP TYPE loc;

-- add the SQL for each step that needs SQL below that step here.
-- use the 8 steps defined in class (step 8 was covered only in class!)

/*
   Step 1: Regular entities
 */
CREATE TYPE loc AS (
    x DOUBLE PRECISION,
    y DOUBLE PRECISION
); 

CREATE TABLE customer (
    name TEXT,
    id INTEGER PRIMARY KEY,
    ride_no INTEGER,
    location loc,
    phone BIGINT
);

CREATE TABLE ride (
    ride_id INTEGER PRIMARY KEY,
    driver_id INTEGER,
    ride_type TEXT,
    fare NUMERIC(4,2),
    pickup_time DATE,
    number_of_riders INTEGER,
    destination loc,
    distance INTEGER,
    payment TEXT
);

CREATE TABLE driver (
    name TEXT,
    id INTEGER PRIMARY KEY,
    phone BIGINT,
    registration INTEGER UNIQUE NOT NULL
); 

CREATE TABLE car (
    name TEXT,
    id INTEGER PRIMARY KEY,
    model TEXT,
    license_plate TEXT,
    registration INTEGER UNIQUE NOT NULL,
    feature TEXT,
    seats INTEGER
);

/*
   Step 2: Weak entities
 */
--none that I can see

/*
   Step 3: 1:1 Relationships
 */
--drives relationship
ALTER TABLE car
ADD FOREIGN KEY (registration) REFERENCES driver(registration);

/*
   Step 4: 1:N Relationships
 */
--ride to customer relationship
ALTER TABLE ride
ADD FOREIGN KEY (driver_id) REFERENCES driver(id);

/*
   Step 5: N:M Relationships
 */
--gets ride relationship
CREATE TABLE customer_ride_xref (
    customer_id INTEGER,
    ride_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (ride_id) REFERENCES ride(ride_id),
    PRIMARY KEY(customer_id, ride_id)
); 

/*
   Step 6: Multi-valued attributes
 */
CREATE TABLE feature (
    car_id INTEGER,
    car_name TEXT,
    car_model TEXT,
    feature TEXT,
    PRIMARY KEY (car_id, car_name, car_model, feature)
);
    

/*
   Step 7: N-ary Relationships
 */
-- none present

/*
   Step 8: Derived attributes
 */
CREATE VIEW ride_derived_distance AS 
SELECT r.destination AS end_pt, 
    c.location AS start_pt, 
    SQRT(((r.destination).x - (c.location).x)^2 + ((r.destination).y - (c.location).y)^2) AS distance 
FROM ride r JOIN customer c
    ON r.ride_id = c.ride_no
GROUP BY start_pt, end_pt;
