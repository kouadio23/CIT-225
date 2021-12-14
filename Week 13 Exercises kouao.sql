# see the join
-- actor.actor_id = film_actor.actor_id
-- film-actor.film_id = film.film_id
-- film.film_id = inventery.film_id
-- inventory.inventory_id = rental.inventory



# 1.  Create a view that obscures complexity by joining film actor to rental, going through the film and inventory tables. 
-- The view should return only the actor id and rental id columns.
USE sakila;

create or replace view v_aid_rid as
select a.actor_id, r.rental_id
from actor a
     join film_actor fa
       on a.actor_id = fa.actor_id
	 join film f
       on f.film_id = fa.film_id
	 join inventory i
	   on f.film_id = i.film_id
	 join rental r
	   on r.inventory_id = i.inventory_id;
       
	select * from v_aid_rid;
	     

# 2. Create a view that joins the actor table with the previous view and returns first name,
--  last name, and counts the total rentals per actor.
select first_name, last_name, count(rental_id) as 'rental per actor'
from v_aid_rid v
    join actor a
       on a.actor_id = v.actor_id
group by v.actor_id;

# 3. Create a view called “family_movies” that returns only the film id, title, and rating for all films which:
-- Have a rating “G” or “PG”
-- Have a category of Animation, Children, or Family
create or replace view v_family_movies as
select f.film_id, title, rating
from film f
    join film_category  fc
       on f.film_id = fc.film_id
	join category c
       on fc.category_id = c.category_id
where rating in ('G','PG')
     and name in ('Animation', 'Children', 'Family');
     
	select * from v_family_movies;
     
	# 4. Write a SELECT statement (NOT a view) which returns actor first name and last name for only 
    -- the actors who have been in the family movies as described above. Your select statement should utilize your view to get this result.
    use sakila;
    select distinct a.actor_id, first_name, last_name
    from actor a
        join film_actor fa
            on a.actor_id = fa.actor_id
	join v_family_movies vfm
		on vfm.film_id = fa.film_id
	order by actor_id;
	
# 5. Create a view that returns actor first name, last name, and count of total films each actor has starred in.
create or replace view v_actor_film_cnt as
select first_name, last_name, count(a.actor_id)
from actor a
    join film_actor fa
       on a.actor_id = fa.actor_id
group by a.actor_id;

	select * from v_actor_film_cnt;
       

       
      

