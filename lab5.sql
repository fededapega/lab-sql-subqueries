USE sakila;

# Determine the number of copies of the film "Hunchback Impossible"
# that exist in the inventory system.
 

        
SELECT COUNT(*)
FROM inventory ixi
JOIN 
					(SELECT film_id 
						FROM film) jnj
ON ixi.film_id = jnj.film_id
WHERE ixi.film_id = 439;


# List all films whose length is longer than the average length of all the films in the Sakila database.

SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film)
ORDER BY length DESC;

#Use a subquery to display all actors who appear in the film "Alone Trip".



SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
					SELECT fx.actor_id
					FROM film_actor fx
					JOIN (
							SELECT film_id
							FROM film
							WHERE title LIKE "Alone Trip") fx2 
                    ON fx.film_id = fx2.film_id
);

    
