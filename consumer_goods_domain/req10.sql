-- Get the Top 3 products in each division that have a high 
-- total_sold_quantity in the fiscal_year 2021? The final output contains these 
-- fields: division ,product_code ,product ,total_sold_quantity ,rank_order 

select * from fact_sales_monthly;
select * from dim_product;

with cte as (
select p.division, p.product_code, p.product, sum(s.sold_quantity) as total_sold_quantity,
dense_rank() over(partition by p.division order by sum(s.sold_quantity) desc) as rank_order
from dim_product p inner join fact_sales_monthly s 
on p.product_code = s.product_code
where s.fiscal_year = '2021'
group by 1,2,3)
select division ,product_code ,product ,total_sold_quantity, rank_order
from cte 
where rank_order in (1,2,3)
;