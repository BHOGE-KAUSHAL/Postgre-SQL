-- in sales database ;
-- top customer with rank based  on total purchase amount 

select 
  c.customer_id,
  c.first_name,
  c.last_name,
  sum(s.total_amount) as total_spent,
  rank() over (order by sum (s.total_amount)desc) as spending_rank
from customers c
join salesreport s on c.customer_id = s.customer_id
group by c.customer_id,c.first_name,c.last_name
order by spending_rank ;

-- running total of sales by date

select 
     sale_date,
	 sum(total_amount) as daily_sales,
	 sum(sum(total_amount)) over (order by sale_date) as running_total
from salesreport
group by sale_date
order by sale_date;
	 
