-- Ans 1:
select order_items.product_id,products.product_name, sum(order_items.quantity) as quantity, 
min(order_items.list_price) as list_price, avg(order_items.discount) as discount,
sum(order_items.quantity)*min(order_items.list_price)*(1-avg(order_items.discount)) as total from order_items
join products on products.product_id = order_items.product_id 
group by order_items.product_id,products.product_name
order by order_items.product_id asc;

-- Ans 2:
select orders.customer_id, concat(customers.first_name,' ',customers.last_name) as full_name, 
count(orders.order_id) as orders from customers join orders on customers.customer_id = orders.customer_id 
group by orders.customer_id, customers.first_name, customers.last_name
order by orders.customer_id asc;

-- Ans 3:
select stocks.product_id,products.product_name,sum(stocks.quantity) from stocks
join products on products.product_id = stocks.product_id
group by stocks.product_id, products.product_name
order by stocks.product_id;

-- Ans 4:  
select stores.store_id, stores.store_name, 
sum(order_items.list_price* (1 - order_items.discount)*order_items.quantity) from stores
join orders on orders.store_id = stores.store_id
join order_items on order_items.order_id = orders.order_id
group by stores.store_id, stores.store_name
order by stores.store_id asc;

-- Ans 5:
select customers.customer_id, customers.first_name, customers.last_name, 
count(orders.order_id) from orders
join customers on customers.customer_id = orders.customer_id
group by customers.first_name, customers.last_name, customers.customer_id
order by count(orders.order_id) desc limit 10;

-- Ans 6:
select * from products
where model_year = 2019
and list_price >
	(select avg(list_price)
	from products
	where model_year = 2019);

-- Ans 7:
select order_items.product_id, products.product_name, order_items.list_price from order_items
join products on products.product_id=order_items.product_id
group by order_items.product_id, products.product_name, order_items.list_price
order by order_items.list_price desc limit 3;