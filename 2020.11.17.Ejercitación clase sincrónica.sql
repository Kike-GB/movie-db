USE movies_db;

# SELECT 1. MOSTRAR TODOS LOS REGISTROS DE LA TABLA DE MOVIES 
SELECT * 
FROM movies;

# SELECT 2. Mostrar el nombre, apellido y rating de todos los actores.
SELECT first_name, last_name, rating
FROM actors;

# SELECT 3. Mostrar el título de todas las series y usar alias para que tanto el nombre de la tabla
# como el campo estén en español.
SELECT title AS Título
FROM series AS Series;

# WHERE Y ORDER BY 4. Mostrar el nombre y apellido de los actores cuyo rating sea mayor a 7.5.
 SELECT first_name, last_name
 FROM actors
 WHERE rating > 7.5;
 
# WHERE Y ORDER BY 5. Mostrar el título de las películas, el rating y los premios de las películas con un rating
# mayor a 7.5 y con más de dos premios.
SELECT title, rating, awards
FROM movies
WHERE (rating > 7.5) AND (awards > 2);

# WHERE Y ORDER BY 6. Mostrar el título de las películas y el rating ordenadas por rating en forma ascendente.
SELECT title, rating
FROM movies
ORDER BY rating ASC;

# LIMIT Y OFFSET 7. Mostrar los títulos de las primeras tres películas en la base de datos.
SELECT title
FROM movies
LIMIT 3;
 
# LIMIT Y OFFSET 8. Mostrar el top 5 de las películas con mayor rating.
SELECT * 
FROM movies
ORDER BY rating DESC
LIMIT 5;

# LIMIT Y OFFSET 9. Mostrar las top 5 a 10 de las películas con mayor rating.
SELECT * 
FROM movies
ORDER BY rating DESC
LIMIT 5
OFFSET 5;

# LIMIT Y OFFSET 10. Listar los actores cada 10 y traer las páginas 3 y 5 (son dos consultas).
SELECT *
FROM actors
LIMIT 10
OFFSET 30;
SELECT *
FROM actors
LIMIT 10
OFFSET 50;

# BETWEEN Y LIKE 11. Mostrar el título y rating de todas las películas cuyo título sea de Toy Story.
SELECT title, rating
FROM movies
WHERE title LIKE "Toy Story%";

# BETWEEN Y LIKE 12. Mostrar a todos los actores que se llamen Sam.
SELECT *
FROM actors
WHERE first_name LIKE "Sam";

# BETWEEN Y LIKE 13. Mostrar el título de las películas que salieron entre el 2004 y 2008.
SELECT *
FROM movies
WHERE YEAR(release_date) BETWEEN 2004 AND 2008;

# CONSULTAS INTEGRADORAS 14. Traer el título de las películas con el rating con más de 1 premio entre el año 1988 al
# 2009 ordenadas por rating.
SELECT title, rating
FROM movies
WHERE (awards > 1) AND YEAR(release_date) BETWEEN 1988 AND 2009
ORDER BY rating;

# CONSULTAS INTEGRADORAS 15. Traer el top 3 a partir del registro 10 de la consulta anterior.
SELECT title, rating
FROM movies
WHERE (awards > 1) AND YEAR(release_date) BETWEEN 1988 AND 2009
ORDER BY rating
LIMIT 10
OFFSET 3;
