# Write your MySQL query statement below

select product_id , 
ROUND(sum(total_price) / sum(units) , 2) as average_price
from 
(
select p.product_id, u.units ,p.price*u.units as total_price
from prices p
join unitssold u
on p.product_id = u.product_id
where u.purchase_date between p.start_date and p.end_date
) as b
group by product_id

