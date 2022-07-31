# 1
# Write a query to display the app_id, app_name, category and reviews for apps with more reviews than app_id 64
SELECT 
    app_id, app_name, category, reviews
FROM
    apps
WHERE
    reviews > (SELECT 
            reviews
        FROM
            apps
        WHERE
            app_id = 64);
            
            
# 2
# Write a query to display the app_name, category, size_in_mb, and rating, for apps in the same category as Redhold (app_name)
SELECT 
    app_name, category, size_in_mb, rating
FROM
    apps
WHERE
    category = (SELECT 
            category
        FROM
            apps
        WHERE
            app_name = 'Redhold');
            
            
# 3
# Write a query to display the app_name, category, app_version, and last_updated, for apps which were last_updated before app_id 29
SELECT 
    app_id, app_name, category, app_version, last_updated
FROM
    apps
WHERE
    last_updated < (SELECT 
            last_updated
        FROM
            apps
        WHERE
            app_id = 29);
            

# 4
# Write a query to display the app_name, category, app_version, and rating, for apps with rating higher than the average
SELECT 
    app_name, category, app_version, rating
FROM
    apps
WHERE
    rating > (SELECT 
            AVG(rating)
        FROM
            apps);
            
            
# 5 
# Write a query to display the categories having apps in the same size_in_mb as apps in the education category
SELECT DISTINCT
    category
FROM
    apps
WHERE
    size_in_mb IN (SELECT 
            size_in_mb
        FROM
            apps
        WHERE
            category = 'Education')
        AND category != 'Education';
        
        
# 6
# a. What is the min rating of apps in the Education category ? 
SELECT 
    MIN(rating)
FROM
    apps
WHERE
    category = 'Education';
    
# b. What is the max rating of apps in the Education category ? 
SELECT 
    MAX(rating)
FROM
    apps
WHERE
    category = 'Education';
    
# c. Write a query to display the app_name and rating for apps with rating in the range of Education min and max values
SELECT 
    app_name, rating
FROM
    apps
WHERE
    rating BETWEEN (SELECT 
            MIN(rating)
        FROM
            apps
        WHERE
            category = 'Education') AND (SELECT 
            MAX(rating)
        FROM
            apps
        WHERE
            category = 'Education');
            
            
# 7 
# Write a query to display the app_id, app_name, rating and reviews for app with rating higher than app_id 131 
# and (number of) reviews higher than app_id 28
SELECT 
    app_id, app_name, rating AND reviews
FROM
    apps
WHERE
    rating > (SELECT 
            rating
        FROM
            apps
        WHERE
            app_id = 131)
        AND reviews > (SELECT 
            reviews
        FROM
            apps
        WHERE
            app_id = 28);