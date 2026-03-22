-- Follow-up: Which segment had the most increase in unique products in 
-- 2021 vs 2020? The final output contains these fields, 
-- segment, product_count_2020, product_count_2021, difference

select * from dim_product;

with total_products as (
select pd.segment as segment,
count( distinct case when fiscal_year = '2020' then p.product_code end )as p20,
count( distinct case when fiscal_year = '2021' then p.product_code end) as p21
from fact_gross_price p inner join dim_product pd 
on pd.product_code = p.product_code
group by 1)
select segment , p20 as product_count_2020, p21 as product_count_2021, p21-p20 as difference_number,
round(100 * (p21-p20)/p20,2)as `difference%`
from total_products
order by 4 desc;

