USE premier_products;
#Primary keys are: 
	#from costumer: customer_number
	#from order_line: order_num and quoted_price
	#from orders: order_num
	#from part: part_num
	#from sales_rep: sales_rep_num
#1.	Print all rows and columns of the dataset
SELECT * from customer, order_line, orders, part, sales_rep ;

#2.	All rows, last name , first name, sales rep number, city from sales rep table 
SELECT last_name, first_name, sales_rep_num, city FROM sales_rep;	

#3.	Select order and customer number from orders
SELECT order_num, customer_num FROM orders;

#4.	Select only two rows from order line
SELECT * FROM order_line limit 2;

#5.	Select all of the entries from customer where sales rep num=20
SELECT * FROM customer where sales_rep_num=20; 

#6.	Select only customer name, balance, credit limit from customer where sales rep num=20
SELECT customer_name, balance, credit_limit FROM customer where sales_rep_num=20; 

#7.	Select part num, num ordered, quoted price and total price where total price is (num_ordered * quoted_price) where only 1 num ordered and the order number is 21617
SELECT part_num, num_ordered, quoted_price, order_num, num_ordered*quoted_price as total_price FROM order_line WHERE num_ordered=1 and order_num= 21617 ;

#8.	Show all the orders from order date between '2010-10-20’ and '2010-10-22'
SELECT * FROM orders where order_date>='2010-10-20' and order_date<='2010-10-22';

#9.	List all of parts where the part description starts with ‘D’ and end with  ‘er’
SELECT * FROM part WHERE part_description LIKE "D%%er" ;

#10.Show total balance from customer
SELECT balance FROM customer;

#11.Show minimum balance from customer
SELECT balance FROM customer Order By balance limit 1;

#12.Count number of customers in customer table
SELECT count(customer_num) FROM customer;

#13.Select order number where the quote price is more than 500 but less than 1000
SELECT order_num FROM order_line WHERE quoted_price>500 and quoted_price<1000;

#14.Create a new table of customer name, last name, and first name from customer and sales rep table by matching up their primary key
CREATE TABLE CustomerNames AS SELECT customer_name, last_name, first_name FROM customer, sales_rep WHERE customer.sales_rep_num=sales_rep.sales_rep_num;