use gdb023;
describe dim_customer;
select count(*) from dim_customer;

-- checking primary key duplicacy

select customer_code, count(8) from dim_customer group by 1 having count(*) > 1;

-- returns blank so we are good

select * from dim_customer;
select * from dim_product;
select * from fact_gross_price;
select * from fact_sales_monthly;
select * from fact_manufacturing_cost;
select * from fact_pre_invoice_deductions;