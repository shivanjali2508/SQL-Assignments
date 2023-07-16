select *from STUDIES
select *from PROGRAMMER
select *from SOFTWARE


1. Display the names of the highest paid programmers for each language.
select PNAME as Pname ,MAX(salary) as max_sal 
from programmer 
group by PNAME;
2. Display the details of those who are drawing the same salary.
Select count(*)
from programmer 
where salary=salary;
3. Who are the programmers who joined on the same day?
select panme as pname
from PROGRAMMER
where pname=doj and 
4. Who are the programmers who have the same Prof2?

5. How many packages were developed by the person who developed the
cheapest package? Where did he/she study?