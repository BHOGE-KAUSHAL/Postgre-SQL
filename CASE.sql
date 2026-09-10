-- case (if,else)

select name,age ,
case
    when age < 20 then 'TEEN'
	when age < 30 then 'YOUNG'
	when age < 50 then 'ADOLESCENT'
	ELSE 'OLD'
END AS AGE_GROUP 
FROM CUSTOMERS ;
	
	