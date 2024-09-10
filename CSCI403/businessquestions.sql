-- Business Questions

-- What years/seasons/etc see more UFO sightings?
SELECT EXTRACT('Year' FROM date) AS year, COUNT(*) AS counted_sightings
FROM ufo_reports
GROUP BY year
ORDER BY counted_sightings DESC LIMIT 1;
-- should change to accurately reflect query instead of using LIMIT

-- What are the common shapes during the year with the most sightings?
SELECT shape, COUNT(*) AS counted
FROM ufo_reports
WHERE EXTRACT('Year' FROM date) = 2014
GROUP BY shape
ORDER BY counted DESC LIMIT 1;
-- should change to accurately reflect query instead of using LIMIT

-- What states see more UFO sightings during the year with the most sightings?
SELECT state, COUNT(*) AS counted_sightings
FROM ufo_reports
WHERE EXTRACT('Year' FROM date) = 2014
GROUP BY state
ORDER BY counted_sightings DESC LIMIT 1;
-- should change to accurately reflect query instead of using LIMIT

-- In the year where there were more UFO sightings, was the number of sci-fi films released greater or smaller than the sightings?
SELECT 
    DISTINCT EXTRACT('Year' FROM ufo_reports.date) AS year, 
    (SELECT COUNT(*) AS number_of_ufo_reports FROM ufo_reports WHERE EXTRACT('Year' FROM ufo_reports.date) = 2014), 
    (SELECT COUNT(*) AS number_of_movie_releases FROM rt_movies_info JOIN rt_movies_genres
                                                                    ON rt_movies_info.review_link = rt_movies_genres.review_link 
                                                                    WHERE EXTRACT('Year' FROM rt_movies_info.original_release) = 2014 AND
                                                                        rt_movies_genres.genre = 'Science Fiction & Fantasy')
FROM 
    ufo_reports JOIN rt_movies_info ON
    EXTRACT('Year' FROM ufo_reports.date) = EXTRACT('Year' FROM rt_movies_info.original_release)
WHERE EXTRACT('Year' FROM ufo_reports.date) = 2014;

-- related query instead of original_release, use streaming release
SELECT 
    DISTINCT EXTRACT('Year' FROM ufo_reports.date) AS year, 
    (SELECT COUNT(*) AS number_of_ufo_reports FROM ufo_reports WHERE EXTRACT('Year' FROM ufo_reports.date) = 2014), 
    (SELECT COUNT(*) AS number_of_movie_releases FROM rt_movies_info JOIN rt_movies_genres
                                                                    ON rt_movies_info.review_link = rt_movies_genres.review_link 
                                                                    WHERE EXTRACT('Year' FROM rt_movies_info.streaming_release) = 2014 AND
                                                                        rt_movies_genres.genre = 'Science Fiction & Fantasy')
FROM 
    ufo_reports JOIN rt_movies_info ON
    EXTRACT('Year' FROM ufo_reports.date) = EXTRACT('Year' FROM rt_movies_info.streaming_release)
WHERE EXTRACT('Year' FROM ufo_reports.date) = 2014;

