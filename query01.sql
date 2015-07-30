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

-- Brainbuster 3
-- List of every single film, with the name, category, and language of it
SELECT
  film.title, category.name, language.name
FROM
  film, film_category, category, language
WHERE
  film.film_id = film_category.film_id
  AND
  film_category.category_id = category.category_id
  AND
  film.language_id = language.language_id
;

-- Exercise on rentals by title
SELECT
  film.title, count(rental.rental_id)
FROM
  film, inventory, rental
WHERE
  film.film_id = inventory.film_id
  and
  rental.inventory_id = inventory.inventory_id
GROUP BY
  film.title
;

# Revenue per video title
-- Revenue = price * number of rentals
SELECT
  film.title as Title, count(rental.rental_id) as "Number of Rentals", film.rental_rate as "Rental Price", count(rental.rental_id) * film.rental_rate as Revenue
FROM
  film, inventory, rental
WHERE
  film.film_id = inventory.film_id
  and
  rental.inventory_id = inventory.inventory_id
GROUP BY
  film.title
ORDER BY
  Revenue desc
;

# What customer has paid us the most money?
SELECT
  payment.customer_id as "Customer ID", SUM(payment.amount) as "Total Revenue"
FROM
  payment
GROUP BY
  1
ORDER BY
  2 desc
;

# Revenue by store try 1
SELECT
  store.store_id as Store, SUM(payment.amount) as Revenue
FROM
  inventory, rental, payment, film, store
WHERE
  inventory.inventory_id = rental.inventory_id
  and
  rental.rental_id = payment.rental_id
  and
  inventory.film_id = film.film_id
  and
  inventory.store_id = store.store_id
GROUP BY
  store.store_id
ORDER BY
  2 desc
;

# Revenue by store try 2
-- 67416.51 Total
SELECT
  inventory.store_id as "Store ID", SUM(payment.amount) as "Revenue"
FROM
  inventory, payment, rental
WHERE
  payment.rental_id = rental.rental_id
  and
  inventory.inventory_id = rental.inventory_id
GROUP BY
  inventory.store_id
ORDER BY
  2 desc
;

-- Brainbuster
-- 1. Every customer's last rental date
-- 2. Revenue by month
SELECT
  customer.first_name, customer.last_name, max(rental.rental_date)
FROM
  rental, customer
WHERE
  rental.customer_id = customer.customer_id
GROUP BY
  customer.customer_id
;

SELECT
  left(payment.payment_date, 7) as "Month", sum(payment.amount) as "Total Revenue"
FROM
  payment
GROUP BY
  1
;

-- Brainbuster
-- Unique movies rented per month
SELECT
  left(rental.rental_date, 7) as "Month", count(distinct inventory.film_id) as "Distinct films"
FROM
  rental, inventory
WHERE
  rental.inventory_id = inventory.inventory_id
GROUP BY
  1
ORDER BY
  1
;
