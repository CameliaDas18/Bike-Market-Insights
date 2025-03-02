-- Beginner Question
-- Ans 1:
select brands.brand_name , products.product_name
from brands, products;

-- Ans 2:
select categories.category_name, count(products.product_name) as product_count
from products
join categories on categories.category_id = products.category_id
group by categories.category_name
order by product_count desc;

-- Ans 3:
select customers.customer_id,customers.first_name, customers.last_name, 
count(orders.order_id) as no_of_orders
from customers
join orders on customers.customer_id = orders.customer_id
group by customers.customer_id
order by first_name;

-- Ans 4:
select order_status,count(order_date)as no_of_orders from orders
group by order_status;

-- Ans 5:
select brand_name, count(products.product_id) as total_products from brands
join products on products.brand_id = brands.brand_id
group by brand_name
order by count(products.product_id) desc;

-- Ans 6:
select concat(first_name,' ',last_name),email,phone,store_id from staffs
where manager_id = 1;

-- Ans 7:
select count(customer_id),state from customers
group by state;

-- Ans 8:
select model_year, avg(list_price) from products
group by model_year;

-- Ans 9:
select orders.customer_id, customers.first_name, customers.last_name, 
count(orders.order_date) from orders
join customers on customers.customer_id = orders.customer_id
group by orders.customer_id, customers.first_name, customers.last_name
order by count(orders.order_date) desc;

-- Ans 10:
select avg(discount), min(discount), max(discount) from order_items;
