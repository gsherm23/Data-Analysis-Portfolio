# In this project I am using the Nextflix Database.
# Netflix database consists of tv shows and movies available on Netflix as of 2019.
# In this database you’ll find two tables:
# movies - lists all of the relevant information regarding Netflix’s movies
# series - lists all of the relevant information regarding Netflix’s series




# 1
# Write a query to display the title, rating, country, release_year, and director, for all movies directed by Michael Bay. 
# Sort the output by release_year (ascending)
SELECT 
    title, rating, country, release_year, director
FROM
    movies
WHERE
    director = 'Michael Bay'
ORDER BY release_year;


# 2
# Write a query to display the title, country, duration_in_minutes, and date_added, for all movies that were added before March 2011. 
# Sort the output by duration_in_minutes (ascending)
SELECT 
    title, country, duration_in_minutes, date_added
FROM
    movies
WHERE
    date_added < '2011-03-01'
ORDER BY duration_in_minutes;


# 3
# Write a query to display the title, country, duration_in_minutes, and release_year, for all movies that were 
# released between 2014 and 2016. Sort the output by duration_in_minutes (descending)
SELECT 
    title, country, duration_in_minutes, release_year
FROM
    movies
WHERE
    release_year BETWEEN 2014 AND 2016
ORDER BY duration_in_minutes DESC;


# 4
# Write a query to display the title, director, country, and duration_in_minutes,
# for all movies with duration between 3-4 hours. Sort the output by duration_in_minutes (descending)
SELECT 
    title, director, country, duration_in_minutes
FROM
    movies
WHERE
    duration_in_minutes / 60 BETWEEN 3 AND 4;


# 5
# Write a query to display the title, director, rating, num_of_seasons for all series with 10 to 14 seasons. 
# Sort the output by num_of_seasons (descending)
SELECT 
    title, director, rating, num_of_seasons
FROM
    series
WHERE
    num_of_seasons BETWEEN 10 AND 14
ORDER BY num_of_seasons DESC;

# 6
# Write a query to display the title, director, rating, num_of_seasons
# for all series
# a. containing value in the director column (diretor not equals null)
# b. and having num_of_seasons > 7
SELECT 
    title, director, rating, num_of_seasons
FROM
    series
WHERE
    director IS NOT NULL
        AND num_of_seasons > 7;


# 7
# Write a query to display the title, director, cast, country and rating, for all movies having Ryan Reynolds in their cast
SELECT 
    title, director, cast, country, rating
FROM
    movies
WHERE
    cast LIKE '%Ryan Reynolds%';
    

# 8
# Write a query to display the title, director, cast, country and rating, 
# for all movies having Ryan Reynolds and Nicolas Cage in their cast.
SELECT 
    title, director, cast, country, rating
FROM
    movies
WHERE
    cast LIKE '%Ryan Reynolds%'
        AND cast LIKE '%Nicolas Cage%';
        

# 9
# Write a query to display the title, director, cast, country, duration_in_minutes, and rating
# a. for all movies having PG (Parental Guidance) in their rating
# b. and movie duration is greater than 3 hours
SELECT 
    title, director, cast, country, duration_in_minutes, rating
FROM
    movies
WHERE
    rating LIKE '%PG%'
        AND duration_in_minutes > 180;


# 10
# Write a query to display title, director, cast, country, and release_year for all series released in 2014, 2016, or 2018. 
# Sort the output by title (ascending)
SELECT 
    title, director, cast, country, release_year
FROM
    series
WHERE
    release_year IN (2014 , 2016, 2018);

