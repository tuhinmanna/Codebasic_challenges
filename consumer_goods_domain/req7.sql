--  Get the complete report of the Gross sales amount for the customer  “Atliq 
-- Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
-- high-performing months and take strategic decisions. 
-- The final report contains these columns: Month, Year, Gross sales Amount 

select * from dim_customer;
select * from fact_sales_monthly;
select * from fact_gross_price;

select concat(monthname(s.date),' (', year(s.date),')') as month, s.fiscal_year as year, 
round(sum(s.sold_quantity * p.gross_price) , 2) as gross_sales_amount
from dim_customer c 
inner join fact_sales_monthly s on c.customer_code = s.customer_code inner join 
fact_gross_price p on s.product_code = p.product_code
where c.customer  = 'Atliq Exclusive'
group by 1,2;
