--SQL Assignment - 1

Create table STUDIES(
STUDY_ID int identity(1,1) primary key,
PNAME nvarchar(30),
INSTITUTE NVARCHAR(30),
COURSE NVARCHAR(30),
COURSE_FEE INT
)
INSERT INTO STUDIES (PNAME,INSTITUTE,COURSE,COURSE_FEE) VALUES
('ANAND','SABHARI','PGDCA',4500),('ALTAF','COIT','DCA',7200),('JULIANA','BDPS','MCA',22000),('KAMALA
','PRAGATHI','DCA',5000),('MARY','SABHARI','PGDCA',4500),
('NELSON','PRAGATHI','DAP',6200),('PATRICK','PRAGATHI','DCAP',5200),('QADIR','APPLE','HDCA',14000),(
'RAMESH','SABHARI','PGDCA',4500),('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),('REVATHI','SABHARI','DAP',5000),('VIJAYA','BDPS','DCA',48000)

SELECT * FROM STUDIES

-------------------------------------------

Create table SOFTWARE(
SOFTWARE_ID int identity(1,1) primary key,
PNAME nvarchar(30),
TITLE NVARCHAR(30),
DEVELOPIN NVARCHAR(30),
SCOST DECIMAL(10,2),
DCOST DECIMAL(10,2),
SOLD INT
)

INSERT INTO SOFTWARE (PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD) VALUES
('MARY','README','CPP',300,1200,84),
('ANAND','PARACHUTES','BASIC',399.95,6000,43),
('ANAND','VIDEO TITLING','PASCAL',7500,16000,9),
('JULIANA','INVENTORY','COBOL',3000,3500,0),
('KAMALA','PAYROLL PKG.','DBASE',9000,20000,7),
('MARY','FINANCIAL ACCT.','ORACLE',18000,85000,4),
('MARY','CODE GENERATOR','C',4500,20000,23),
('PATTRICK','README','CPP',300,1200,84),
('QADIR','BOMBS AWAY','ASSEMBLY',750,3000,11),
('RAMESH','HOTEL MGMT.','DBASE',13000,35000,4),
('RAMESH','DEAD LEE','PASCAL',599.95,4500,73),
('REMITHA','PC UTILITIES','C',725,5000,51),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500,6000,7),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100,75000,2),
('VIJAYA','TSR EDITOR','C',900,700,6)

SELECT * FROM SOFTWARE

----------------------------------------------

Create table PROGRAMMER(
PROGRAMMER_ID int identity(1,1) primary key,
PNAME nvarchar(30),
DOB DATE,
DOJ DATE,
GENDER CHAR(1),
PROF1 VARCHAR(20),
PROF2 VARCHAR(20),
SALARY INT
)

INSERT INTO PROGRAMMER (PNAME,DOB,DOJ,GENDER,PROF1,PROF2,SALARY) VALUES
('ANAND','4/12/1966','4/21/1992','M','PASCAL','BASIC',3200),
('ALTAF','7/2/1964','11/13/1990','M','CLIPPER','CPBAL',2800),
('JULIANA','1/31/1960','4/21/1990','F','COBAL','DBASE',3000),
('KAMALA','10/30/1968','1/2/1992','F','C','DBASE',2900),
('MARY','6/24/1970','2/1/1991','F','CPP','ORACLE',4500),
('NELSON','09/11/1985','10/11/1989','M','COBOL','DBASE',2500),
('PATTRICK','11/10/1965','4/21/1990','M','PASCAL','CLIPPER',2800),
('QADIR','08/31/1965','4/21/1991','M','ASSEMBLY','C',3000),
('RAMESH','5/3/1967','2/28/1991','M','PASCAL','DBASE',3200),
('REBECCA','1/1/1967','12/1/1990','F','BASIC','COBOL',2500),
('REMITHA','4/19/1970','4/20/1993','F','C','ASSEMBLY',3600),
('REVATHI','12/2/1969','1/2/1992','F','PASCAL','BASIC',3700),
('VIJAYA','12/14/1965','5/2/1992','F','FOXPRO','C',3500)

SELECT * FROM PROGRAMMER


-- Find out the average selling cost for packages developed in Pascal.

select avg(scost) from SOFTWARE as AVGCost
where DEVELOPIN='PASCAL';

-- Display the names and ages of all programmers.

select PNAME,datediff(yy,DOB,getdate()) as Age from PROGRAMMER;

--Display the names of those who have done the DAP Course.

select PNAME from STUDIES
where COURSE = 'DAP';

--Display the names and date of birth of all programmers born in January.

select pname,DOB from PROGRAMMER
where month(dob)=1;

--Display the details of the software developed by Ramesh.

select * FROM SOFTWARE
WHERE Pname = 'Ramesh';

--Display the details of packages for which development costs have been recovered

select * from SOFTWARE
where (SCOST*SOLD)>DCOST;

--display the details of programmer knowing C

select * from PROGRAMMER
where PROF1='c' or PROF1='c';

--What are the languages studied by male programmers

Select * from PROGRAMMER
where GENDER='M';

--Display the details of programmers who joined before 1990

Select * from PROGRAMMER
where DOJ<'1990';

--who are the authors of packages which have recovered more than double the development cost

