-- Get the products that have the highest and lowest manufacturing costs. 
-- The final output should contain these fields: product_code ,product ,manufacturing_cost 

select * from fact_manufacturing_cost;

select fc.product_code, product, round(manufacturing_cost,2) as manufacturing_cost
from fact_manufacturing_cost fc 
inner join dim_product p on fc.product_code = p.product_code
order by 3 desc;

-- by this we can get max and min manufacturing cost products

-- However if we want to see only the 2 products one with highest and one with lowest manufacturing cost:

select fc.product_code, product, round(manufacturing_cost,2) as manufacturing_cost
from fact_manufacturing_cost fc 
inner join dim_product p on fc.product_code = p.product_code
where manufacturing_cost in (
(select min(manufacturing_cost) from  fact_manufacturing_cost),
(select max(manufacturing_cost) from  fact_manufacturing_cost));



