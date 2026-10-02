create table customer(
customer_id int,
firstname varchar(20),
email varchar(30),
Address varchar(20)
);




select customer_id , firstname , email, Address from customer;







insert into customer (customer_id , firstname, email, Address) 
values ( 1, "alice" ,"alice@gmail.com" , "Surat, Gujarat"),
( 2, "Bob" ,"bob@gmail.com" , "Ahemdabad, Gujarat"),
( 3, "David" ,"david@gmail.com" , "mumbai, Maharashtra"),
( 4, "Emma" ,"emma@gmail.com" , "Vadodara, Gujarat"),
( 5, "john" ,"john@gmail.com" , "Elora, Maharashtra");


--Inserted 5 records into the customer table

   1 | alice     | alice@gmail.com | Surat, Gujarat      |
|  2 | Bob       | bob@gmail.com   | Ahemdabad, Gujarat  |
|  3 | David     | david@gmail.com | mumbai, Maharashtra |
|  4 | Emma      | emma@gmail.com  | Vadodara, Gujarat   |
|  5 | john      | john@gmail.com  | Elora, Maharashtra  |
+-------------+-----------+-----------------+---------------------+
10 rows in set (0.003 sec)

--Retrieve all the records from the customer table
select * from customer;



--Update a customers address
update customer set Address = "Pune, Maharashtra" where customer_id = 3;


--Display all customers whose name is "Alice"



select * from customer where firstname = "alice";

 customer_id | firstname | email           | Address        |
+-------------+-----------+-----------------+----------------+
|           1 | alice     | alice@gmail.com | Surat, Gujarat |
|           1 | alice     | alice@gmail.com | Surat, Gujarat |
+-------------+-----------+-----------------+----------------+
2 rows in set (0.035 sec)


create table orders(
order_id int,
customer_id int not null,
order_date int not null,
total_amount int not null
);




insert into Orders(order_id, customer_id, order_date, Ttotal_amount) 
values (1, 1, 20230101, 100),
(2, 2, 20230102, 200),
(3, 3, 20230103, 300),
(4, 4, 20230104, 400),
(5, 5, 20230105, 500);

+----------+-------------+------------+---------------+
| order_id | customer_id | order_date | Ttotal_amount |
+----------+-------------+------------+---------------+
|        1 |           1 |   20230101 |           100 |
|        2 |           2 |   20230102 |           200 |
|        3 |           3 |   20230103 |           300 |
|        4 |           4 |   20230104 |           400 |
|        5 |           5 |   20230105 |           500 |
+----------+-------------+------------+---------------+




--Retrive all products from the orders table
select * from orders where customer_id = 1;

+----------+-------------+------------+---------------+
| order_id | customer_id | order_date | Ttotal_amount |
+----------+-------------+------------+---------------+
|        1 |           1 |   20230101 |           100 |
+----------+-------------+------------+---------------+

--Update the total amount of an order
update orders set Ttotal_amount = 150 where order_id = 1;

+----------+-------------+------------+---------------+
| order_id | customer_id | order_date | Ttotal_amount |
+----------+-------------+------------+---------------+
|        1 |           1 |   20230101 |           150 |
|        2 |           2 |   20230102 |           200 |
|        3 |           3 |   20230103 |           300 |
|        4 |           4 |   20230104 |           400 |
|        5 |           5 |   20230105 |           500 |
+----------+-------------+------------+---------------+


--Delete an order from the orders table
delete from orders where order_id = 5;


+----------+-------------+------------+---------------+
| order_id | customer_id | order_date | Ttotal_amount |
+----------+-------------+------------+---------------+
|        1 |           1 |   20230101 |           150 |
|        2 |           2 |   20230102 |           200 |
|        3 |           3 |   20230103 |           300 |
|        4 |           4 |   20230104 |           400 |
+----------+-------------+------------+---------------+

--Retrive orders placed in the lsst 30 days
select * from orders where order_date >= date_sub(curdate(), interval 30 day);



--REtrive the highest , lowest, and averege order amount uding aggregate functions
select max(Ttotal_amount) as highest_order, min(Ttotal_amount) as lowest_order, avg(Ttotal_amount) as average_order from orders;

+---------------+--------------+---------------+
| highest_order | lowest_order | average_order |
+---------------+--------------+---------------+
|           400 |          150 |      262.5000 |
+---------------+--------------+---------------+

--Products table
create table Products (
    product_id int primary key,
    product_name varchar(100) not null,
    price decimal(10, 2) not null,
    stock_quantity int not null
);

--insert sample data into Products table
insert into Products (product_id, product_name, price, stock_quantity)

--insurt atleast 5 records into the products table
insert into Products (product_id, product_name, price, stock_quantity)
values (1, 'Laptop', 800.00, 10),
(2, 'Mouse', 25.00, 50),
(3, 'Keyboard', 75.00, 30),
(4, 'Monitor', 200.00, 20),
(5, 'Headphones', 150.00, 25);

