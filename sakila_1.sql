/*
1...名前が「Nick」のactorが登場する映画のタイトル
*/

select fi.title
from film_actor fa
inner join film fi
on fa.film_id = fi.film_id
where actor_id in (
	select actor_id 
	from actor 
	where first_name = 'Nick'
	)
    

/*
2...日本に住んでいるお客さんの名前
*/
select concat(cu.first_name, ' ', cu.last_name) customer_name, co.country
from customer cu

inner join address ad
on cu.address_id = ad.address_id

inner join city ci
on ad.city_id = ci.city_id

inner join country co
on ci.country_id = co.country_id
and co.country = 'Japan'


/*
3...2005年5月26日にレンタルされた映画のカテゴリ別のレンタル回数を降順表示
*/
select ca.name, count(*) rental_count from rental re
inner join inventory inv
on re.inventory_id = inv.inventory_id

inner join film_category fc
on inv.film_id = fc.film_id

inner join category ca
on fc.category_id = ca.category_id

where rental_date >= '2005-05-26'
and rental_date <= '2005-05-27'
group by ca.name
order by rental_count desc