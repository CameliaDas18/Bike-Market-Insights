-- Ans 1:
select extract(month from orders.order_date) as month,
sum(order_items.quantity) as quantity from orders
join order_items on order_items.order_id = orders.order_id
group by extract(month from orders.order_date)
order by extract(month from orders.order_date) asc;

-- Ans 2:
select order_items.product_id,products.product_name,
sum(order_items.quantity) as quantity,
min(order_items.list_price) as list_price from order_items
join products on products.product_id = order_items.product_id
group by order_items.product_id, products.product_name
order by count(order_items.product_id) desc limit 10;

-- Ans 3:
select extract(year from orders.order_date) as year,
extract(month from orders.order_date) as month,
sum(order_items.quantity) as quantity,
sum(order_items.quantity*(1-order_items.discount)*order_items.list_price)
from orders
join order_items on order_items.order_id=orders.order_id
group by extract(year from orders.order_date),extract(month from orders.order_date)
order by 1,2;

-- Ans 4:
select brands.brand_name, count(order_items.product_id), avg(order_items.list_price) from brands
join products on products.brand_id = brands.brand_id
join order_items on order_items.product_id = products.product_id
group by  brands.brand_name
order by count(order_items.product_id) desc limit 10;

