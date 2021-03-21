use sakila;
-- ví dụ về lỗi specyal j j đó
UPDATE film 
SET film.language_id = 2
WHERE film.film_id IN (SELECT f.film_id 
					FROM film f
					INNER JOIN film_actor fa
					ON f.film_id = fa.film_id
					WHERE fa.actor_id = 12);
                    
                    
                    
                    UPDATE film 
SET film.language_id = 2
WHERE film.film_id IN (SELECT * FROM(SELECT f.film_id 
                    FROM film f
                    INNER JOIN film_actor fa
                    ON f.film_id = fa.film_id
                    WHERE fa.actor_id = 12)tblTmp);
                    