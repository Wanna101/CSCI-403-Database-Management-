/*
    ERD 2 SQL script 2/10/23
    
    Name: Amelia Read & the CSCI 403B students
 */
 
-- set your search path to include your username and public, 
-- but *not* in this script.

-- windows psql needs the following line uncommented
-- \encoding utf-8

-- add other environment changes here (pager, etc.)

-- add the SQL for each step that needs SQL below that step here.
-- use the 8 steps defined in class (step 8 was covered only in class!)

/*
   Step 1: Regular entities
 */
CREATE TABLE employee (
  id SERIAL PRIMARY KEY,
  ssn INTEGER,
  name TEXT,
  position TEXT,
  pay_rate NUMERIC (8,2),
  pay_type TEXT
);

CREATE TABLE model (
  id_name TEXT,
  id_number INTEGER,
  type TEXT,
  PRIMARY KEY(id_name, id_number)
);

CREATE TABLE factory (
  city TEXT PRIMARY KEY
);

CREATE TABLE part (
  part_number INTEGER PRIMARY KEY,
  description TEXT
);

CREATE TABLE vendor (
  name TEXT PRIMARY KEY,
  contact_info_email TEXT,
  contact_info_phone INTEGER
);

/*
   Step 2: Weak entities
 */
 
-- contains relationship as well
CREATE TABLE assembly_line (
  factory_city TEXT REFERENCES factory(city),
  number SERIAL,
  capacity INTEGER,
  PRIMARY KEY(factory_city, number)
);

/*
   Step 3: 1:1 Relationships
 */
 
-- manages relationship
ALTER TABLE factory
  ADD COLUMN employee_id INTEGER NOT NULL -- for total participation
    REFERENCES employee(id);

/*
   Step 4: 1:N Relationships
 */
-- works at relationship
ALTER TABLE employee
  ADD COLUMN factory_city TEXT
    REFERENCES factory(city);
	
-- supervises relationship
ALTER TABLE employee
  ADD COLUMN supervisor_id INTEGER
    REFERENCES employee(id);
	
-- builds relationship
ALTER TABLE model
  ADD COLUMN factory_city TEXT NOT NULL -- total participation
    REFERENCES factory(city);

/*
   Step 5: N:M Relationships
 */
 
 -- can use relationship
CREATE TABLE model_part_xref (
  model_id_name TEXT,
  model_id_number INTEGER,
  part_number INTEGER REFERENCES part(part_number),
  FOREIGN KEY (model_id_name, model_id_number) REFERENCES model(id_name, id_number),
  PRIMARY KEY (model_id_name, model_id_number, part_number)
);

 -- supplies relationship
CREATE TABLE vendor_part_xref (
  vendor_name TEXT REFERENCES vendor(name),
  part_number INTEGER REFERENCES part(part_number),
  price NUMERIC(6,2),
  PRIMARY KEY (vendor_name, part_number)
);

/*
   Step 6: Multi-valued attributes
 */
CREATE TABLE model_purpose (
   model_id_name TEXT,
   model_id_number INTEGER,
   purpose TEXT,
   PRIMARY KEY (model_id_name, model_id_number, purpose)
);

/*
   Step 7: N-ary Relationships
 */
-- none present

/*
   Step 8: Derived attributes
 */
CREATE VIEW factory_derived AS
  SELECT city, employee_id, SUM(a.capacity) AS capacity
  FROM factory f JOIN assembly_line a 
       ON f.city = a.factory_city
  GROUP BY city, employee_id;
