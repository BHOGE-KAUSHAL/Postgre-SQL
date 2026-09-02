create table customers(
id SERIAL Primary Key,
name varchar(100) Not Null,
email varchar(100) Unique,
created_at Timestamp default now(),
age smallint Check (age >17 )
);

insert into customers (name,email,age) values
('akarsh','akarsh@gmail.com',23),
('cr7','cr7@gmail.com',40),
('messi','messi@gmail.com',41);

copy customers(name, email, age)
FROM 'D:\SQL\customers_100.csv'
DELIMITER ','
CSV HEADER;

select * from customers where age > 25 limit 5;
select count(*) from customers where age > 25 ;

select * from customers where age < 25 limit 5 offset 2;

select distinct age from customers order by age desc; 

SELECT * FROM CUSTOMERS WHERE AGE BETWEEN 18 AND 25 ;

SELECT * 
FROM CUSTOMERS WHERE AGE IN (18,20) ;

SELECT * FROM CUSTOMERS WHERE NAME LIKE 'A%' ;

SELECT * FROM CUSTOMERS WHERE NAME ILIKE 'a%' ;

SELECT * FROM CUSTOMERS WHERE NAME ILIKE '_a_a%' ;

select age ,count(*)
from customers
group by age ;

select age ,count(*)
from customers
group by age
order by age desc
;

select distinct(date (created_at)) ,count(*) as signed_up 
from customers
group by (date(created_at))
order by signed_up desc ; 

select age ,count(*) as persons 
from customers
group by age ; 



-- queryies
-- get how many customer we have in each age group ?

select age , count(*) as Customers
from customers
group by (age)
;

-- show only those ages where we have atleast 5 customers ?

select age , count(*) as Customers
from customers
group by (age)
having count(*) > 4
;
	
-- comparision and logic
-- comparision -> =, != , < , >
-- logic -> And , or , Not

select * from customers where age > 30;
select * from customers where age = 30;
select * from customers where age != 30;

select * from customers where age >= 18 and age <=22; 

select * from customers where age >= 35 or name ilike '__A%'; 

select * from customers where not name ilike '__A%';
