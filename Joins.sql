-- tables 
select * from products;
select * from customers;
select * from locations;
select * from salesreport;

-- self join 
select *
from customers c 
join salesreport s
on c.customer_id = s.customer_id;

-- inner join 
select * 
from customers c
inner join salesreport sr
   on c.customer_id = sr.customer_id
order by c.customer_id, sr.sale_id;

-- left join 
select * 
from customers c
left join salesreport sr
   on c.customer_id = sr.customer_id
order by c.customer_id, sr.sale_id
;

--- right join 
select 
* 
from customers c
right join salesreport s
   on c.customer_id = s.customer_id
order by c.customer_id, s.sale_id
;

-- full outer join 
select 
* 
from customers c
full outer join salesreport s
   on c.customer_id = s.customer_id
order by c.customer_id, s.sale_id
;










