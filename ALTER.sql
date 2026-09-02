alter table customers 
add column phone varchar(15);

alter table customers 
add column is_active boolean default TRUE;

alter table customers 
add column country varchar(50) default 'india' Not null ;

alter table customers 
drop column phone ;

alter table customers 
drop column is_active;

alter table customers 
drop column country;

alter table customers 
rename column created_at TO admission;

alter table customers 
alter column age type int;

alter table customers 
add column phone varchar(50);

alter table customers 
Alter column phone set default 'N/A';

insert into customers (name,email,age)
values ('tanishq vyas','tanishq@gamil.com',34);

alter table customers 
Alter column phone Drop default;

alter table customers 
add constraint phone unique (phone);

alter table customers 
drop constraint phone;

alter table customers
drop constraint customers_pkey;

alter table customers
add constraint customers_pkey primary key (id);

alter table customer
rename to customers ;

alter table customers
rename constraint customers_email_key TO unique_customer_email;

Select * from customers;