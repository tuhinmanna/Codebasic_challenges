-- Generate a report which contains the top 5 customers who received an 
-- average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
-- Indian  market. The final output contains these fields: customer_code ,customer, average_discount_percentage 

select * from fact_pre_invoice_deductions;

select i.customer_code, c.customer, round(avg(pre_invoice_discount_pct) * 100 ,2) as average_discount_percentage 
from fact_pre_invoice_deductions i 
inner join dim_customer c on c.customer_code = i.customer_code
where fiscal_year = '2021' and market = 'India'
group by i.customer_code, c.customer
order by 3 desc;



select i.customer_code, c.customer, round(avg(pre_invoice_discount_pct) * 100 ,2) as average_discount_percentage 
from fact_pre_invoice_deductions i 
inner join dim_customer c on c.customer_code = i.customer_code
and i.fiscal_year = '2021' and c.market = 'India'
group by i.customer_code, c.customer
order by 3 desc
limit 5;
