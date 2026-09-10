-- Aggregation function

select sum(age) as total_age
from customers;

select round(avg(age),2) as Average_age
from customers;

select count(age) 
from customers;

select min(age) 
from customers;

select max(age) 
from customers;