SELECT * FROM flipkat_sales.flipkart_mobile;

-- database creation-------------
create database flipkart_sales;

-- viewing the table--------------------------
select * from flipkart_mobile;
select * from flipkart_mobile_2;

-- auto increment of primary key when a table exist without a primary key and it's column--------------- 
alter table flipkart_mobile
add column product_id int not null auto_increment primary key;

-- details of a table-------------------
describe flipkart_mobile;

-- droping a column from a table--------------
alter table flipkart_mobile
drop column product_id;

-- rearrange the column sequence in a table------
alter table flipkart_mobile
modify column product_id int first;

-- Updating some null values in a table----------
update flipkart_mobile
set ratings = null
where product_id in (430,427,425,422);

-- Rename a Column of a Table----
alter table flipkart_mobile 
change sales sales_crore double;

-- Changing the discount_percent column logic (discount_percent = discount_percent*100)--- 
update flipkart_mobile
set discount_percent = (discount_percent*100);

-- Changing the discount_percent data type as decimal(10,2)--- 
alter table flipkart_mobile
modify column discount_percent decimal(10,2);

-- View a column of discounted_amount [logic = ((sales_price*(100-discount_percent))/100) ]------------
select a.*, round(((sales_price*(100-discount_percent))/100),2) as discounted_amount from flipkart_mobile a;

-- View a column of sales_after_discount_crore [logic = ((sales_crore*(100-discount_percent))/100) ]------------
select a.*, round(((sales_crore*(100-discount_percent))/100),2) as sales_after_discount_crore from flipkart_mobile a;

-- Rename a Column of a Table----
alter table flipkart_mobile 
change sales_price sale_price_before_discount int;

alter table flipkart_mobile 
change sales_crore total_sales_before_discount_crore decimal(15,2);

