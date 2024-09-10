SET search_path = s23_group2;

-- nuforc_reports
-- delete data_table (redundancy in dates)
ALTER TABLE IF EXISTS nuforc_reports DROP COLUMN date_table;

-- delete duration 
ALTER TABLE IF EXISTS nuforc_reports DROP COLUMN duration;

-- remove questionable data from the date table so we can make it into a date timestamp
DELETE FROM nuforc_reports WHERE date LIKE '%?%' 
    OR date LIKE '%-%' 
    OR date NOT LIKE '%/%' 
    OR date LIKE '%×%' 
    OR date LIKE '%00/%';

-- character search and delete rows where there are letters
DELETE FROM nuforc_reports WHERE (date ~* '[a-z]') IS TRUE;

-- delete irregular formats;
DELETE FROM nuforc_reports WHERE date NOT LIKE '%_/%_/%';

DELETE FROM nuforc_reports WHERE date LIKE '13/%' 
    OR date LIke '14/%' 
    OR date like '15/%' 
    OR date like '16/%' 
    or date like '17/%'
    or date like '18/%' 
    or date like '19/%';

DELETE FROM nuforc_reports WHERE date LIKE '2_/%' 
    OR date LIKE '3_/%' 
    OR date LIKE '4_/%' 
    OR date LIKE '5_/%' 
    OR date LIKE '6_/%' 
    OR date LIKE '7_/%' 
    OR date LIKE '8_/%' 
    OR date LIKE '9_/%';

DELETE FROM nuforc_reports WHERE date LIKE '%/4_/%' 
    OR date LIKE '%/5_/%' 
    OR date LIKE '%/6_/%' 
    OR date LIKE '%/7_/%' 
    OR date LIKE '%/8_/%' 
    OR date LIKE '%/9_/%';

-- update date data that is unknown into null values
UPDATE nuforc_reports
SET date = NULL
WHERE LOWER(date) = LOWER('unknown');

-- change datatype for date table to date timestamp
ALTER TABLE IF EXISTS nuforc_reports
ALTER COLUMN date TYPE TIMESTAMP
USING date::timestamp;

