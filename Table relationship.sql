-- Dim_table
CREATE TABLE customers(
    customers_id serial primary key,
	first_name varchar(50) not null,
	last_name  varchar(50) not null,
	email      varchar(100) unique,
	phone varchar(20)
);

CREATE TABLE products(
     products_id  serial primary key,
	 product_name varchar(100) not null,
	 category     varchar(50),
	 unit_price   numeric(10,2) not null
);

CREATE TABLE locations (
     location_id  serial primary key,
	 city         varchar(100) not null,
	 state        varchar(50),
	 country      varchar(50) not null
);

insert into customers(first_name,last_name,email,phone) values
('Rahul','Sharma','rahul@example.com',9999990001),
('Priya','Verma','priya@example.com',9999990002),
('Amit','Singh','amit@example.com',9999990003);

insert into products (product_name,category,unit_price) values
('Laptop','Electronics', 60000.00),
('Headphone','Electronics', 3000.00),
('Notebook','stationery', 80.00);

insert into locations (city,state,country) values
('Bhopal','Madhya Pradesh','India'),
('indore','Madhya Pradesh','India'),
('pune','Maharashtra','India');

-- fact_table 
CREATE TABLE salesreport (
    sale_id serial primary key,
	sale_date Date not null,
	customer_id int not null,
	product_id int not null,
	location_id int not null,
	quantity int not null check (quantity > 0),
	discount numeric(5,2) default 0,
	total_amount numeric(12,2) not null,

	constraint fk_customer 
	     foreign key (customer_id) References customers(customer_id),

	constraint fk_product 
	     foreign key (product_id) References products(product_id),

	constraint fk_location 
	     foreign key (locations_id) References locations(location_id)	 
);	

insert into salesreport (sale_date, customer_id,product_id,location_id,quantity,discount ,total_amount) Values
('2025-12-01',1,1,1,1,   0.00, 60000.00), -- Rahul buy 1 laptop in bhopal   
('2025-12-01',1,2,1,2, 100.00,  5900.00), -- Rahul buy 2 headphone in bhopal 
('2025-12-02',2,3,2,5,   0.00,   400.00), -- Rahul buy 5 notebooks in indore 
('2025-12-03',3,2,3,1, 50.00,   2950.00); -- Rahul buy 1 headphone in pune 

-- Relationship Type 
-- join table 
   
select * 
from customers c
join salesreport s
   on c.customer_id = s.customer_id
order by c.customer_id, s.sale_date    
; 

-- one to many 
select 
    c.customer_id,
	concat_ws(' ',c.first_name,last_name) as Full_name,
	s.sale_date,
	s.total_amount
from customers c
join salesreport s
   on c.customer_id = s.customer_id
order by c.customer_id, s.sale_date    
; 

--
-- many to one 
select 
    c.customer_id,
	concat_ws(' ',c.first_name,last_name) as Full_name,
	s.sale_id,
	s.sale_date,
	s.total_amount
from salesreport s
join customers c
   on c.customer_id = s.customer_id 
   where sale_id = 2      
; 

-- many to many 
-- not such use in industry
select 
	concat_ws(' ',c.first_name,last_name) as Full_name,
    p.product_name,
	sum(s.quantity) as total_qty
from salesreport s
join customers c
   on s.customer_id = c.customer_id
join products p
   on s.product_id = p.product_id  
   group by Full_name ,p.product_name
; 

-- one to one 
CREATE TABLE customer_profiles(
 customer_id int primary key,
 date_of_birth Date ,
 gender Varchar(10),

 constraint fk_customer_profile
     foreign key (customer_id)
	 references customers(customer_id)
	 on delete cascade
);

insert into customer_profiles (customer_id,date_of_birth,gender) values
(1,'1952-01-10','Male'),
(2,'1953-03-21','female');

select * 
from customers c
left join customer_profiles p
    on c.customer_id = p.customer_id;








