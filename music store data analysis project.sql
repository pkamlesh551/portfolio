select* from employees;
select * from customer;
select * from invoice;
select * from employees order by levels desc limit 1;
select count(*) as most_invoice , billing_country from invoice group by billing_country order by most_invoice desc;
select total  from invoice order by total desc limit 3;
select sum(total) as invoice_total,billing_city from invoice  group by billing_city order by invoice_total desc ;
select customer.customer_id,customer.first_name,customer.last_name ,sum(invoice.total) as total from customer join invoice on customer.customer_id=invoice.customer_id 
group by customer.customer_id order by total desc limit 1;
select  email,first_name,last_name from customer ;
select  first_name,concat_ws(",",employee_id,last_name)as ename from employees;
select concat_ws(",",employee_id,last_name,first_name,title,levels,country)as output from employees;
select first_name,hire_date from employees;
select first_name as "name", hire_date as "start_date" from employees;
select customer.customer_id,customer.last_name  ,avg(invoice.total) as average  from customer join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id order by average asc limit 5;
select distinct city from employees;
select distinct city from customer;
select * from invoice order by total desc  limit 5;
select count(*) as most_billing ,billing_state  from invoice group by billing_state order by most_billing desc limit 3;
select sum(total) as most_invoice,billing_state  from invoice  group by billing_state order by most_invoice desc ;
select* from artist;
select* from album;
select  title,name from album join artist on artist.artist_id=album.artist_id;
select customer.customer_id,customer.first_name,customer.last_name,sum(invoice.total) as total from customer join invoice on customer.customer_id=invoice.customer_id 
group by customer_id order by total desc limit 5;
select distinct email,first_name,last_name from customer;
select* from track;
select * from genre;
select track_id from track join genre on track.genre_id=genre.genre_id where genre.name like 'rock';
select track_id from track join genre on track.genre_id=genre.genre_id where genre.name like 'pop';
select avg(milliseconds)  as avg_track_length from track ;
select name,milliseconds from track where milliseconds >(select avg(milliseconds) as avg_track_length from track) order by milliseconds desc;
select employee_id,last_name from employees where last_name like 'a%';










