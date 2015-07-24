SELECT title, rental_rate
FROM film
-- WHERE rental_rate = .99
;

-- Brainbuster #1
-- Find customers by first name, last name, and email
-- who are customers of store 2
SELECT first_name, last_name, email, store_id
FROM customer
WHERE store_id = 2
;
