-- Exercise 4 — Tasks

-- List all directors of Pixar movies (alphabetically), without duplicates ✓
SELECT DISTINCT(director) FROM movies
ORDER BY director ASC;

-- List the last four Pixar movies released (ordered from most recent to least) ✓
SELECT * 
FROM movies
ORDER BY year DESC
LIMIT 4;

-- List the first five Pixar movies sorted alphabetically ✓
SELECT * 
FROM movies
ORDER BY title ASC
LIMIT 5;

-- List the next five Pixar movies sorted alphabetically  ✓   
SELECT * 
FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;




