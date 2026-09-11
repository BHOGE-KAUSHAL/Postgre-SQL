-- in dummy database
create table apsql (id,amount,region) as
values (1,100,'A'),(2,150,'B'),(4,300,'B');

-- window function 
select * ,Row_number() Over() As Row_number from apsql;

select * ,Rank() Over(order by amount desc) from apsql;

select * ,sum(amount) Over(order by id) from apsql;

select * ,lag(amount) Over(order by id) As prev from apsql;

select * ,Avg(amount) Over(partition by region) As avg_region from apsql;