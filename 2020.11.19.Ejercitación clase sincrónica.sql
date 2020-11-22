USE movies_db;

#			JOINS
# 2. Mostrar el título y el nombre del género de todas las series.
SELECT series.title, genres.name
FROM series
INNER JOIN genres ON genre_id = genres.id;

# 3. Mostrar el título de los episodios, el nombre y apellido de los actores que trabajan en
# cada uno de ellos.
SELECT episodes.title, actors.first_name, actors.last_name
FROM episodes
INNER JOIN actor_episode ON episode_id = episodes.id
INNER JOIN actors ON actor_id = actors.id;

#			DISTINCTAS
# 4. Mostrar sólo el nombre y apellido de los actores que trabajan en todas las películas de
# la guerra de las galaxias y que estos no se repitan.
SELECT DISTINCT actors.first_name, actors.last_name
FROM actors
INNER JOIN actor_movie ON actor_id = actors.id
INNER JOIN movies ON movie_id = movies.id
WHERE movies.title LIKE "la guerra de las galaxias%";

#			COALESCE
# 5. Mostrar el título de cada película con su género correspondiente, en el caso de que no
# tenga género que imprima "no tiene género".
SELECT movies.title, COALESCE(genres.name, "no tiene género")
FROM movies
LEFT JOIN genres ON genre_id = genres.id;

#			DATEDIFF
# 6. mostrar el título de cada serie y en la segunda columna (a la cual llamaremos: duración)
# la cantidad de días desde su estreno hasta su fin.
SELECT title, datediff(series.end_date, series.release_date) AS DURACION
FROM series;

#			LENGTH
# 7. Mostrar todos los actores cuyos nombre sean mayor a 6 caracteres, ordenados de la A a
# la Z.
SELECT first_name, last_name
FROM actors
WHERE LENGTH(first_name) > 6
ORDER BY first_name;

#			COUNT
# 8. Mostrar la cantidad total de episodios.
SELECT COUNT(*)
FROM episodes;

#			GROUP BY & HAVING
# 9. Mostrar el título de todas las series y el total de temporadas que tiene cada una de ellas.
SELECT series.title AS SERIES, COUNT(seasons.id) AS TEMPORADAS
FROM series
INNER JOIN seasons ON serie_id = series.id
GROUP BY SERIES;

# 10. Mostrar el nombre de todos los géneros y la cantidad total de películas por cada uno
# siempre que sea mayor o igual a 3.
SELECT COUNT(genres.name) AS PELICULAS, genres.name 
FROM movies 
INNER JOIN genres ON genre_id = genres.id
GROUP BY genres.name 
HAVING COUNT(genres.name) > 3;