Select Pname from SOFTWARE
where (SCOST*SOLD)> 2*DCOST;

Select *from STUDIES;
Select *from PROGRAMMER;
Select *from SOFTWARE;

--SQL Assignments - 2
--1. What is the highest number of copies sold by a package?

Select Max(Sold) from Software;

--2. Display lowest course fee.
Select Min(Course_fee) from STUDIES;

--3. How old is the oldest male programmer?

Select max(Datediff(yy,DOB,GETDATE())) as age from PROGRAMMER;
--4. What is the average age of female programmers?

Select * from PROGRAMMER;
Select PNAME,max(datediff(yy,DOB,GETDATE())) as Avergarge from PROGRAMMER where GENDER ='F'
group by pname;

--5. Calculate the experience in years for each programmer and display with their names in descending order.
Select PNAME,(datediff(yy,DOJ,GETDATE())) from PROGRAMMER order by pname desc

--6. How many programmers have done the PGDCA course?
Select COUNT(pname) AS COUNT_ from studies where COURSE='PGDCA' 

--7. How much revenue has been earned through sales of packages developed in C?

Select sum(scost*sold) from SOFTWARE as Revenue_by_C where DEVELOPIN='C';

--8. How many programmers have studied at Sabhari?

select count(pname) from Studies where Institute='Sabhari';

--9. How many packages have been developed in dBase?

select Count(developin) from Software where developin ='DBASE';

--10. How many programmers have studied in Pragathi?

select count(Pname) from studies where INSTITUTE = 'Pragathi';

--11. How many programmers paid 5000 to 10000 for their course?

select count(pname) from STUDIES where COURSE_FEE between 5000 and 10000;

--12. How many programmers know either COBOL or Pascal?

Select count(pname) from PROGRAMMER 
where PROF1='COBOL' or PROF1='Pascal' or PROF2='COBOL' or PROF2='Pascal'; 

--13. How many female programmers are there?

select count(pname) from PROGRAMMER
where GENDER='F';

--14. What is the average salary?

Select avg(salary) from PROGRAMMER;

--15. How many people draw a salary between 2000 to 4000?

select count(pname) from PROGRAMMER where SALARY between 2000 and 4000;

--16. Display the sales cost of the packages developed by each programmer language wise.

select pname,Developin,scost from SOFTWARE
order by developin;

--17. Display the details of the software developed by the male students of Sabhari.

Select count(ST.pname) as Male_Student from STUDIES as ST
inner join PROGRAMMER as PG on ST.Pname = PG.Pname
where INSTITUTE ='Sabhari' and PG.GENDER='M';

Select S.* from SOFTWARE as S
Inner Join STUDIES as ST on
S.Pname = ST.Pname
Inner Join PROGRAMMER as P on 
ST.Pname = P.Pname
where GENDER='M' and INSTITUTE='Sabhari'


--18. Who is the oldest female programmer who joined in 1992?

Select top 1 PNAME,Max(DATEdiff(year,DOB,getdate())) as Oldest_female from PROGRAMMER
where gender = 'F' and Datepart(year,DOJ) = 1992
group by pname;

--19. Who is the youngest male programmer born in 1965?

Select top 1 PNAME,Min(DATEdiff(year,DOB,getdate())) as Youngest_male from PROGRAMMER
where gender = 'M' and Datepart(year,DOJ) = 1965
group by pname;

--20. Which package has the lowest selling cost?

Select min(Scost) from SOFTWARE;

--21. Which female programmer earning more than 3000 does not know C,C++, Oracle or dBase?

Select * from PROGRAMMER
where SALARY>= 3000 and GENDER ='F' 
and (PROF1 not in ('C','CPP','Oracle','DBASE')) and (PROF2 not in ('C','CPP','Oracle','DBASE'));

--22. Who is the youngest programmer knowing dBase?

Select top 1 Pname,min(datediff(year,DOB,Getdate())) as age from PROGRAMMER
where PROF1 = 'Dbase' or PROF2='Dbase' 
group by Pname
order by age;

--23. Which language is known by only one programmer?

select prof1 from PROGRAMMER
group by PROF1
having prof1 not in (Select prof2 from PROGRAMMER) and count(prof1)=1
Union
select prof2 from PROGRAMMER
group by PROF2
having prof2 not in (Select prof1 from PROGRAMMER) and count(prof2)=1

--24. Who is the most experienced male programmer knowing Pascal?

select top 1 Pname, max(datediff(year,DOJ,getdate())) as experience from PROGRAMMER
where gender = 'M' and Prof1='PASCAL'or Prof2='Pascal'
group by PNAME
order by experience desc;

--25. Who is the least experienced programmer?

select top 1 Pname, min(datediff(year,DOJ,getdate())) as experience from PROGRAMMER
group by PNAME
order by experience desc ;


--26. Display the number of packages in each language for which development cost is less than 1000.

select count(TITLE) as pkg,DEVELOPIN from SOFTWARE
where Dcost<1000
group by DEVELOPIN;

--27. Display the highest, lowest and average salaries for those earning more than 2000.

select max(Salary) as Max_Salary,min(Salary) as Min_Salary,avg(Salary) as AVG_Salary from PROGRAMMER
where salary>2000;

