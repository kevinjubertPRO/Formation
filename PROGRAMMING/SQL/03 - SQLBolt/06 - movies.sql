-- Exercise 6 — Tasks

-- Find the domestic and international sales for each movie
SELECT title, domestic_sales, international_sales 
FROM movies m INNER JOIN BoxOffice b ON m.id=b.movie_id;

-- Show the sales numbers for each movie that did better internationally rather than domestically
SELECT title, international_sales, domestic_sales 
FROM movies m INNER JOIN BoxOffice b ON m.id = b.movie_id
WHERE international_sales>domestic_sales;

-- List all the movies by their ratings in descending order
SELECT title, rating
FROM movies m INNER JOIN BoxOffice b ON m.id = b.movie_id
ORDER BY rating DESC;