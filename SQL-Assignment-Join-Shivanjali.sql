--1.How many programmers don’t know Pascal and C?
SELECT COUNT(*) AS Count
FROM PROGRAMMER
WHERE PROF1 NOT IN ('PASCAL', 'C') AND PROF2 NOT IN ('PASCAL', 'C');

--2. Display the details of those who don’t know Clipper, COBOL or Pascal.
SELECT *
FROM PROGRAMMER
WHERE PROF1 NOT IN ('Clipper', 'COBOL', 'PASCAL') AND PROF2 NOT IN ('Clipper',
'COBOL', 'PASCAL');

--3. Display each language name with average development cost, average selling cost and average price per copy.

SELECT TITLE AS Language,
AVG(DCOST) AS AvgDevelopmentCost,
AVG(SCOST) AS AvgSellingCost,
CASE WHEN SUM(SOLD) <> 0 THEN AVG(SCOST / NULLIF(SOLD, 0)) ELSE 0 END AS
AvgPricePerCopy
FROM SOFTWARE
GROUP BY TITLE;

--4. List the programmer names (from the programmer table) and the number of packages each have developed.
SELECT P.PNAME, COUNT(S.TITLE) AS NumberOfPackages
FROM PROGRAMMER P
LEFT JOIN SOFTWARE S ON P.PNAME = S.PNAME
GROUP BY P.PNAME;

--5. List each profit with the number of programmers having that PROF and the number of the packages in that PROF.
SELECT PROF1 AS PROFIT, COUNT(DISTINCT PNAME) AS NumProgrammers, COUNT(*) AS
NumPackages
FROM PROGRAMMER
GROUP BY PROF1;

--6. How many packages were developed by the most experienced programmer from BDPS?
SELECT COUNT(*) AS NumberOfPackages
FROM SOFTWARE
WHERE PNAME IN (
SELECT TOP 1 P.PNAME
FROM PROGRAMMER P,
studies st
where p.PNAME=st.PNAME
and st.institute = 'BDPS'
ORDER BY p.DOJ desc
);

