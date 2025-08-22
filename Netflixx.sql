SELECT * FROM project.netflix;

SELECT title, duration1 AS duration_minutes, country
FROM netflix
WHERE type = 'Movie' AND unit = 'min'
ORDER BY duration1 DESC
LIMIT 10;

# Top 10 Countries by Number of Movies
SELECT country, COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie' AND country IS NOT NULL AND country != 'Unknown'
GROUP BY country
ORDER BY total_movies DESC
LIMIT 10;

# Most Common Movie Ratings
SELECT rating, COUNT(*) AS count
FROM netflix
WHERE type = 'Movie'
GROUP BY rating
ORDER BY count DESC;

# Top 5 Genres for Movies
SELECT `Primary Genre`, COUNT(*) AS movie_count
FROM netflix
WHERE type = 'Movie'
GROUP BY `Primary Genre`
ORDER BY movie_count DESC
LIMIT 5;

# Monthly Movie Additions (Latest Year e.g., 2021)
/*SELECT MONTH(`Date Added (Formatted)`) AS month, COUNT(*) AS movies_added
FROM netflix
WHERE type = 'Movie' AND YEAR(`Date Added (Formatted)`) = 2021
GROUP BY MONTH(`Date Added (Formatted)`)
*/
# Movies with Unknown Cast or Director
SELECT title, director, cast
FROM netflix
WHERE type = 'Movie' 
  AND (director = 'Unknown' OR cast = 'Unknown');

# Average Duration of Movies
SELECT ROUND(AVG(duration1), 2) AS avg_movie_duration
FROM netflix
WHERE type = 'Movie' AND unit = 'min';

 
#Recent Top Movies
SELECT title, `Date Added (Formatted)` AS added_date, country
FROM netflix
WHERE type = 'Movie'
  AND `Date Added (Formatted)` >= '2021-03-01'
ORDER BY `Date Added (Formatted)` DESC
Limit 10;


# Top 10 Most Common Movie Titles (Duplicates/Remakes Check)
/*SELECT title, COUNT(*) AS occurrences
FROM netflix
WHERE type = 'Movie'
GROUP BY title
HAVING COUNT(*) > 1
ORDER BY occurrences DESC
LIMIT 10; */

# Top Directors by Movie Count
SELECT director, COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie' AND director != 'Unknown'
GROUP BY director
ORDER BY total_movies DESC
LIMIT 5;

# Movies Grouped by Primary Genre
SELECT `Primary Genre`, COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie'
GROUP BY `Primary Genre`
ORDER BY total_movies DESC;




