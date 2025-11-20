select * from pizza_types;
select * from pizzas;
SELECT * from order_details;
select * from orders;
-- List all unique pizza categories (DISTINCT).
select distinct category as pizza_categories from pizza_types;
-- Display pizza_type_id, name, and ingredients, replacing NULL ingredients with "Missing Data". Show first 5 rows.
select pizza_type_id , name , case when ingredients is null  then 'Missing Data' else ingredients  end from pizza_types;
-- Check for pizzas missing a price (IS NULL).
SELECT case when price is null then 'missing a price' else cast(price as varchar) end as price_status from pizzas limit 5;
-- **Phase 2: Filtering & Exploration**
-- 1. Orders placed on `'2015-01-01'` (`SELECT` + `WHERE`).
select * from orders where date ='2015-01-01';
-- 2. List pizzas with `price` descending.
SELECT * from pizzas order by price desc;  
-- 3. Pizzas sold in sizes `'L'` or `'XL'`.
select * from pizzas where size ='L' or size='XL';
-- 4. Pizzas priced between $15.00 and $17.00.
SELECT * from pizzas where price between 15.00 and 17.00;
select * from pizzas where price >=15.00 and price <=17.00;
-- 5. Pizzas with `"Chicken"` in the name.
select name from pizza_types where category ='Chicken';

-- 6. Orders on `'2015-02-15'` or placed after 8 PM.
select * from orders where date ='2015-02-15' or  time >='20:00:00';
-- **Phase 3: Sales Performance**
-- 1. Total quantity of pizzas sold (`SUM`).
select sum(quantity) from order_details;
-- 2. Average pizza price (`AVG`).
select AVG(price) from pizzas;
-- 3. Total order value per order (`JOIN`, `SUM`, `GROUP BY`).
select sum(p.price*od.quantity) , od.order_id from order_details od  
join  pizzas p on od.pizza_id = p.pizza_id group by od.order_id;
-- 4. Total quantity sold per pizza category (`JOIN`, `GROUP BY`).
select sum ( od.quantity  ), pt.category from order_details od join pizzas p on od.pizza_id=p.pizza_id
left join pizza_types pt on pt.pizza_type_id= p.pizza_type_id group by pt.category;
-- 5. Categories with more than 5,000 pizzas sold (`HAVING`).
select sum ( od.quantity), pt.category from order_details od join pizzas p on od.pizza_id=p.pizza_id
left join pizza_types pt on pt.pizza_type_id= p.pizza_type_id group by pt.category having sum(od.quantity)>=5000;
-- 6. Pizzas never ordered (`LEFT/RIGHT JOIN`).

SELECT p.pizza_id,p.size,p.price from pizzas p left join order_details od on p.pizza_id=od.pizza_id where od.order_details_id IS NULL;
-- 7. Price differences between different sizes of the same pizza (`SELF JOIN`).
select p1.pizza_id , p1.pizza_type_id,p2.size as size_2 , p2.price as price_2 , p1.size as size_1,p1.price as price_1  ,
(p2.price-p1.price) as preice_differences
from pizzas p1 join pizzas p2 on p1.pizza_type_id=p2.pizza_type_id where p1.price !=p2.price and p1.price<p2.price;