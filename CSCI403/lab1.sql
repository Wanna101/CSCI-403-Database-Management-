/*
    Lab 1 - SQL Select Statements (queries)
    
    Name:
 */
 
-- don't forget to set your search path; this sets it for the current session:
SET search_path = history;

-- windows psql needs the following line uncommented
-- \encoding utf-8

-- add other environment changes here (pager, etc.)

-- add your SQL query to provide the answer to each question 
-- after the comment containing the question; for example:

/*
   0. What do we know about pioneers born before 1900?
 */
SELECT * 
FROM pioneer 
WHERE birth < 1900;

/*
   1. What is Jim Melton known for?
 */

/* 
   2. Which pioneer's last name started with 'S' whose first name did not start with 'M' 
      and what were they known for?
 */

/* 
   3. For the pioneers who are living, give me their name in a single column (first and
      last, separated with a space), their birth year, and what they are known for, 
      sorted from oldest to youngest.
 */

/* 
   4. Which of the pioneers are deceased (have a known death date)? Include their name,
      their age at death, and their death date, and provide in descending age.
 */

/* 
   5. Provide a list of organizations and their database_contributions where the
      contribution includes the word developing in it, in any case (upper, lower, or mixed
      case). In the result, call the organization name simply organization, and change 
      database_contribution to contribution. List in alphabetic order by organization 
      name.
 */

/* 
   6. List the roles pioneers take in their organizations, only listing each role one time
      and sorting alphabetically. (Note, if two pioneers have the same role, it would 
      still only be listed one time.)
 */

/* 
   7. What is the contribution of the organizations which were founded in the timeframe
      1890-1960? Provide the organization’s name and contribution, and list them in the
      order they were founded.
 */

/* 
   8. Provide a list of pioneers ordered by their age; use their age at death if they are
      dead, otherwise use their current age (do not hard-code the current year). Include
      the pioneer's name as a single column and their age. Put them in age order.
 */

/* 
   9. Which pioneers were Computer Scientists? Order them by birth year.
 */

/* 
   10. Which of the pioneers have won Turing awards? Include their name as a single 
       column (first and last with a space between), when they won the award, and what 
       it was for. Keep them in pioneer name order (last then first).
 */

/* 
   11. Which pioneers worked for IBM? List their names as "last, first" (i.e., with a
       comma between last and first name). Order by last name then first.
 */

/* 
   12. What is the name (first and last) of the oldest pioneer who was a co-founder
       (assume there is only one oldest pioneer). Note, you will have to determine 
       their age when the company was founded.
 */

/* 
    Extra Credit - no points lost for not completing the queries below
 */

/* 
   13. Provide the current time but put the hour, minute, and second each in their own 
       column with the field name as the name of the column (i.e. the hour column should 
       be named hour). 
 */

/* 
   14. Where did the people who won Turing awards work? Include their name and the 
       organizations they have worked for. Do not assume data is static - include the 
       turing_award table in your query to ensure future winners would also appear. 
       Order by pioneer name and organization.
 */
