<<<<<<< HEAD
-- 1 Devuelve todas las películasSELECT * FROM MOVIES m
-- 2- Devuelve todos los géneros existentesSELECT * FROM GENRES--
 3- Devuelve la lista de todos los estudios de grabación que estén activosSELECT * FROM STUDIOS WHERE studio_active=1
 -- 4- Devuelve una lista de los 20 últimos miembros en anotarse a la plataformaSELECT * FROM USERS ORDER BY user_join_date DESC LIMIT 10
=======
-- 1 Devuelve todas las películas
SELECT * FROM MOVIES m
-- 2- Devuelve todos los géneros existentes
SELECT * FROM GENRES--
 --3- Devuelve la lista de todos los estudios de grabación que estén activos
 SELECT * FROM STUDIOS WHERE studio_active=1
 -- 4- Devuelve una lista de los 20 últimos miembros en anotarse a la plataforma
 SELECT * FROM USERS ORDER BY user_join_date DESC LIMIT 10
>>>>>>> ea9e7f1 ( acabo ejercicios)
 --5- Devuelve las 20 duraciones de películas más frecuentes, ordenados de mayor a menor
 SELECT movie_duration,COUNT(movie_id)AS "NUM_MOVIES" FROM MOVIES GROUP BY movie_duration ORDER BY NUM_MOVIES DESC LIMIT 20
 --6- Devuelve las películas del año 2000 en adelante que empiecen por la letra A.
 SELECT * FROM MOVIES WHERE YEAR(movie_release_date) >=2000 AND movie_name LIKE 'A%'
 --7- Devuelve los actores nacidos un mes de Junio
 SELECT actor_name,actor_birth_date FROM ACTORS where MONTH (actor_birth_date) =06
 --8- Devuelve los actores nacidos cualquier mes que no sea Junio y que sigan vivos
 SELECT * FROM ACTORS where MONTH (actor_birth_date) <>06 AND actor_dead_date IS NULL ORDER BY ACTOR_BIRTH_DATE DESC
 --9- Devuelve el nombre y la edad de todos los directores menores o iguales de 50 años que estén vivos
 SELECT d.DIRECTOR_NAME , DATEDIFF(YEAR, d.DIRECTOR_BIRTH_DATE, TODAY()) AS "AGE" FROM DIRECTORS d WHERE DATEDIFF(YEAR, d.DIRECTOR_BIRTH_DATE, TODAY() ) <= 50 AND d.DIRECTOR_DEAD_DATE IS NULL
 --10- Devuelve el nombre y la edad de todos los actores menores de 50 años que hayan fallecido
 SELECT ACTOR_NAME, DATEDIFF(YEAR, ACTOR_BIRTH_DATE, ACTOR_DEAD_DATE) AS "AGE" FROM ACTORS WHERE DATEDIFF(YEAR, ACTOR_BIRTH_DATE, ACTOR_DEAD_DATE) < 50 AND ACTOR_DEAD_DATE IS NOT NULL
 --11- Devuelve el nombre de todos los directores menores o iguales de 40 años que estén vivos
 SELECT director_name FROM directors WHERE datediff (YEAR, DIRECTOR_BIRTH_DATE, today)<=40 AND DIRECTOR_DEAD_DATE IS NULL
 --12- Indica la edad media de los directores vivos
 SELECT AVG(DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE , TODAY())) AS EDAD_MEDIA FROM DIRECTORS WHERE DIRECTOR_DEAD_DATE IS NULL
 --13- Indica la edad media de los actores que han fallecido
 SELECT AVG(DATEDIFF(YEAR, ACTOR_BIRTH_DATE , ACTOR_DEAD_DATE)) AS EDAD FROM ACTORS WHERE ACTOR_DEAD_DATE IS NOT NULL
 --44- Devuelve la cantidad de películas accedidas por cada mes del año 2016
 SELECT COUNT(uma.ACCESS_ID) AS TOTAL_ACCESS, MONTH(uma.ACCESS_DATE) AS "MONTH" FROM USER_MOVIE_ACCESS uma WHERE YEAR(uma.ACCESS_DATE) = 2016 GROUP BY MONTH ORDER BY MONTH
 --14- Devuelve el nombre de todas las películas y el nombre del estudio que las ha realizado
 SELECT MOVIE_NAME, STUDIO_NAME FROM MOVIES JOIN STUDIOS ON MOVIES.STUDIO_ID = STUDIOS.STUDIO_ID;
 --15- Devuelve los miembros que accedieron al menos una película entre el año 2010 y el 2015
 SELECT DISTINCT(s.USER_NAME) FROM USER_MOVIE_ACCESS uma INNER JOIN USERS s ONs.USER_ID = uma.USER_IDWHERE ACCESS_DATE >= DATE '2010-01-01'AND ACCESS_DATE <= DATE '2015-01-01'
 --16- Devuelve cuantas películas hay de cada país
 SELECT NATIONALITY_NAME, COUNT(MOVIE_NAME) AS "Quantity" FROM MOVIESINNER JOIN NATIONALITIES ONMOVIES.NATIONALITY_ID = NATIONALITIES.NATIONALITY_IDGROUP BY NATIONALITY_NAME
 --17- Devuelve todas las películas que hay de género documental
 SELECT m.MOVIE_NAMEFROM MOVIES mJOIN GENRES g ON m.GENRE_ID = g.GENRE_IDWHERE g.GENRE_NAME = 'Documentary'
 --18- Devuelve todas las películas creadas por directores nacidos a partir de 1980 y que todavía están vivos
 SELECT m.MOVIE_NAME, d.DIRECTOR_NAME FROM MOVIES m JOIN DIRECTORS d ON m.DIRECTOR_ID = d.DIRECTOR_ID WHERE d.DIRECTOR_BIRTH_DATE >= '1980-01-01' AND d.DIRECTOR_DEAD_DATE IS NULL;
 --19- Indica si hay alguna coincidencia de nacimiento de ciudad (y si las hay, indicarlas) entre los miembros de la plataforma y los directores
 SELECT USER_TOWN, USER_NAME, DIRECTOR_NAME FROM USERS INNER JOIN DIRECTORS ON USERS.USER_town = DIRECTORS.DIRECTOR_BIRTH_PLACE;
 --20- Devuelve el nombre y el año de todas las películas que han sido producidas por un estudio que actualmente no esté activo
 SELECT m.MOVIE_NAME, YEAR(m.MOVIE_RELEASE_DATE) AS AÑO FROM MOVIES mINNER JOIN STUDIOS s ON m.STUDIO_ID = s.STUDIO_IDWHERE s.STUDIO_ACTIVE = FALSE --Entendiendo que el 0 significa que no está activo
 ORDER BY YEAR(m.MOVIE_RELEASE_DATE) DESC
 --21- Devuelve una lista de las últimas 10 películas a las que se ha accedido
 SELECT m.MOVIE_NAME, uma.ACCESS_DATEFROM MOVIES mJOIN USER_MOVIE_ACCESS uma ON m.MOVIE_ID = uma.MOVIE_IDORDER BY uma.ACCESS_DATE DESCLIMIT 10
 --22- Indica cuántas películas ha realizado cada director antes de cumplir 41 años
 SELECT d.DIRECTOR_NAME, COUNT(m.MOVIE_ID) AS "movie amount" FROM DIRECTORS dINNER JOIN MOVIES m ONd.DIRECTOR_ID = m.DIRECTOR_IDWHERE DATEDIFF(YEAR, d.DIRECTOR_BIRTH_DATE, m.MOVIE_RELEASE_DATE )<41GROUP BY d.DIRECTOR_NAME
 --23- Indica cuál es la media de duración de las películas de cada director
 SELECT d.DIRECTOR_NAME, AVG(m.MOVIE_DURATION) AS DURACION_MEDIA FROM MOVIES m INNER JOIN DIRECTORS d ONm.DIRECTOR_ID = d.DIRECTOR_IDGROUP BY d.DIRECTOR_ID
 --24- Indica cuál es la el nombre y la duración mínima de las películas a las que se ha accedido en los últimos 2 años por los miembros del plataforma (La “fecha de ejecución” de esta consulta es el 25-01-2019)
 SELECT m.MOVIE_NAME, m.MOVIE_DURATION FROM MOVIES m INNER JOIN USER_MOVIE_ACCESS u ON m.MOVIE_ID = u.MOVIE_ID WHERE DATEADD(YEAR, -2, DATE '2019-01-25') <= u.ACCESS_DATE ORDER BY MOVIE_DURATION LIMIT 1AJUSTAR 
 --25- Indica el número de películas que hayan hecho los directores durante las décadas de los 60, 70 y 80 que contengan la palabra “The” en cualquier parte del título
 SELECT d.DIRECTOR_NAME, COUNT(*) AS "NUMERO_PELICULAS"FROM MOVIES mJOIN DIRECTORS d ON m.DIRECTOR_ID = D.DIRECTOR_IDWHERE UPPER m.MOVIE_NAME LIKE '%THE%'AND m.MOVIE_RELEASE_DATE >= '1960-01-01'AND m.MOVIE_RELEASE_DATE < '1990-01-01'GROUP BY d.DIRECTOR_NAME
 --45- Devuelve los nombres de los usuarios que han accedido a más de 5 películas
 SELECT u.USER_NAME, COUNT(USER_ID) AS "Number of movie accesses" FROM USERS uINNER JOIN USER_MOVIE_ACCESS uma ONu.USER_ID =uma.USER_IDGROUP BY u.USER_NAMEHAVING COUNT(USER_ID)>5
 --46- Devuelve la cantidad de películas en las que ha participado cada actor.
 SELECT a.ACTOR_NAME, COUNT(ma.MOVIE_ID) AS "movie amount" FROM ACTORS a INNER JOIN MOVIES_ACTORS ma ON a.ACTOR_ID = ma.ACTOR_ID GROUP BY a.ACTOR_NAME
 --47- Devuelve el número de películas accedidas por tipo de suscripción
 SELECT s.PLAN_NAME, COUNT(DISTINCT m.MOVIE_ID)FROM MOVIES mJOIN USER_MOVIE_ACCESS uma ON m.MOVIE_ID = uma.MOVIE_IDJOIN SUBSCRIPTIONS s ON s.SUBSCRIPTION_ID = uma.ACCESS_TYPEGROUP BY s.PLAN_NAME
 --48- Devuelve el número de películas accedidas por cada usuario
 SELECT U.USER_NAME, COUNT(UMA.MOVIE_ID) AS TOTAL_ACCESS FROM USERS U JOIN USER_MOVIE_ACCESS UMA ON U.USER_ID = UMA.USER_ID GROUP BY U.USER_NAME
 --49- Devuelve los nombres de los usuarios que solo han accedido a una película
 SELECT u.USER_NAME, count(uma.movie_id) AS "Number of movie accesses" FROM USERS uINNER JOIN USER_MOVIE_ACCESS uma ONu.user_id=uma.USER_IDGROUP BY u.user_nameHAVING count(uma.movie_id)=1
 --26- Lista nombre, nacionalidad y director de todas las películas
 SELECT M.MOVIE_NAME, D.DIRECTOR_NAME, n.NATIONALITY_NAME FROM MOVIES m INNER JOIN DIRECTORS d ON m.DIRECTOR_ID = d.DIRECTOR_ID INNER JOIN NATIONALITIES n ON M.NATIONALITY_ID = N.NATIONALITY_ID;
 --27- Muestra las películas con los actores que han participado en cada una de ellas
 SELECT m.MOVIE_NAME, m.MOVIE_ID, GROUP_CONCAT(a.ACTOR_NAME SEPARATOR ', ' ) AS "Actores y actrices" FROM MOVIES_ACTORS ma JOIN MOVIES m ON ma.MOVIE_ID = m.MOVIE_ID JOIN ACTORS a ON ma.ACTOR_ID = a.ACTOR_ID GROUP BY m.MOVIE_ID
 --28- Indica cual es el nombre del director del que más películas se ha accedido
 SELECT D.DIRECTOR_NAME, COUNT(UMA.ACCESS_ID ) AS TOTAL_ACCESOSFROM USER_MOVIE_ACCESS UMAINNER JOIN MOVIES MON UMA.MOVIE_ID = M.MOVIE_IDINNER JOIN DIRECTORS DON M.DIRECTOR_ID = D.DIRECTOR_IDGROUP BY D.DIRECTOR_ID, D.DIRECTOR_NAMEORDER BY TOTAL_ACCESOS DESCLIMIT 1;
 --29 Indica cuantos premios han ganado cada uno de los estudios con las películas que han creado
 SELECT S.STUDIO_NAME, SUM(A.AWARD_WIN) AS TOTAL_PREMIOSFROM STUDIOS SINNER JOIN MOVIES MON S.STUDIO_ID = M.STUDIO_IDINNER JOIN AWARDS AON M.MOVIE_ID = A.MOVIE_IDGROUP BY S.STUDIO_ID ;
 --30- Indica el número de premios a los que estuvo nominado un actor, pero que no ha conseguido (Si una película está nominada a un premio, su actor también lo está)
 SELECT AC.ACTOR_NAME , SUM(A.AWARD_ALMOST_WIN ) AS "CASI_GANA"FROM MOVIES mINNER JOIN AWARDS aON m.MOVIE_ID =a.MOVIE_IDINNER JOIN MOVIES_ACTORS maON m.MOVIE_ID =ma.MOVIE_IDINNER JOIN actors acON AC.ACTOR_ID =MA.ACTOR_IDGROUP BY AC.ACTOR_ID
 --31- Indica cuantos actores y directores hicieron películas para los estudios no activos
 SELECTCOUNT(DISTINCT m.DIRECTOR_ID ) AS "DIRECTOR_NUMBER",COUNT(DISTINCT MA.ACTOR_ID ) AS "ACTOR_NUMBER"FROM STUDIOS sINNER JOIN MOVIES mON S.STUDIO_ID =M.STUDIO_IDINNER JOIN MOVIES_ACTORS maON M.MOVIE_ID =MA.MOVIE_IDWHERE S.STUDIO_ACTIVE FALSE;
 --32-- Indica el nombre, ciudad, y teléfono de todos los miembros de la plataforma que hayan accedido películas que hayan sido nominadas a más de 150 premios y ganaran menos de 50
 SELECT DISTINCT U.USER_NAME , U.USER_TOWN U.USER_PHONEFROM USER_MOVIE_ACCESS umaINNER JOIN AWARDS A ON UMA.MOVIE_ID = A.MOVIE_IDINNER JOIN USERS u ON UMA.USER_ID =U.USER_IDWHERE A.AWARD_NOMINATION >150 AND A.AWARD_WIN <50;------------SELECT DISTINCT u.USER_NAME, u.USER_TOWN, u.USER_PHONE FROM USER_MOVIE_ACCESS uma INNER JOIN AWARDS a ON uma.MOVIE_ID = a.MOVIE_ID INNER JOIN USERS u ON uma.USER_ID = u.USER_ID WHERE a.AWARD_NOMINATION > 150 AND a.AWARD_WIN < 50;SELECT DISTINCT u.USER_NAME, u.USER_TOWN, u.USER_PHONE FROM USERS u INNER JOIN USER_MOVIE_ACCESS uma ON u.USER_ID = uma.USER_ID WHERE uma.MOVIE_ID IN (SELECT a.MOVIE_ID FROM AWARDS a WHERE a.AWARD_NOMINATION > 150 AND a.AWARD_WIN < 50);
 --33- Comprueba si hay errores en la BD entre las películas y directores (un director muerto en el 76 no puede dirigir una película en el 88)
 SELECT d.DIRECTOR_NAME, d.DIRECTOR_DEAD_DATE, MAX(m.MOVIE_RELEASE_DATE) AS MOVIE_RELEASE_DATE FROM MOVIES m INNER JOIN DIRECTORS d ON m.DIRECTOR_ID = d.DIRECTOR_ID WHERE m.MOVIE_RELEASE_DATE > d.DIRECTOR_DEAD_DATE GROUP BY d.DIRECTOR_ID;
 --34- Utilizando la información de la sentencia anterior, modifica la fecha de defunción a un año más tarde del estreno de la película (mediante sentencia SQL)
 UPDATE DIRECTORS d SET DIRECTOR_DEAD_DATE = (SELECT MAX(DATEADD(YEAR, 1, m.MOVIE_RELEASE_DATE)) FROM MOVIES m WHERE m.DIRECTOR_ID = d.DIRECTOR_ID AND m.MOVIE_RELEASE_DATE > d.DIRECTOR_DEAD_DATE) WHERE EXISTS (SELECT 1 FROM MOVIES m WHERE m.DIRECTOR_ID = d.DIRECTOR_ID AND m.MOVIE_RELEASE_DATE > d.DIRECTOR_DEAD_DATE);
 -- nivel bersek 35- Indica cuál es el género favorito de cada uno de los directores cuando dirigen una película
 WITH GENRE_COUNTS AS(SELECT d.DIRECTOR_ID, d.DIRECTOR_NAME, g.GENRE_ID, g.GENRE_NAME, COUNT(MOVIE_ID) AS NUM_MOVIESFROM MOVIES mINNER JOIN DIRECTORS d ON m.DIRECTOR_ID = d.DIRECTOR_IDINNER JOIN GENRES g ON m.GENRE_ID = g.GENRE_IDGROUP BY d.DIRECTOR_ID, g.GENRE_ID),MAX_GENRES AS (SELECT DIRECTOR_ID, MAX(NUM_MOVIES) AS MAX_MOVIES FROM GENRE_COUNTSGROUP BY DIRECTOR_ID)SELECT gc.DIRECTOR_NAME, GROUP_CONCAT(GENRE_NAME SEPARATOR ', ') AS FAVORITE_GENRE FROM GENRE_COUNTS gcINNER JOIN MAX_GENRES mg ON gc.DIRECTOR_ID = mg.DIRECTOR_ID AND gc.NUM_MOVIES = mg.MAX_MOVIESGROUP BY gc.DIRECTOR_NAME;
 --36- Indica cuál es la nacionalidad favorita de cada uno de los estudios en la producción de las películas
 WITH NATIONALITY_COUNTS AS(SELECT s.STUDIO_ID, s.STUDIO_NAME, n.NATIONALITY_ID, n.NATIONALITY_NAME, COUNT(MOVIE_ID) AS NUM_MOVIESFROM MOVIES mINNER JOIN STUDIOS s ON m.STUDIO_ID = s.STUDIO_IDINNER JOIN NATIONALITIES n ON m.NATIONALITY_ID = n.NATIONALITY_IDGROUP BY s.STUDIO_ID, n.NATIONALITY_ID),MAX_NATIONALITIES AS (SELECT STUDIO_ID, MAX(NUM_MOVIES) AS MAX_MOVIES FROM NATIONALITY_COUNTSGROUP BY STUDIO_ID)SELECT nc.STUDIO_NAME, GROUP_CONCAT(NATIONALITY_NAME SEPARATOR ', ') AS FAVORITE_NATIONALITY FROM NATIONALITY_COUNTS ncINNER JOIN MAX_NATIONALITIES mn ON nc.STUDIO_ID = mn.STUDIO_ID AND nc.NUM_MOVIES = mn.MAX_MOVIESGROUP BY nc.STUDIO_NAME;
 --37- Indica cuál fue la primera película a la que accedieron los miembros de la plataforma cuyos teléfonos tengan como último dígito el ID de alguna nacionalidad
 WITH PHONE_DIGIT AS(SELECT USER_NAME,USER_ID,SUBSTR(USER_PHONE, LENGTH(USER_PHONE), 1) AS LAST_NUMBERFROM USERS),USER_NAT AS(SELECT N.NATIONALITY_ID,M.USER_NAME,M.USER_IDFROM NATIONALITIES NINNER JOIN PHONE_DIGIT M ON N.NATIONALITY_ID = M.LAST_NUMBER),MOVIE_ACCESS AS(SELECT UN.NATIONALITY_ID,UN.USER_NAME,UMA.USER_ID,UMA.MOVIE_ID,UMA.ACCESS_DATEFROM USER_NAT UNINNER JOIN USER_MOVIE_ACCESS UMA ON UN.USER_ID = UMA.USER_ID),MIN_ACCESS AS(SELECT USER_ID,MIN(ACCESS_DATE) AS ACCESS_DATEFROM MOVIE_ACCESSGROUP BY USER_ID)SELECT MOA.USER_NAME,M.MOVIE_NAMEFROM MOVIE_ACCESS MOAINNER JOIN MIN_ACCESS MIA ON MOA.ACCESS_DATE = MIA.ACCESS_DATEAND MOA.USER_ID = MIA.USER_IDINNER JOIN MOVIES M ON MOA.MOVIE_ID = M.MOVIE_IDWITH MOVIE_DECADE AS(SELECT S.STUDIO_NAME,(YEAR(M.MOVIE_RELEASE_DATE) / 10) * 10 AS DECADE,COUNT(*) AS TOTAL_MOVIESFROM MOVIES MJOIN STUDIOS S ON M.STUDIO_ID = S.STUDIO_IDGROUP BY S.STUDIO_NAME,DECADE),MAX_DECADE AS(SELECT DECADE,MAX(TOTAL_MOVIES) AS MAX_MOVIESFROM MOVIE_DECADEGROUP BY DECADE)SELECT MD.STUDIO_NAME,MD.DECADE,MD.TOTAL_MOVIESFROM MOVIE_DECADE MDJOIN MAX_DECADE MMD ON MD.DECADE = MMD.DECADEAND MD.TOTAL_MOVIES = MMD.MAX_MOVIESORDER BY MD.DECADE; 