# In this project I am using the CarsOnline Database.
# CarsOnline is a fictional online platform, allowing customers to find the 
# right car for them, buy it online, and get it right at their doorstep.

# The CarsOnline consists of the following tables:
# cars - Provides details about the various cars (both sold and unsold)
# car_types - Provides further details about the car type (i.e., Ford Mustang 1980)
# fuel_types - Provides further details about the car fuel type (i.e., Diesel, Electric etc.)
# transmission_types - Provides further details about the car gearbox type
# customers - Provides details about the company’s customers who have bought at least one car
# genders - Provides further details about the gender of each customer
# locations - Provides further details about the location of each customer
# sales - Provides details about each car purchase




# 1
# a. Write a query to display the car_id, price, car_make, car_model, and car_year for each car
USE carsonline;
SELECT 
    c.car_id, c.price, ct.car_make, ct.car_model, ct.car_year
FROM
    cars c
        JOIN
    car_types ct ON c.car_type_id = ct.car_type_id;
    
# b. restrict your query to display only cars made by bmw on 2019
SELECT 
    c.car_id, c.price, ct.car_make, ct.car_model, ct.car_year
FROM
    cars c
        JOIN
    car_types ct ON c.car_type_id = ct.car_type_id
WHERE
    ct.car_make = 'bmw'
        AND ct.car_year BETWEEN 2015 AND 2019;

# c. Display the average price for each car model during this year
SELECT
    ct.car_model, AVG(c.price) AS 'average_price'
FROM
    cars c
        JOIN
    car_types ct ON c.car_type_id = ct.car_type_id
WHERE
    ct.car_make = 'bmw'
        AND ct.car_year = 2019
GROUP BY ct.car_model;


# 2
# a. Write a query to display the car_id, price and fuel_type_name for each car
SELECT 
    c.car_id, c.price, ft.fuel_type_name
FROM
    cars c
        JOIN
    fuel_types ft ON c.fuel_type_id = ft.fuel_type_id;
    
# b. Display the number of cars by each fuel_type_name. Sort the output by the number of cars (descending)
SELECT 
    ft.fuel_type_name, COUNT(*) AS 'number_of_cars'
FROM
    cars c
        JOIN
    fuel_types ft ON c.fuel_type_id = ft.fuel_type_id
GROUP BY ft.fuel_type_name
ORDER BY COUNT(*) DESC;


# 3
# a. Write a query to display the car_id, price and transmission_name for each car
SELECT 
    c.car_id, c.price, tt.transmission_name
FROM
    cars c
        JOIN
    transmission_types tt ON c.transmission_type_id = tt.transmission_type_id;
    
# b. Display the average price for each transmission_name. Sort the output by the average price (descending)
SELECT 
    tt.transmission_name, AVG(c.price) AS 'average_price'
FROM
    cars c
        JOIN
    transmission_types tt ON c.transmission_type_id = tt.transmission_type_id
GROUP BY tt.transmission_name
ORDER BY AVG(c.price) DESC;


# 4 
# Write a query to display the unique number of hybrid cars for each car_make. Sort the output by the number of cars (Descending)
SELECT 
    ct.car_make,
    COUNT(DISTINCT ct.car_model) AS 'number_of_hybrid_cars'
FROM
    cars c
        JOIN
    fuel_types ft ON c.fuel_type_id = ft.fuel_type_id
        JOIN
    car_types ct ON c.car_type_id = ct.car_type_id
WHERE
    ft.fuel_type_name = 'Hybrid'
GROUP BY car_make
ORDER BY COUNT(DISTINCT car_model) DESC;


# 5
# Write a query to display the number of manual-gearbox cars, by each car_year and car_make. Sort the output by the year (ascending)
SELECT 
    ct.car_year, ct.car_make, COUNT(*) AS 'number_of_cars'
