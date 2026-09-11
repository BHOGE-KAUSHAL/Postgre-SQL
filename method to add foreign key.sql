CREATE TABLE cus_profiles(
id int primary key ,
city varchar(50),
fees Real
);

-- another method to add foreign key 
Alter table cus_profiles
Add constraint fk_cus_id
foreign key (id)
references customers(id);	

insert into cus_profiles values
(103,'bhopal',6999),
(106,'indore',5999);

select * from customers;
select * from cus_profiles;

select * 
from customers c
join cus_profiles cp
on c.id = cp.id ;

select 
c.name,
c.email,
cp.city,
cp.fees
from customers c
join cus_profiles cp
on c.id = cp.id ;










