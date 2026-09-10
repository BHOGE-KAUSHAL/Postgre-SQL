--Date and Time 
select current_date ,Now();

select Extract (year from now());

select Extract (month from now());

select Extract (hour from now());

select Extract (year from admission )from customers;

select Age(now(),admission) from customers;

select Age(current_date ,date(admission)) from customers;

select now(),date_trunc('month',now());

select * from customers;