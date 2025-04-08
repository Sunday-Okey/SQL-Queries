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

-- 4. Article Views I

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;


-- 5. Invalid Tweets

SELECT tweet_id
FROM tweets
WHERE LENGTH(content) > 15;

-- 6. Replace Employee ID With The Unique Identifier

SELECT 
    eu.unique_id, 
    e.name 
FROM 
    Employees e 
LEFT JOIN 
    EmployeeUNI eu ON e.id = eu.id;


-- 7. Product Sales Analysis I

SELECT 
    p.product_name,
    s.year,
    s.price
FROM 
    Sales s
INNER JOIN 
    Product p ON s.product_id = p.product_id;

-- 8. Customer Who Visited but Did Not Make Any Transactions

SELECT 
    v.customer_id, 
    COUNT(*) AS count_no_trans
FROM 
    Visits v
LEFT JOIN 
    Transactions t ON v.visit_id = t.visit_id
WHERE 
    t.transaction_id IS NULL
GROUP BY 
    v.customer_id;

-- 9. Rising Temperature

SELECT w1.id
FROM Weather w1
JOIN Weather w2 
ON w1.recordDate = w2.recordDate + INTERVAL '1 DAY'
WHERE w1.temperature > w2.temperature;

-- 10. Average Time of Process per Machine
SELECT 
    s.machine_id, 
    ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM Activity AS s
INNER JOIN Activity AS e 
    ON s.machine_id = e.machine_id 
    AND s.process_id = e.process_id 
    AND s.activity_type = 'start' 
    AND e.activity_type = 'end'
GROUP BY s.machine_id;

SELECT 
    machine_id, 
    ROUND(AVG(end_time - start_time), 3) AS processing_time
FROM (
    SELECT 
        machine_id, 
        process_id,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS end_time,
        MIN(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time
    FROM Activity
    GROUP BY machine_id, process_id
) AS process_durations
GROUP BY machine_id;