Create table users 
as select generate_series(1,100000) id ,
md5(random ()::text) email;

select * from users;

Explain (analyze , buffers)
select * from users where email = 'abc123';

--btree 
create index idx_users_email
on users(email);

-- hash 
create index idx_users_email_hash
on users using hash (email); 


