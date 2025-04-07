-- Crack SQL Interview in 50 Qs


-- SQL 50

-- 1. Recyclable and Low Fat Products

SELECT product_id
FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y';


-- 2. Find Customer Referee

SELECT name
FROM customer
WHERE referee_id <> 2 OR referee_id IS NULL;

-- 3. Big Countries

SELECT name, population, area
FROM world
WHERE 
  area >= 3000000    -- Filter for large area (≥3M km²)
  OR population >= 25000000; -- Filter for large population (≥25M)

-- 3. Article Views I

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;


-- 4. Invalid Tweets

SELECT tweet_id
FROM tweets
WHERE LENGTH(content) > 15;

-- 5. Replace Employee ID With The Unique Identifier

SELECT 
    eu.unique_id, 
    e.name 
FROM 
    Employees e 
LEFT JOIN 
    EmployeeUNI eu ON e.id = eu.id;


-- 6. Product Sales Analysis I

SELECT 
    p.product_name,
    s.year,
    s.price
FROM 
    Sales s
INNER JOIN 
    Product p ON s.product_id = p.product_id;