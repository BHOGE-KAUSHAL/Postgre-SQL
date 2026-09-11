-- json and json b
select * from Customers;

alter table customers
add column perferences jsonb ;

update customers
set perferences = '{
   "language":"hindi",
   "email_opt_in":true,
   "hobbies":["gym","coding"]
}'::jsonb
where customer_id = 1;

select perferences->> 'language' 
from customers where customer_id = 1;

select perferences->> 'city' 
from customers where customer_id = 1;

select * 
from customers
where perferences @> '{"language":"English"}';

update customers
set perferences = jsonb_set(perferences,'{language}','"English"')
where customer_id = 1;





select perferences from customers;