-- Which channel helped to bring more gross sales in the fiscal year 2021 
-- and the percentage of contribution?  The final output  contains these fields: channel ,gross_sales_mln ,percentage 

select * from fact_sales_monthly;
select * from fact_gross_price;
select * from dim_customer;

select channel, concat(round(sum(p.gross_price* s.sold_quantity)/ 1000000 ,2) ,' M')as gross_sales_mln, 
round(sum(p.gross_price* s.sold_quantity)  * 100/ sum(sum(p.gross_price* s.sold_quantity)) over() , 2) as percentage
from dim_customer c inner join fact_sales_monthly s 
on c.customer_code = s.customer_code
inner join fact_gross_price p 
on s.product_code = p.product_code and s.fiscal_year = p.fiscal_year
where s.fiscal_year = '2021'
group by 1;