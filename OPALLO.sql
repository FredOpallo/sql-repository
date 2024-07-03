CREATE TABLE employee_info(
EmployeeID int primary key,
FirstName varchar(255),
LastName varchar(255),
Title varchar(255)
);
CREATE TABLE salary_info(
EmployeeID int,
SalaryYear int,
SalaryValue float,
PRIMARY  KEY (EmployeeID,SalaryYear),
FOREIGN KEY (EmployeeID) REFERENCES employee_info(EmployeeID)
);


 INSERT INTO employee_info(EmployeeID,FirstName,LastName,Title)
  VALUES(1,'John','Jusge','Senior Manager'),
        (2,'Aaron','Moore','Manager'),
        (3,'Sally','Hunter','Administrative Assistance'),
        (4,'Molly','Porter','CEO'),
        (5,'Patricia','Culver','Analytics Consultant'),
        (6,'leo','Costa','Data Analyst'),
        (7,'Ryan','Jetson','Human Resources Manager'),
        (8,'Barbara','Henry','Analytics Consultant'),
        (9,'Priscilla','Harrison','Manager'),
        (10,'Alec','Flanders','Data Analayst');
        
INSERT INTO salary_info(EmployeeID,SalaryYear,SalaryValue)
VALUES(1,2019,85700),
      (2,2018,79000),
      (3,2019,44000),
      (4,2018,125600),
      (5,2019,115000),
      (6,2019,71000),
      (7,2019,68200),
      (8,2019,74700),
      (9,2018,67000),
      (10,2019,61500);
SELECT * FROM lesson_project.salary_info;      
SELECT DISTINCT Title FROM employee_info;

UPDATE salary_info
SET SalaryValue = SalaryValue*1.1
WHERE EmployeeID = 1 AND SalaryYear = 2019;
  
DELIMITER//
CREATE PROCEDURE avg_salary_by_year(
      IN year_of_salary int
      )
BEGIN
     SELECT AVG(SalaryValue) FROM salary_info
     WHERE SalaryYear = year_of_salary;
END//
DELIMITER;

CALL avg_salary_by_year(2019);

SELECT Title, COUNT(*) FROM employee_info AS  ei
INNER JOIN salary_info AS si
ON ei.EmployeeID = si.EmployeeID
WHERE SalaryValue>
(SELECT AVG(SalaryValue) FROM salary_info
   WHERE SalaryYear= 2019)
AND SalaryYear = 2019
GROUP BY Title
  