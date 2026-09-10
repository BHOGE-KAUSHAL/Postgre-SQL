-- math and numeric function 
select age ,age+5 from customers;

select age ,age/5 from customers;

select age ,age::real/5 from customers;

select abs (123.45);

select floor(123.45);

select ceil(123.45);

select ceil (-123.45);

select trunc(123.453363574);

select round(123.45263748,2);

select power(3,5);

select sqrt(44);

select round(sqrt(44)::int,1);

select mod(12,5);

