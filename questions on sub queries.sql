select * from products ;
select * from customers;
select * from customer_profiles;
select * from salesreport;
select * from locations ;

--Q1 find customr who made the highest total amount sales
select 
s.* 
from salesreport s
where s.total_amount = (
select max(total_amount)
from salesreport
);

--Q2 Get all sales of products in 'electronics' category.
select 
* 
from salesreport
where product_id in (
select product_id
from products
where category = 'Electronics'
);

--Q3 find customers whose total spend is greater than 50000 
select 
* 
from customers 
where customer_id in (
     select customer_id
	 from salesreport
	 group by customer_id
	 having sum (total_amount) > 5000
); 

--Q4 for each product show product_name and its total quantity sold 
select 
p.product_id,
p.product_name,
(
select coalesce(sum(s.quantity),0)
from salesreport s
where s.product_id = p.product_id	
)as total_quantity_sold
from products p 
;

-- Q5 show top 2 customer by total spent
select 
    c.customer_id,
	c.first_name,
	t.total_spent
from (
select customer_id,
sum(total_amount) as total_spent
from salesreport
group by customer_id
)as t 
join customers c
 on c.customer_id = t.customer_id
order by t.total_spent desc 
limit 2 ;

---Q6 get customers who have at least one sales
select 
c.*
from customers c
where exists (
       select 1
	   from salesreport s
	   where s.customer_id = c.customer_id	
); 	

-- Q7 list customers who nerver made any purchase
select 
c.*
from customers c
where not exists (
       select 1
	   from salesreport s
	   where s.customer_id = c.customer_id	
);

--Q8 get latest sales for each customer (one row per customer)
select 
s.*
from salesreport s
where s.sale_date = (
   select max (s2.sale_date)
   from salesreport s2 
   where s2.customer_id = s.customer_id
) 	
;

-- find sales where total amount is greater than all sales of products headphone
select *
from salesreport 
where s.total_amount > All (
 select total_amount 
 from sales s2 
 join products p 
  on p.product_id = s2.product_id
  where p.product_name = 'headphones'
);

















