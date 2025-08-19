CREATE TABLE Employee (
    Emp_id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Dept VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Employee VALUES (1, 'David Smith', 'Marketing', 7500.00);
INSERT INTO Employee VALUES (2, 'Olivia James', 'HR', 6900.00);
INSERT INTO Employee VALUES (3, 'Charles Brown', 'Sales', 7200.00);
INSERT INTO Employee VALUES (4, 'Alice White', 'Production', 6800.00);
INSERT INTO Employee VALUES (5, 'Daniel Craig', 'Production', 7100.00);

SELECT * FROM Employee WHERE Salary > 7000;

UPDATE Employee SET Salary = 8200.00 WHERE Emp_name = 'David Smith';
INSERT INTO Employee VALUES (6, 'Daniel Harris', 'Production', 6700.00);
DELETE FROM Employee WHERE Emp_id = 3;
SELECT * FROM Employee WHERE Emp_name NOT LIKE 'D%' AND Emp_name NOT LIKE 'O%';
SELECT Dept, SUM(Salary) AS Total_Salary FROM Employee GROUP BY Dept;
UPDATE Employee 
SET Salary = Salary * 1.05 
WHERE Dept = 'Production';

DELETE FROM Employee WHERE Salary < 7000;

SELECT Emp_name, Salary 
FROM Employee 
WHERE Salary = (SELECT MIN(Salary) FROM Employee);

UPDATE Employee 
SET Salary = 8200.00 
WHERE Dept = 'Marketing';

SELECT Emp_name FROM Employee WHERE Emp_name LIKE 'A%';

SELECT Emp_name FROM Employee WHERE Emp_name LIKE '%it%';

SELECT DISTINCT UPPER(Dept) AS Department FROM Employee;


SELECT * 
FROM Employee 
WHERE Dept LIKE 'M_r%' AND Dept LIKE '%ket%';

SELECT DISTINCT UPPER(REVERSE(Dept)) AS Reversed_Dept FROM Employee;


