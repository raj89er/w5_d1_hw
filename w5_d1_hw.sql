-- Syntax Order -- (SELECT and FROM are the only mandatory clauses)

-- SELECT (column_names)
-- FROM (table_name)
-- WHERE (row filter)
-- GROUP BY (aggregations)
-- HAVING (filter aggregations)
-- ORDER BY (column_value ASC or DESC)
-- OFFSET (number of rows to skip)
-- LIMIT (max number of rows to display)

--Question 1. How many actors are there with the last name ‘Wahlberg’?

SELECT last_name, first_name
FROM actor
WHERE last_name = 'Wahlberg';

-- there are 2, Nick & Daryl Wahlberg


-- Question 2. How many payments were made between $3.99 and $5.99?

SELECT COUNT(amount)
FROM payment
WHERE amount >= '3.99' AND amount <= '5.99';

-- there were [5,607] $3.99 <= payments <= $5.99


-- 3. What films have exactly 7 copies? (search in inventory)

SELECT *
FROM inventory
GROUP BY inventory_id 
HAVING SUM(inventory_id) = 7;

-- there's only 1 movie with exactly 7 copies


-- 4. How many customers have the first name ‘Willie’?

SELECT first_name, last_name
FROM customer
WHERE first_name = 'Willie';

SELECT COUNT(first_name)
FROM customer
WHERE first_name LIKE 'Willie%';

--there are 2 customers with first name willie


-- 5. What store employee (get the id) sold the most rentals (use the rental table)?

SELECT staff_id, MAX(rentals_sold)
FROM (
    SELECT staff_id, COUNT(*) AS rentals_sold
    FROM rental
    GROUP BY staff_id
) AS rentals_count
GROUP BY staff_id;

-- staff_id(1) sold more rentals


-- 6. How many unique district names are there?
-- city_id from city???

SELECT DISTINCT city_id
FROM city
ORDER BY city_id DESC ;

SELECT COUNT(DISTINCT city_id)
FROM city;


-- There are 600 different cities


-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(actor_id) AS actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count DESC;

-- film_id(508) has the highest actor_count


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT COUNT(*)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

SELECT first_name, last_name
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

-- There are 13 customers that have a last name ending with ‘es’


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)

SELECT amount, COUNT(*)
FROM payment
WHERE customer_id >= 380 AND customer_id <= 430
GROUP BY amount
HAVING COUNT(*) > 250;

-- um... it's late, please see table below 


-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?

SELECT COUNT(DISTINCT rating)
FROM film;

SELECT DISTINCT rating
FROM film;

SELECT rating, COUNT(*) AS movie_count
FROM film
GROUP BY rating
ORDER BY movie_count DESC;

-- PG-13 has the highest amount of movies












