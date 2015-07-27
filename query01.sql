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
