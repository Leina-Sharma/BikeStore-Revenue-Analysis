
select t1.order_id, 
concat(t2.first_name, ' ', t2.last_name) as 'customer_name',
t2.city,
t2.state,
t1.order_date,
t4.product_name,
t5.category_name,
t6.store_name,
concat(t7.first_name, ' ', t7.last_name) as 'staff_name',
sum(t3.quantity) as 'total_units',
sum(t3.quantity * t3.list_price) as 'revenue'
from orders t1
join customers t2
on t1.customer_id=t2.customer_id
join order_items t3
on t3.order_id=t1.order_id
join products t4
on t4.product_id=t3.product_id
join categories t5
on t5.category_id=t4.category_id
join stores t6
on t6.store_id=t1.store_id
join staffs t7
on t7.staff_id=t1.staff_id 
and  t1.store_id =t7.store_id
group by t1.order_id, 
customer_name,
t2.city,
t2.state,
t1.order_date,
t4.product_name,
t5.category_name,
t6.store_name,
staff_name;