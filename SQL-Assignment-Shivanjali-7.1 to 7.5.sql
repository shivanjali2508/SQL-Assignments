---SQL Assignment 7.1


--Tasks To Be Performed:

--1. Create a customer table which comprises of these columns: ‘customer_id’,‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
create table Customers(
customer_id int primary key,
first_name char(10),
Last_name char(10),
email varchar(20),
addr varchar(20),
city char(10),
State char(10),
zipcode int
)

--2. Insert 5 new records into the table
insert into Customers(customer_id,first_name,Last_name,email,addr,city,state,zipcode) values (100,'Shiva','kumar','huy@gmail.com','ytatyfsgwvwtfv5','Hyd','Telengana',459990)
;
insert into Customers(customer_id,first_name,Last_name,email,addr,city,state,zipcode) values (200,'Shiva','Priya','heeuy@gmail.com','hsuyuysvz','VIZ','AP',567898)
;
insert into Customers(customer_id,first_name,Last_name,email,addr,city,state,zipcode) values (300,'Shiva','Anjali','anju@gmail.com','gyqrtyvsys','mumbai','delhi',725288)
;
insert into Customers(customer_id,first_name,Last_name,email,addr,city,state,zipcode) values (400,'Shiva','lucky','lucky@gmail.com','tyuashjyfa','kochi','kerala',89065)
;
insert into Customers(customer_id,first_name,Last_name,email,addr,city,state,zipcode) values (500,'Ganga','Anjali','ganga@gmail.com','shghvsg','SanJose','Turkey',8267289)
;


--3. Select only the ‘first_name’ and ‘last_name’ columns from the customer table
Select first_name,Last_name from Customers;

--4. Select those records where ‘first_name’ starts with “G” and city is ‘SanJose

select * from Customers
where first_name= 'G%' and City='SanJose';

---SQL Assignment 7.2 

--Tasks To Be Performed:

--1. Create an ‘Orders’ table which comprises of these columns: ‘order_id’,‘order_date’, ‘amount’, ‘customer_id’
create table orders(
order_id int,
order_date date,
amount int,
customer_id int
)

insert into orders (order_id,order_date,amount,customer_id) values('01','9-9-2012',45000,100);
insert into orders (order_id,order_date,amount,customer_id) values('02','7-9-2012',5000,200);
insert into orders (order_id,order_date,amount,customer_id) values('3','9-9-2011',45000,100);

--2. Make an inner join on ‘Customer’ and ‘Order’ tables on the ‘customer_id’ column
Select * From Customers as C
join Orders as O on C.customer_id=O.customer_id;


--3. Make left and right joins on ‘Customer’ and ‘Order’ tables on the ‘customer_id’ column
Select * From Customers as C
left join Orders as O on C.customer_id=O.customer_id;

Select * From Customers as C
right join Orders as O on C.customer_id=O.customer_id;

--4. Update the ‘Orders’ table and set the amount to be 100 where 'cutomer_id' is 3
update orders set Amount = 100 where customer_id=3


---SQL Assignment 7.3

Select*from orders;


--Tasks To Be Performed:
--1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders table

Select min(amount) as MIN_Salary from orders;
Select max(amount) as MAX_Salary from orders;
Select avg(amount) as AVG_Salary from orders;

--2. Create a user-defined function which will multiply the given number with 10

create function multi_10(@num int)
Returns int
AS
BEGIN
RETURN(
@num*10
)
end;

select dbo.multi_10(12);

--3. Use the case statement to check if 100 is less than 200, greater than 200 or eqaual to 200 and print the corrspeonding value

select 
case
when 10<20 then '10 is less than 20'
when 10>20 then '10 is grater than 20'
else '10 is equal to 20'
end

---SQL Assignment 7.4

--Tasks To Be Performed:
--1. Arrange the ‘Orders’ dataset in decreasing order of amount

Select * from orders
order by amount desc;

--2. Create a table with the name ‘Employee_details1’ consisting of these columns: ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table withthe name ‘Employee_details2’ consisting of the same columns as the first table
select * from Employee_details1;
select *from Employee_details2;
--3.Apply the UNION operator on these two tables
select * from Employee_details1
UNION
select *from Employee_details2;
--4.Apply the INTERSECT operator on these two tables
select * from Employee_details1
INTERSECT
select *from Employee_details2;
--5.Apply the Except operator on these two tables
select * from Employee_details1
EXCEPT
select *from Employee_details2;