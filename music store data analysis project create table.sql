CREATE DATABASE MUSIC;
USE MUSIC;
CREATE TABLE employee
(
employee_id int  PRIMARY KEY,
last_name varchar(30),
first_name varchar(30),
title text,
reports_to int,
levels text,
birthdate varchar(50),
hire_date varchar(50),
address text,
city VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50),
postal_code text,
phone VARCHAR(20),
fax text(30),
email text(30));

CREATE TABLE customer
(
customer_id int PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
company VARCHAR(50),
address text,
city VARCHAR(50),
state VARCHAR(20),
country VARCHAR(30),
postal_code varchar(50),
phone varchar(20),
fax text,
email VARCHAR(50),
support_rep_id int);

CREATE TABLE invoice
(
invoice_id int PRIMARY KEY,
customer_id int,
invoice_date text,
billing_address text,
billing_city text,
billing_state text,
billing_country text,
billing_postal text,
total FLOAT);

CREATE TABLE invoice_line
(
invoice_line_id int PRIMARY KEY,
invoice_id int,
track_id int,
unit_price float,
quantity int);

CREATE TABLE track
(
track_id int PRIMARY KEY,
name text,
album_id int,
media_type_id int,
genre_id int,
composer text,
milliseconds int,
bytes INT,
unit_price float);

CREATE TABLE playlist
(
playlist_id int PRIMARY KEY,
name text);

CREATE TABLE playlist_track
(
playlist_id int,
track_id int);

CREATE TABLE artist
(
artist_id int PRIMARY KEY,
name  VARCHAR(100)); 

CREATE TABLE album
(
album_id int PRIMARY KEY,
title  text,
artist_id int);

CREATE TABLE media_type
(
media_type_id int PRIMARY KEY,
name text);

CREATE TABLE genre
(
genre_id int PRIMARY KEY,
name text);


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