FROM
    cars c
        JOIN
    transmission_types tt ON c.transmission_type_id = tt.transmission_type_id
        JOIN
    car_types ct ON c.car_type_id = ct.car_type_id
WHERE
    tt.transmission_name = 'Manual'
GROUP BY ct.car_year , ct.car_make
ORDER BY ct.car_year;


# 6
# a. Write a query to display the customer_id, first_name, last_name, birth_date, and gender
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.birth_date,
    g.gender
FROM
    customers c
        JOIN
    genders g ON c.gender_code = g.gender_code;
    
# b. Display the number of customers by each gender
SELECT 
    g.gender, COUNT(*) AS 'number_of_customers'
FROM
    customers c
        JOIN
    genders g ON c.gender_code = g.gender_code
GROUP BY g.gender;

# c. Display the number of customers by each gender and age. Sort the output by the number of customers (descending)
SELECT 
    g.gender,
    TIMESTAMPDIFF(YEAR,
        c.birth_date,
        CURDATE()) AS 'age',
    COUNT(*) AS 'number_of_customers'
FROM
    customers c
        JOIN
    genders g ON c.gender_code = g.gender_code
GROUP BY g.gender , TIMESTAMPDIFF(YEAR,
    c.birth_date,
    CURDATE())
ORDER BY COUNT(*) DESC;

# d. Restrict your query to for customers above the age 59
SELECT 
    g.gender,
    TIMESTAMPDIFF(YEAR,
        c.birth_date,
        CURDATE()) AS 'age',
    COUNT(*) AS 'number_of_customers'
FROM
    customers c
        JOIN
    genders g ON c.gender_code = g.gender_code
WHERE
    TIMESTAMPDIFF(YEAR,
        c.birth_date,
        CURDATE()) > 59
GROUP BY g.gender , TIMESTAMPDIFF(YEAR,
    c.birth_date,
    CURDATE())
ORDER BY COUNT(*) DESC;


# 7 
# a. Write a query to display the number of customers living in Australia.
SELECT 
    COUNT(*) AS 'number_of_customers'
FROM
    customers c
        JOIN
    locations l ON c.location_code = l.location_code
WHERE
    l.country = 'Australia';
    
# b. Write another query to display the number of customers with updated phone_number living in Australia
# (customers who has value in phone_number)
SELECT 
    COUNT(phone_number) AS 'number_of_customers'
FROM
    customers c
        JOIN
    locations l ON c.location_code = l.location_code
WHERE
    l.country = 'Australia';
    
# c. Write another query to display the number of australian customers with NULL value in their phone_number, 
# break down the result for each city, sort it by the count (descending).
SELECT 
    city, COUNT(*) AS 'number_of_customers'
FROM
    customers c
        JOIN
    locations l ON c.location_code = l.location_code
WHERE
    l.country = 'Australia'
        AND phone_number IS NULL
GROUP BY city
ORDER BY COUNT(*) DESC;


# 8
# Write a query to display the customer_id and full name of customers who bought more than 5 cars
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS 'full_name',
    COUNT(*) AS 'number_of_cars'
FROM
    sales s
        JOIN
    customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id , CONCAT(c.first_name, ' ', c.last_name)
HAVING COUNT(*) > 5;


# 9
# Not every car on the cars table has been sold. Write a query to display the percent of sold cars.
SELECT 
    COUNT(s.customer_id) / COUNT(*) * 100 AS 'percent_of_sold_cars'
FROM
    sales s
        RIGHT OUTER JOIN
    cars c ON s.car_id = c.car_id;
    

# 10 
# On 2019 (of purchase date), What was the average price of sold cars made by Audi?
SELECT 
    AVG(cr.price) AS 'average_price'
FROM
    sales s
        JOIN
    cars cr ON s.car_id = cr.car_id
        JOIN
    car_types ct ON ct.car_type_id = cr.car_type_id
WHERE
    YEAR(s.purchase_date) = 2019
        AND ct.car_make = 'Audi';