------------+--------------+--------+----------------+
| product_id | product_name | price  | stock_quantity |
+------------+--------------+--------+----------------+
|          1 | Laptop       | 800.00 |             10 |
|          2 | Mouse        |  25.00 |             50 |
|          3 | Keyboard     |  75.00 |             30 |
|          4 | Monitor      | 200.00 |             20 |
|          5 | Headphones   | 150.00 |             25 |
+------------+--------------+--------+----------------+

--Retrive all products sorted by price in descending order
select * from Products order by price desc;

+------------+--------------+--------+----------------+
| product_id | product_name | price  | stock_quantity |
+------------+--------------+--------+----------------+
|          1 | Laptop       | 800.00 |             10 |
|          4 | Monitor      | 200.00 |             20 |
|          5 | Headphones   | 150.00 |             25 |
|          3 | Keyboard     |  75.00 |             30 |
|          2 | Mouse        |  25.00 |             50 |
+------------+--------------+--------+----------------+

--Update the price of a specific product
update Products set price = 850.00 where product_id = 1;    

+------------+--------------+--------+----------------+
| product_id | product_name | price  | stock_quantity |
+------------+--------------+--------+----------------+
|          1 | Laptop       | 850.00 |             10 |
|          2 | Mouse        |  25.00 |             50 |
|          3 | Keyboard     |  75.00 |             30 |
|          4 | Monitor      | 200.00 |             20 |
|          5 | Headphones   | 150.00 |             25 |
+------------+--------------+--------+----------------+

--Delete a product if it is out of stock
delete from Products where stock_quantity = 10;


-----------+--------------+--------+----------------+
| product_id | product_name | price  | stock_quantity |
+------------+--------------+--------+----------------+
|          2 | Mouse        |  25.00 |             50 |
|          3 | Keyboard     |  75.00 |             30 |
|          4 | Monitor      | 200.00 |             20 |
|          5 | Headphones   | 150.00 |             25 |
+------------+--------------+--------+----------------+

--Retrive products whose price is between 50 and 200
select * from Products where price between 50 and 200;

+------------+--------------+--------+----------------+
| product_id | product_name | price  | stock_quantity |
+------------+--------------+--------+----------------+
|          3 | Keyboard     |  75.00 |             30 |
|          4 | Monitor      | 200.00 |             20 |
|          5 | Headphones   | 150.00 |             25 |
+------------+--------------+--------+----------------+

--Retrive the most expensive and cheapest product using max and min functions
select max(price) as most_expensive, min(price) as cheapest from Products;

+----------------+----------+
| most_expensive | cheapest |
+----------------+----------+
|         200.00 |    25.00 |
+----------------+----------+

--orderdetails table
create table orderdetails(
    orderdetail_id int primary key,
    order_id int not null,
    product_id int not null,
    quantity int not null,
    subtotal decimal(10, 2) not null
);


--insurt st least 5 records into the orderdetails table
insert into orderdetails (orderdetail_id, order_id, product_id, quantity, subtotal)



insert into orderdetails (orderdetail_id, order_id, product_id, quantity, subtotal)
values (1, 1, 1, 2, 1600.00),
(2, 1, 2, 1, 25.00),
(3, 2, 3, 1, 75.00),
(4, 3, 4, 2, 400.00),
(5, 4, 5, 1, 150.00);

----------------+----------+------------+----------+----------+
| orderdetail_id | order_id | product_id | quantity | subtotal |
+----------------+----------+------------+----------+----------+
|              1 |        1 |          1 |        2 |  1600.00 |
|              2 |        1 |          2 |        1 |    25.00 |
|              3 |        2 |          3 |        1 |    75.00 |
|              4 |        3 |          4 |        2 |   400.00 |
|              5 |        4 |          5 |        1 |   150.00 |
+----------------+----------+------------+----------+----------+


--Calculate the total revenue generated from all orders using the SUM function
select sum(subtotal) as total_revenue from orderdetails;

+---------------+
| total_revenue |
+---------------+
|       2250.00 |
+---------------+

--Retrive the top 3 most ordered products
select product_id, sum(quantity) as total_quantity from orderdetails group by product_id order by total_quantity desc limit 3;

+------------+----------------+
| product_id | total_quantity |
+------------+----------------+
|          1 |              2 |
|          4 |              2 |
|          2 |              1 |
+------------+----------------+
3 rows in set (0.055 sec)

--Count how many times a specific products has been sold using the COUNT function
select product_id, count(*) as total_orders from orderdetails where product_id = 1;

+------------+--------------+
| product_id | total_orders |
+------------+--------------+
|          1 |            1 |
+------------+--------------+




