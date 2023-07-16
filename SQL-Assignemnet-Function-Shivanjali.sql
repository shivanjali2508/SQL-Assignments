--1. What is the cost of the costliest software development in Basic?
SELECT TITLE FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE WHERE DEVELOPIN LIKE 'BASIC');

--2. Display details of packages whose sales crossed the 2000 mark.
SELECT * FROM SOFTWARE WHERE (SOLD*SCOST)>20000;

--3. Who are the programmers who celebrate their birthdays during the current month?
SELECT PNAME FROM PROGRAMMER WHERE DATENAME(MONTH,DOB)=DATENAME(MONTH,GETDATE());

--4. Display the cost of the package developed by each programmer.
SELECT PNAME,SUM(DCOST) AS TOTAL_COST FROM SOFTWARE GROUP BY PNAME;

--5. Display the sales values of the packages developed by each programmer.
SELECT PNAME, SUM(SCOST*SOLD) FROM SOFTWARE GROUP BY PNAME;

--6. Display the number of packages sold by each programmer.
SELECT DEVELOPIN ,SUM(SCOST) FROM SOFTWARE GROUP BY DEVELOPIN;

--7. Display each programmer’s name, costliest and cheapest packages developed by him or her.
SELECT PNAME,MAX(SCOST) AS COSTLIEST,MIN(SCOST) AS CHEAPEST FROM SOFTWARE GROUP BY PNAME;

--8. Display each institute’s name with the number of courses and average cost per course.
SELECT INSTITUTE,COUNT(COURSE) NO_OF_COURSE,AVG(COURSE_FEE) FROM STUDIES GROUP BY INSTITUTE;

--9. Display each institute’s name with the number of students.
SELECT INSTITUTE,COUNT(PNAME) FROM STUDIES GROUP BY INSTITUTE;

--10. List the programmers (from the software table) and the institutes they studied at.
select st.INSTITUTE, s.pname s from studies ST,SOFTWARE S where St.study_id=S.software_id;

--11. How many packages were developed by students who studied in institutes that charge the lowest course fee?
select count(s.pname)AS PACKAGE_DEVELOPED,S.PNAME from software s,studies st where s.pname=st.pname group by s.pname having min(COURSE_FEE)=(select min(COURSE_FEE) from studies);

--12. What is the average salary for those whose software sales are more than 50,000?
SELECT AVG(p.SALARY) as avg_salary from programmer p, software s where p.pname=s.pname and scost*sold>50000 

--13. Which language listed in PROF1, PROF2 has not been used to develop any package?
select prof1 from programmer where prof1 not in(select developin from software)
union
select prof2 from programmer where prof2 not in(select developin from software)

--14. Display the total sales value of the software institute wise.
select st.INSTITUTE,sum(s.sold*s.scost) from software s,studies st where st.pname=s.pname group by st.INSTITUTE;

--15. Display the details of the software developed in C by female programmers of Pragathi.
select s.* from software s,studies st,programmer p where s.pname=st.pname and p.pname=s.pname and gender='f' and institute='pragathi';

--16. Display the details of the packages developed in Pascal by female programmers.
select s.* from software s, programmer p where p.pname=s.pname and gender ='f' and developin ='pascal';

--17. Which language has most of the programmers stated as being proficient in?
select prof1, count(prof1) as Language_known_by_programmer from programmer group by prof1
intersect
select prof1, count(prof1) as Language_known_by_programmer from programmer group by prof1;


--18. Who is the author of the costliest package?
SELECT pnAME,DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM  SOFTWARE);

--19. Which package has the highest development cost?
select developin , dcost from software where dcost = (select max(dcost) from software);

--20. Who is the highest paid female COBOL programmer?
select Pname,salary from programmer where prof1 ='cobol' or prof1 ='cobol' and salary = (select max(salary) from programmer);

--21. Display the names and packages of the programmers.
select pname, developin, title from software

--22. Display the number of packages in each language except C and C++.
select developin, count(developin) from software where developin not in ('c','c++') group by developin

--23. Display the average difference between SCOST and DCOST for each package.
select avg(dcost-scost),developin from software group by developin

--24. Display the total SCOST and DCOST and the amount to be recovered for each programmer for those whose cost has not yet been recovered.
select sum(scost)as total_scost,sum(dcost) total_dcost,abs(sum(sold*scost-dcost)) amount_to_be_recovered from software where scost*sold<dcost;

--25. Who is the highest paid C programmer?
select pname,salary from programmer where salary = (select max(salary) from programmer  where prof1 like 'c' or prof2 like 'c') ;
--26. Who is the highest paid female COBOL programmer?
select pname,salary from programmer where salary = (select max(salary) from programmer  where gender like 'f') ;