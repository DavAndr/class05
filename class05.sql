USE sakila;

SELECT * FROM actor where last_name in (select last_name from actor group by last_name having count(last_name) > 1) order by last_name;


SELECT * FROM actor where actor_id not in (select distinct actor_id from film_actor);

select customer_id,count(rental_id) as rental_n from rental GROUP BY customer_id having rental_n = 12 order by rental_n asc;

select * from customer where customer_id in (select customer_id from rental GROUP BY customer_id having count(rental_id) = 1);

select * from customer where customer_id in (select customer_id from rental GROUP BY customer_id having count(rental_id) > 1);

select actor_id from actor where actor_id in (select actor_id from film_actor where film_id in (select film_id from film where title = 'BETRAYED REAR' or title = 'CATCH AMISTAD'));

select actor_id from actor where actor_id in (select actor_id from film_actor where film_id in (select film_id from film where title = 'BETRAYED REAR') and not film_id in (select film_id from film where title = 'CATCH AMISTAD'));

select actor_id from actor where actor_id in (
    select actor_id from film_actor where film_id in (
        select film_id from film where title = 'BETRAYED REAR'
    )
) and actor_id in (
    select actor_id from film_actor where film_id in (
        select film_id from film where title = 'CATCH AMISTAD'
    )
);

select actor_id from actor where actor_id not in (select actor_id from film_actor where film_id in (select film_id from film where title = 'BETRAYED REAR' or title = 'CATCH AMISTAD'));
