-- Provide a report with all the unique product counts for each  segment  and 
-- sort them in descending order of product counts. The final output contains 
-- 2 fields, segment, product_count 

select * from dim_product;

select segment, count(distinct product_code) as product_count
from dim_product
group by 1 
order by 2 desc;