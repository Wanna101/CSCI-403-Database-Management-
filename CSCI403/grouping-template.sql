-- queries using aggregates, GROUP BY, HAVING

-- How many sales did we make in the first quarter?


-- From here on we'll assume we only have data for the first quarter (which is true).

-- How much did we actually bring in (revenue)?

-- How much did we sell each month?


-- How about actual revenue by month?  (Where does the WHERE clause fit in?)


-- How many sales did each person make in the quarter, ranked by count?


-- How about revenue by person, ranked by revenue?


-- How did each salesperson do (sale amount) each month?
-- Consider an appropriate sort order

-- Who are our best customers?  (Find sales by customer, ordered by sales descending)


-- Anybody who makes sales in an amount at least 70,000 in a given month receives a bonus.  Who gets bonuses each month?


-- How about just in January?


-- Who made the most sales in February, and how many sales did they make, for what total sum? (requires a subquery, coming next)


-- We can make it a bit cleaner using a WITH query (CTE), which acts like a temporary view we can use for just this one query:



