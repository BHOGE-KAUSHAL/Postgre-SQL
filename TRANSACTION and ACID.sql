Begin;

insert into customers 
(first_name,last_name,email,phone)
values
('test','user','test@example.com','9999999999');

select * from customers where email = 'test@example.com';

rollback;

------

Begin;

insert into customers 
(first_name,last_name,email,phone)
values
('test','user','test@example.com','9999999999');
select * from customers where email = 'test@example.com';
commit;

delete from customers where email='test@example.com';

select * from customers;