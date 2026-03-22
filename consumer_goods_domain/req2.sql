-- What is the percentage of unique product increase in 2021 vs. 2020? The 
-- final output contains these fields, 
-- unique_products_2020 
-- unique_products_2021 
-- percentage_chg 
select * from dim_product;

with cte as (
select 
(select count(distinct product_code) from fact_gross_price where fiscal_year = '2020') as p20,
(select count(distinct product_code) from fact_gross_price where fiscal_year = '2021') as p21

)
select p20 as unique_products_2020 , p21 as unique_products_2021, 100* (p21-p20) /p20 as percentage_chg
from cte ;

