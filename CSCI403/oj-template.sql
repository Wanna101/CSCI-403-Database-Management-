-- OUTER JOIN
SET search_path = yours, public, imdb;

-- contrast INNER join, LEFT/RIGHT/FULL outer join (ven diagram)

-- find courses that are not a prereq for other courses (cs_prereqs)

  
-- find courses without instructors (mines_cs_courses, mines_cs_faculty)


-- find faculty without courses (mines_cs_courses, mines_cs_faculty)


-- generate a list of all courses and faculty, showing course/faculty data together, but including *all* courses and *all* faculty, even courses without faculty and faculty without courses.


-- limit yourself to only some movie genres (define a view)
-- choose from these:
SELECT DISTINCT genre 
FROM movie_genres;

-- find movies that are not those genres


-- What's the meaning of the query if we reverse the direction of the OJ(left<->right) ? (what needs to change besides the left/rightness?)


-- find actors that have acted in movies of genres beyond those


-- What's the meaning of the query if we reverse the direction of the OJ (left<->right)? (what needs to change besides the left/rightness?)

 
-- what's the meaning/what else do we need to change if we make it a full outer join?


