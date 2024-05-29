--  Q-1 retrieve the total number of order placed .
SELECT COUNT(order_id) AS total_order FROM orders;

-- Q-2  calculate  the total revenue from pizza sales.
SELECT ROUND(SUM(order_details.quantity * pizzas.price),2) AS total_revenue FROM
order_details JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id;

-- Q-3  identyfy the highest_priced pizza.
select * from pizzas order by price desc limit 1;

-- Q-4 identify the most common  pizza quantity  ordeded.
select quantity, count(order_details_id) from  order_details group by quantity;

-- Q-5 identify the most common pizza size ordered.
select pizzas.size ,count(order_details.order_details_id) as order_count from pizzas join order_details 
on pizzas.pizza_id=order_details.pizza_id group by pizzas.size;

-- Q-6  LIST THE TOP 5 MOST ORDERED PIZZA TYPE ALONG WITH THEIR QUANTITIES
 select pizza_types.name,sum(order_details.quantity) as quantity  from pizza_types join pizzas 
 on pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details on order_details.pizza_id=pizzas.pizza_id 
 group by pizza_types.name order by quantity desc limit 5;
 
 -- Q-7 join the necessary tables to find the total quantity of each pizza ordered.
select pizza_types.category,sum(order_details.quantity) as quantity from pizza_types join pizzas on
pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details on order_details.pizza_id=pizzas.pizza_id group by
pizza_types.category order by quantity;

-- Q-8 determine the distribution of orders by hour of the day 
select hour(order_time) as hour,count(order_id) as order_count from orders group by  hour;

-- Q-9 join relevant tables to find the catagory-wise distribution of pizzas.
select category,count(name) from pizza_types group by category;

-- Q-10 group  the orders by date and calculate the average  number of pizzas ordered per day.

select round(avg(quantity),0) from
(select orders.order_date,sum(order_details.quantity) as quantity from orders join order_details on
 orders.order_id=order_details.order_id group by orders.order_date) as order_quantity;
 
 -- Q-11  determine the top 3 most ordered pizza type based on revenue.
 select pizza_types.name,sum(order_details.quantity*pizzas.price) as revenue  from pizza_types join pizzas on
 pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details on order_details.pizza_id=pizzas.pizza_id group by pizza_types.name order by revenue desc limit 3;
 
 -- Q-12 calculate the percemtage contribution of each pizza type to toatal revenue.

select pizza_types.category,round(sum(order_details.quantity*pizzas.price) /(select sum(order_details.quantity*pizzas.price) as total_revenue 
from order_details join pizzas on order_details.pizza_id=pizzas.pizza_id)*100 ,2)  as revenue  from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details on order_details.pizza_id=pizzas.pizza_id  group by pizza_types.category order by revenue desc