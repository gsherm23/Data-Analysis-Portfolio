# In this project I am using the Spotify Database.
# Spotify is a digital music streaming service that gives you access 
# to millions of songs, podcasts and videos from artists all over the world.
# The Spotify database consists of a single table - tracks, 
# which contains audio statistics of the top 2000 tracks on Spotify. 
# The table contains about 15 columns each describing the track and it's qualities.




# 1
# List the number of tracks made by each artist. Sort the output by the number of tracks (Descending)
SELECT 
    artist, COUNT(*) AS 'number_of_tracks'
FROM
    tracks
GROUP BY artist
ORDER BY COUNT(*) DESC;


# 2
# Display the average duration of tracks by genre. Sort the output by the average duration (Descending)
SELECT 
    genre, AVG(duration) AS 'average_duraion'
FROM
    tracks
GROUP BY genre
ORDER BY AVG(duration) DESC;


# 3
# Display the minimum, maximum, and average danceability of tracks made by Queen and The Beatles
SELECT 
    artist,
    MIN(danceability) AS 'min_danceability',
    MAX(danceability) AS 'max_danceability',
    AVG(danceability) AS 'avg_danceability'
FROM
    tracks
WHERE
    artist IN ('Queen' , 'The Beatles')
GROUP BY artist;


# 4
# Pop music consists of different genres, for example: Art Pop, Dance Pop, and Candy Pop are all Pop music genres. 
# How many pop music genres are listed in this dataset ?
SELECT 
    COUNT(DISTINCT genre) 'unique_pop_genres'
FROM
    tracks
WHERE
    genre LIKE '%pop%';
    

# 5
# Display the number of tracks, highest popularity, and lowest popularity each rock music artist has achieved.
# Sort the output by the number of tracks (descending)
SELECT 
    artist,
    COUNT(*) AS 'number_of_tracks',
    MAX(popularity) AS 'highest_popularity',
    MIN(popularity) AS 'lowest_popularity'
FROM
    tracks
WHERE
    genre LIKE '%rock%'
GROUP BY artist
ORDER BY COUNT(*) DESC;


# 6
# Tracks by genre
# a. List the number of tracks by each genre, for tracks released during 2005-2010.
# b. Further restrict your result to display only genres with more than 10 tracks
# a. 
SELECT 
    genre, COUNT(*) AS 'number_of_tracks'
FROM
    tracks
WHERE
    release_year BETWEEN 2005 AND 2010
GROUP BY genre;
# b.
SELECT 
    genre, COUNT(*) AS 'number_of_tracks'
FROM
    tracks
WHERE
    release_year BETWEEN 2005 AND 2010
GROUP BY genre
HAVING COUNT(*) > 10;


# 7
# List the number of tracks released by Coldplay each year. Sort the output by release_year (ascending)
SELECT 
    artist, release_year, COUNT(*) AS 'number_of_tracks'
FROM
    tracks
WHERE
    artist = 'Coldplay'
GROUP BY artist , release_year;