--7. How many packages were developed by female programmers earning more than the highest paid male programmer?
SELECT COUNT(*) AS NumberOfPackages
FROM SOFTWARE S
WHERE S.PNAME IN (
SELECT P.PNAME
FROM PROGRAMMER P
WHERE P.GENDER = 'F' AND P.SALARY > (
SELECT MAX(SALARY)
FROM PROGRAMMER
WHERE GENDER = 'M'

--8. How much does the person who developed the highest selling package earn and what course did he/she undergo?
SELECT P.SALARY, P.PNAME
FROM PROGRAMMER P
JOIN SOFTWARE S ON P.PNAME = S.PNAME
WHERE S.SCOST = (
SELECT MAX(SCOST)
FROM SOFTWARE
);

--9. In which institute did the person who developed the costliest package study?
FROM STUDIES S
JOIN SOFTWARE SW ON S.PNAME = SW.PNAME
WHERE SW.DEVELOPIN = (
SELECT MAX(DEVELOPIN)
FROM SOFTWARE
);

--10. Display the names of the programmers who have not developed any packages.
SELECT P.PNAME
FROM PROGRAMMER P
LEFT JOIN SOFTWARE S ON P.PNAME = S.PNAME
WHERE S.PNAME IS NULL;

--11. Display the details of the software that has been developed in the language which is neither their first nor second proficiency.
SELECT *
FROM SOFTWARE
WHERE TITLE NOT IN (SELECT PROF1 FROM PROGRAMMER)
AND TITLE NOT IN (SELECT PROF2 FROM PROGRAMMER);
--12. Display the details of the software developed by the male programmers born before 1965 and female programmers born after 1975.
FROM SOFTWARE
WHERE PNAME IN (
SELECT PNAME
FROM PROGRAMMER
WHERE (GENDER = 'M' AND datepart(year,DOB) < '1965')
or (GENDER = 'F' AND datepart(year,DOB) > '1975')
);
--13. Display the number of packages, number of copies sold and the sales value of each programmer institute wise.
SELECT st.INSTITUTE, COUNT(S.TITLE) AS NumberOfPackages, SUM(S.SOLD) AS
CopiesSold, SUM(S.SOLD * S.SCOST) AS SalesValue
FROM studies st
JOIN SOFTWARE S ON st.PNAME = S.PNAME
GROUP BY st.INSTITUTE;

--14. Display the details of the software developed by the male programmers earning more than 3000.
SELECT S.*
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME = P.PNAME
WHERE P.GENDER = 'M' AND P.SALARY > 3000;

--15. Who are the female programmers earning more than the highest paid male programmers?
FROM PROGRAMMER
WHERE GENDER = 'F' AND SALARY > (
SELECT MAX(SALARY)
FROM PROGRAMMER
WHERE GENDER = 'M');

--16. Who are the male programmers earning below the average salary of female programmers?
SELECT *
FROM PROGRAMMER
WHERE GENDER = 'M' AND SALARY < (
SELECT AVG(SALARY)
FROM PROGRAMMER
WHERE GENDER = 'F'
);

--17. Display the language used by each programmer to develop the highest selling and lowest selling package.
SELECT P.PNAME, P.PROF1 AS LanguageUsedForHighestSelling, P.PROF2 AS
LanguageUsedForLowestSelling
FROM PROGRAMMER P
JOIN (
SELECT PNAME, MAX(SOLD) AS MaxSold, MIN(SOLD) AS MinSold
FROM SOFTWARE
GROUP BY PNAME
) S ON P.PNAME = S.PNAME
JOIN SOFTWARE S1 ON P.PNAME = S1.PNAME AND S.MaxSold = S1.SOLD
JOIN SOFTWARE S2 ON P.PNAME = S2.PNAME AND S.MinSold = S2.SOLD;

--18. Display the names of the packages which have sold less than the average number of copies.
SELECT TITLE
FROM SOFTWARE
WHERE SOLD < (
SELECT AVG(SOLD)
FROM SOFTWARE
);

--19. Which is the costliest package developed in Pascal?
SELECT *
FROM SOFTWARE
WHERE TITLE IN (
SELECT top 1 TITLE
FROM SOFTWARE
WHERE DEVELOPIN = 'PASCAL'
ORDER BY DCOST DESC
);

--20. How many copies of the package that has the least difference between development and selling cost were sold?
SELECT SOLD
FROM SOFTWARE
WHERE CAST(DCOST AS DECIMAL) - CAST(SCOST AS DECIMAL) = (
SELECT MIN(CAST(DCOST AS DECIMAL) - CAST(SCOST AS DECIMAL))
FROM SOFTWARE
);

--21. Which language has been used to develop the package which has the highest sales amount?
SELECT TITLE, DEVELOPIN
FROM SOFTWARE
WHERE SOLD * SCOST = (
SELECT MAX(SOLD * SCOST)
FROM SOFTWARE
);

--22. Who developed the package that has sold the least number of copies?

SELECT P.PNAME
FROM PROGRAMMER P
JOIN SOFTWARE S ON P.PNAME = S.PNAME
WHERE S.SOLD = (
SELECT MIN(SOLD)
FROM SOFTWARE
);

--23. Display the names of the courses whose fees are within 1000 (+ or -) of the average fees.
SELECT COURSE
FROM STUDIES
WHERE COURSE_FEE between(SELECT AVG(COURSE_FEE)- 1000 FROM STUDIES) AND (SELECT
AVG(COURSE_FEE) + 1000 FROM STUDIES);

--24. Display the name of the institute and course which has below average course fee.
SELECT INSTITUTE, COURSE
FROM STUDIES
WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE) FROM STUDIES);

--25. Which Institute conducts the costliest course?
SELECT INSTITUTE
FROM STUDIES
WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES);

--26. What is the costliest course?
SELECT COURSE
FROM STUDIES
WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES);