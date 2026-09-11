create table viewusers
as select 
generate_series(1,2000000) id ,
md5(random()::text) email;

alter table viewusers
add column status int ;

update viewusers
set status = 1
where id between 1 and 500000 ;

update viewusers
set status = 2
where id between 500001 and 1000000;

update viewusers
set status = 3
where id between 1000001 and 1500000;

update viewusers
set status = 4
where id between 1500001 and 2000000;

select status ,count(email) from viewusers 
group by status;

-- 
select 
id ,email 
from viewusers
where status = 1;

create view status1 as 
select 
id ,email 
from viewusers
where status = 1;

select * from status1;













