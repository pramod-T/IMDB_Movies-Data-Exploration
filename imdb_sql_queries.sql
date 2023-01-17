/*which is the top 5 profitable movies with its details*/

select movie_title,director_name,duration,language,budget,gross,profit 
from imdb_movies 
order by profit desc
limit 5;


/* Top 250 movies with heighest IMDB score with voters >25000 and rank them */
create table imdb_top_250 as
select *,rank() over(order by imdb_score desc) as  rank250
from imdb_movies 
where num_voted_users>25000 
order by imdb_score desc
limit 250;

/*show the table*/
select movie_title,imdb_score,rank250 from imdb_top_250 ;


/* what are the foreign language (other than english) films which made into top 250*/
select movie_title,genres,language,country,imdb_score,rank250
from imdb_top_250
where language <> 'English';


/* Top 10 directors based on IMDB score*/
select director_name , avg(imdb_score) Score
from imdb_movies
group by director_name 
order by score desc , director_name
limit 10;


/* what are the popular genres */
select genres as popular_genres , avg(imdb_score) as Average_score 
from imdb_movies
group by popular_genres
order by Average_score desc
limit 10;


/*Find actor names who is critic favourite and audience favourite */
select actor_1_name as actor_name ,
 sum(num_critic_for_reviews) as critic_favourite,
 sum(num_user_for_reviews) as audience_favourite 
 from imdb_movies
 group by actor_name
 order by critic_favourite desc, audience_favourite
 limit 10;
 
 /*number of users voted for decade*/
 select 
 floor(title_year/10)*10 as decade,
 sum(num_voted_users) as total_voted
 from imdb_movies
 group by decade
 order by decade
 
 /*countries are very enthusiastic about movies*/
 select 
 country, avg(gross) Avgrevenue from imdb_movies 
 group by country
 order by Avgrevenue desc
 limit 10;
 



