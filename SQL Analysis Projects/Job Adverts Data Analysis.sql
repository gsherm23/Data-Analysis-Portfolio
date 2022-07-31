# In this project I am using the Job Adverts Database.
# The jobs_adverts database consists of a single table - jobs, 
# which contains of a large number of rows, representing individual job ads.




# 1
# a. Write a query to display the job_id, job_title, salary_estimate_min, salary_estimate_max
# b. Repeat your last query, only this time display only the job adverts where salary_estimate_max is less than 105,000
# a.
SELECT 
    job_id, job_title, salary_estimate_min, salary_estimate_max
FROM
    jobs;
# b.
SELECT 
    job_id, job_title, salary_estimate_min, salary_estimate_max
FROM
    jobs
WHERE
    REPLACE(salary_estimate_max, 'K', '') < 105;
    
  
# 2
# Write a query to display the company_name, company_rank, company_size_min, and company_size_max
# for companies with more than 60 employees and less than 120 employees
SELECT DISTINCT
    company_name,
    company_rank,
    company_size_min,
    company_size_max
FROM
    jobs
WHERE
    REPLACE(company_size_min,
        ' Employees',
        '') > 60
        AND REPLACE(company_size_max,
        ' Employees',
        '') < 120;


# 3
# Write a query to display the :
# a. job_id
# b. job_title in uppercase
# c. company_name in lowercase
SELECT 
    job_id,
    UPPER(job_title) AS 'upper_jobtitle',
    LOWER(company_name) AS 'lower_companyname'
FROM
    jobs;
    
   
# 4
# Write a query to display the:
# a. job_id, company_name, headquarters_of_company
# b. first letter of company_name
# c. first letter of headquarters_of_company
SELECT 
    job_id,
    company_name,
    headquarters_of_company,
    SUBSTRING(company_name, 1, 1) AS 'company_name_first_letter',
    SUBSTRING(headquarters_of_company, 1, 1) AS 'state_of_company_first_letter'
FROM
    jobs;
    

# 5
# Write a query to display the :
# a. job_id
# b. company_name
# c. headquarters_of_company
# d. company_code - a new column containing a concatenation of: 
# the first letter of company_name and the first letter of headquarters_of_company
SELECT 
    job_id,
    company_name,
    headquarters_of_company,
    CONCAT(SUBSTRING(company_name, 1, 1),
            SUBSTRING(headquarters_of_company, 1, 1)) 'company_code'
FROM
    jobs;
    
    
# 6
# Write a query to display the job titles with length greater than 29
SELECT DISTINCT
    job_title
FROM
    jobs
WHERE
    LENGTH(job_title) > 29;
    
    
# 7
# Write a query to display the:
# a. company_name
# b. company_rank
# c. company_market_value
# d. company_market_value rounded using ROUND function with precision of 2 digits
# e. company_market_value rounded down using FLOOR
# f. company_market_value rounded up using CEIL
SELECT 
    company_name,
    company_rank,
    company_market_value,
    ROUND(company_market_value, 2) AS 'round_mv',
    FLOOR(company_market_value) AS 'floor_mv',
    CEIL(company_market_value) AS 'ceil_mv'
FROM
    jobs;
    
    
# 8
# Which job adverts were posted during January 2017 ? Display columns you consider relevant
SELECT 
    job_id, job_title, published_date, removed_date
FROM
    jobs
WHERE
    YEAR(published_date) = 2017
        AND MONTH(published_date) = 1;
        
        
# 9
# Which job adverts were removed after a single day ?
SELECT 
    job_id, job_title, published_date, removed_date
FROM
    jobs
WHERE
    TIMESTAMPDIFF(DAY,
        published_date,
        removed_date) = 1;
        
# 10
# Which job adverts were posted on the same day and month as the current date ?
SELECT 
    job_id, job_title, published_date, removed_date
FROM
    jobs
WHERE
    DAY(published_date) = DAY(CURDATE())
        AND MONTH(published_date) = MONTH(CURDATE());  
        
        
# 11 
# In a few job adverts, the value of published_date is greater than the removed_date,  those rows represent invalid data.
# Find those rows
SELECT 
    job_id, job_title, published_date, removed_date
FROM
    jobs
WHERE
    published_date > removed_date;
    
    
# 12
# List the job adverts where at least one of the following conditions is met:
# a. The row does not contain a value in removed_date
# b. The row does not contain a value in company_name
# c. The row does not contain a value in headquarters_of_company
SELECT 
    job_id,
    job_title,
    removed_date,
    company_name,
    headquarters_of_company
FROM
    jobs
WHERE
    removed_date IS NULL
        OR company_name IS NULL
        OR headquarters_of_company IS NULL;
        

# 13 
# Take your previous report and instead of the NULL values:
# a. Display the current date instead of NULL values in removed_date
# b. Display the company_state instead of NULL values in headquarters_of_company
# c. Display 'Not Available' instead of NULL values in company_name
SELECT 
    job_id,
    job_title,
    IFNULL(removed_date, CURDATE()) AS 'removed_date',
    IFNULL(headquarters_of_company,
            state_of_company) AS 'headquarters_of_company',
    IFNULL(company_name, 'Not Available') AS 'company_name'
FROM
    jobs
WHERE
    removed_date IS NULL
        OR company_name IS NULL
        OR headquarters_of_company IS NULL;
        

# 14
# Write a query to display the company_name, company_market_value, and a new column : company_market_value_rank, based on the following logic:
# a. For companies with market_value in the range of 0-300 provide the rank : 'low range'
# b. For companies with market_value in the range of 301-600 provide the rank : 'mid range'
# c. For companies with market_value in the range of 601-900 provide the rank : 'high range'
# d. For any other range provide the rank : 'other range'
SELECT DISTINCT
    company_name,
    company_market_value,
    CASE
        WHEN company_market_value BETWEEN 0 AND 300 THEN 'low range'
        WHEN company_market_value BETWEEN 301 AND 600 THEN 'mid range'
        WHEN company_market_value BETWEEN 601 AND 900 THEN 'high range'
        ELSE 'other range'
    END AS 'company_market_value_rank'
FROM
    jobs;
    

# 15
# Write a query to display the job_title, company_name, company_size_min, company_size_max, and a new column - company_size, based on the following logic:
# a. For companies with up to 60 employees, provide the value: ‘Small Company’
# b. For companies with up to 120 employees, provide the value: ‘Medium Company’
# c. For companies with up to 180 employees, provide the value: ‘ Large Company’
# d. For any other range 'Unknown'
SELECT 
    job_title,
    company_name,
    company_size_min,
    company_size_max,
    CASE
        WHEN
            REPLACE(company_size_max,
                ' Employees',
                '') <= 60
        THEN
            'Small Company'
        WHEN
            REPLACE(company_size_max,
                ' Employees',
                '') <= 120
        THEN
            'Medium Company'
        WHEN
            REPLACE(company_size_max,
                ' Employees',
                '') <= 180
        THEN
            'Large Company'
        ELSE 'Unknown'
    END AS 'company_size'
FROM
    jobs;
    
    
