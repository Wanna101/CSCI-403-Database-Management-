/* Project 5 SQL Script */
/* Author: David Young */
SET search_path = music;

/* 1. How many albums are classified as part of the jazz genre? */
SELECT COUNT(*)
FROM album_genre
WHERE genre = 'jazz';

/* 2. In what year was the oldest album(s) in our data released? */
SELECT MIN(year)
FROM album;

/* 3. How many artists are individuals (not a group)? */
SELECT COUNT(*)
FROM artist
WHERE type = 'Person';

/* 4. How many artists have names that are longer than 5 characters? */
SELECT COUNT(*)
FROM artist
WHERE length(name) > 5;

/* 5. For each album genre, how many albums are classified as part of that genre? Order from most to least albums in that genre. */
SELECT genre, COUNT(genre)
FROM album_genre
GROUP BY genre;

/* 6. Which albums have more than 20 tracks (in our data), and how many do they have? Order from most tracks to least tracks. If albums have the same number of tracks, put them in alphabetical order. */
SELECT a.title, COUNT(b.title)
FROM
    album a
    JOIN track b ON b.album_id = a.id
GROUP BY a.title, a.id
HAVING COUNT(b.title) > 20
ORDER BY COUNT(b.title) DESC, a.title;

/* 7. Using only rows where the appropriate data isn't null, give an approximate average number of years that group members spend in a group. */
SELECT AVG(end_year - begin_year)
FROM artist_member_xref
WHERE end_year IS NOT NULL OR begin_year IS NOT NULL;

/* 8. In what years were exactly 8 of the albums in our database released? */
SELECT year
FROM album
GROUP BY year
HAVING COUNT(*) = 8;

/* 9. What is the maximum number of members a group has in our data? */ 
SELECT MAX(n.count_name)
FROM (SELECT a.name, COUNT(g.name) AS count_name
      FROM
          artist a
          JOIN artist_member_xref x ON x.artist_id = a.id
          JOIN group_member g ON g.id = x.member_id
      GROUP BY a.name) AS n;


/* 10. What artist has the most recent album in our data, and what year was it released? */
SELECT MAX(n.name) AS name, MAX(n.year) AS year
FROM (SELECT a.name, b.year
      FROM
          artist a
          JOIN album b ON b.artist_id = a.id
      ORDER BY b.year DESC) AS n;

/* 11. What artists was Chris Thile part of? */
SELECT name FROM artist WHERE id IN 
    (SELECT artist_id FROM artist_member_xref WHERE member_id =
        (SELECT id FROM group_member WHERE name = 'Chris Thile'));


/* 12. What are the names of every member of the artist Foo Fighters, and what year did they enter the group? List them in order of least to most recent entry into the group. If they entered in the same year, put them in alphabetical order. */
SELECT name FROM group_member WHERE id IN
    (SELECT x.member_id
     FROM artist_member_xref x
        JOIN artist a ON a.id = x.artist_id
     WHERE a.id =
        (SELECT id FROM artist WHERE name = 'Foo Fighters'));

/* 13. Amy Ray is part of a group. Provide the title of the group's 2020 album, along with the name of the label that produced it. */
SELECT a.title, l.name
FROM album a
    JOIN label l ON l.id = a.label_id
WHERE a.artist_id =
    (SELECT artist_id FROM artist_member_xref WHERE member_id = 
        (SELECT id FROM group_member WHERE name = 'Amy Ray')) AND year = 2020;

/* 14. Which artists had more than 10 albums produced by the same label? */


