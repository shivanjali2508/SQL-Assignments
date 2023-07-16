--1.Create a view named ‘customer_san_jose’ which comprises of only those customers who are from San Jose
create view vr_customer_san_jose
as
select * from customer where city= 'san jose'
select * from vr_customer_san_jose

--2. Inside a transaction, update the first name of the customer to Francis where the last name is Jordan:
--a. Rollback the transaction
begin transaction
      update customer
	   set first_name='Francis'
	  where last_name='Jordan'
rollback
select * from customer
--b. Set the first name of customer to Alex, where the last name is Jordan
begin transaction
      update customer
	   set first_name='Alex'
	  where last_name='Jordan'
--3. Inside a TRY... CATCH block, divide 100 with 0, print the default error message
begin Try 
      select 100/0 as 'Division';
end try
begin catch
     select error_message() as 'error message'
end catch
