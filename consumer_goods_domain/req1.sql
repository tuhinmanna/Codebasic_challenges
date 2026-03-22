-- Provide the list of markets in which customer  "Atliq  Exclusive"  operates its 
-- business in the  APAC  region. 

select * from dim_customer;

select distinct market from dim_customer 
where region = 'APAC' and customer = 'Atliq Exclusive';
