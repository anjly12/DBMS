Create Table Customer (
    Customerid Int Primary Key,
    Customername Varchar(50),
    Contactno Varchar(15),
    Address Varchar(100),
    City Varchar(50),
    Postalcode Varchar(10),
    Country Varchar(50));
Desc Customer;
Insert Into Customer Values(1, 'Alice', '1234567890', '123 Elm St', 'New York', '10001', 'USA');
Insert Into Customer Values(2, 'Bob', '9876543210', '456 Oak St', 'Los Angeles', '90001', 'USA');
Insert Into Customer Values(3, 'Charlie', '5555555555', '789 Pine St', 'London', 'E1 6AN', 'UK');
Insert Into Customer Values(4, 'David', '4444444444', '321 Maple St', 'New York', '10002', 'USA');
Insert Into Customer Values(5, 'Eva', '3333333333', '654 Cedar St', 'Paris', '75000', 'France');
Insert Into Customer Values(6, 'Rose', '8723459013', '273 Walker St', 'Paris', '70834', 'France');
Insert Into Customer Values(7, 'Billy', '4590152661', '911 Tons St', 'Paris', '56424', 'France');
Insert Into Customer Values(8, 'Eva', '3333333333', '654 Cedar St', 'Paris', '75000', 'France');
Select * From Customer;
Create Table Employees (
    Employeeid Int Primary Key,
    Lastname Varchar(50),
    Firstname Varchar(50),
    Birthdate Date,
    Photo Varchar(255));
Desc Employees;
Insert Into Employees Values (1,'Roberts','Julia',To_Date('1970-05-15','YYYY-MM-DD'), Null);
Insert Into Employees Values (2, 'Queen', 'Elizabeth', To_Date('1980-08-30','YYYY-MM-DD'), Null);
Insert Into Employees Values (3, 'Prince', 'Charles', To_Date('1975-11-20','YYYY-MM-DD'), Null);
Insert Into Employees Values (4, 'Duke', 'William', To_Date('1990-01-10','YYYY-MM-DD'), Null);
Insert Into Employees Values (5, 'Duchess', 'Kate', To_Date('1985-03-25','YYYY-MM-DD'), Null);
Select * From Employees;
Create Table Orders (
    Orderid Int Primary Key,
    Customerid Int,
    Employeeid Int,
    Orderdate Date,
    Shipperid Int,
    Foreign Key (Customerid) References Customer(Customerid),
    Foreign Key (Employeeid) References Employees(Employeeid));
Desc Orders;
Insert Into Orders Values (1, 1, 2, To_Date('2025-08-01', 'YYYY-MM-DD'),101);
Insert Into Orders Values (2, 3, 1, To_Date('2025-08-02', 'YYYY-MM-DD'),102);
Insert Into Orders Values (3, 5, 3, To_Date('2025-08-03', 'YYYY-MM-DD'),103);
Insert Into Orders Values (4, 2, 4, To_Date('2025-08-04', 'YYYY-MM-DD'),101);
Insert Into Orders Values (5, 4, 5, To_Date('2025-08-05', 'YYYY-MM-DD'),102);
Insert Into Orders Values (6, 4, 5, To_Date('2025-08-05', 'YYYY-MM-DD'),102);
Insert Into Orders Values (7, 4, 5, To_Date('2025-08-05', 'YYYY-MM-DD'),102);
Select * From Orders;

Select * From Customer
Order By Customername Asc;

Select * From Orders
Order By Orderdate Asc;

Select * From Employees 
Where Extract(Year From Birthdate)>1980
Order By BirthDate desc;

Select * From Orders 
Where Customerid In(Select Customerid From Customer Where Country='USA');

Select 
    c.Customerid,
    c.Customername,
    (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.customerid = c.Customerid
    ) AS total_orders
From Customer C
Order By C.Customerid;

SELECT City, COUNT(*) AS Total_Customers
FROM Customer
Group By City
Order By Total_Customers Desc;

SELECT c.Customerid,c.Customername, COUNT(o.Orderid) AS Total_Orders
From Customer C
JOIN Orders o ON c.CustomerID = o.CustomerID
Group By C.Customerid, C.Customername
Having Count(O.Orderid) > 2
Order By Total_Orders Desc;

SELECT City, COUNT(*) AS Total_Customers
FROM Customer
GROUP BY City
Having Count(*) > 3
Order By Total_Customers Desc;


