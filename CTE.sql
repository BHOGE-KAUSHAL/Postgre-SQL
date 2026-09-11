-- total per customer
-- filter on that 


--CTEs make complex queries easier to read.
with customer_totals as (
select 
     customer_id,
	 sum(total_amount) as total_spent
from salesreport 
group by customer_id	 
)	
select 
     c.customer_id,
	 c.first_name,
	 ct.total_spent
from customers c
join customer_totals ct on c.customer_id = ct.customer_id
where ct.total_spent > 10000

---
select * from customers;