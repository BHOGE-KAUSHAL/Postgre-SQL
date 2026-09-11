-- tables 
select * from products;
select * from customers;
select * from locations;
select * from salesreport;
select * from customer_profiles;

-- crud sub queries
-- create 
insert into customer_profiles(customer_id,date_of_birth,gender)
select c.customer_id ,null ,null
from customers c
where c.customer_id Not in (
    select customer_id from customer_profiles
);

-- Read 
select * 
from salesreport
where product_id in (
  select product_id
  from products
  where category ='Electronics'	
);

--update 
update salesreport 
set discount = discount + 5 
where location_id In (
   select location_id
   from locations
   where state = 'Madhya Pradesh'
);

--Delete 

delete from salesreport
where product_id in (
       select Product_id
	   from products
	   where unit_price <= 100
);