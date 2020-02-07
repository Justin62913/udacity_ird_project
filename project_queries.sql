
-- THIS IS FOR INSIGHT 1.
-- 1. This query returns the actor/actress who
-- played in the most movies
/*select a.first_name  || ' ' || a.last_name as Full_Name,
       count(*) as total_times
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
group by a.first_name, a.last_name
order by count(*) desc*/



--THIS IS FOR INSIGHT 2.
-- 2. This creates a query for finding the film title, Category and the amount
-- of times it was rented out.

/*select distinct Title,
       Category,
       count(Title) over (partition by Title) as Rental_Count
from (select f.title as Title,
             c.name as Category
    from film f
    join film_category fc on f.film_id = fc.film_id
    join category c on fc.category_id = c.category_id
    join inventory i on f.film_id = i.film_id
    join rental r on i.inventory_id = r.inventory_id
    group by 1,2,f.film_id,rental_id


)sub
where sub.Category in ('Animation', 'Children', 'Classics', 'Comedy', 'Family',
                      'Music')
order by 2,1*/




-- THIS IS FOR INSIGHT 3.
-- 3. This query finds out how the 2 stores compare in rentals for every month
-- for all the years we have data for.
/*select extract(Month from rental_date) as Rental_Month,
       extract(Year from rental_date) as Rental_Year,
       s2.store_id as Store_id,
       count(*) as Count_Rentals
from rental r
join staff s on r.staff_id = s.staff_id
join store s2 on s.staff_id = s2.manager_staff_id
group by 1,2,3
order by 4 desc*/


-- THIS IS FOR INSIGHT 4.
-- 4. this query returns top 10 paying customer's
/*select *
from ( select date_trunc('Month', payment_date) as Payment_Month,
              c.first_name || ' ' || c.last_name as Full_Name,
              count(*) as Pay_Per_Month,
              sum(p.amount) as payment
    from customer c
    join payment p on c.customer_id = p.customer_id
    where p.payment_date between '2007-01-01' and '2007-12-31'
    group by 1,2
    order by 4 desc
    limit 10

)sub*/

