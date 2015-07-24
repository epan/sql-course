SELECT title, rental_rate
FROM film
-- WHERE rental_rate = .99
;

-- Brainbuster #1
-- Find customers by first name, last name, and email
-- who are customers of store 2
SELECT
  first_name, last_name, email, store_id
FROM
  customer
WHERE
  store_id = 2
;

-- Trying count()
SELECT count(title), rental_rate
FROM film
;

-- Group by prices
SELECT
  count(title), rental_rate
FROM
  film
GROUP BY
  rental_rate
;

-- Brainbuster 2
-- Which rating do we have the most films in?
-- The find out which rating is most prevalent in each price
-- Use only 1 query
SELECT
  count(title), rating, rental_rate
FROM
  film
GROUP BY
  rental_rate, rating
;
