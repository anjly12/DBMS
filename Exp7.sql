Create Table STUDENT3(
    St_Id Int Primary Key,
    S_name Varchar(50),
    Physics Int,
    Chemistry Int,
    Mathematics Int
);
DESC STUDENT3;
Insert Into STUDENT3 Values (1, 'Max', 20, 18, 45);
Insert Into STUDENT3 Values (2, 'Jane', 12, 10, 20);
Insert Into STUDENT3 Values (3, 'Mike', 25, 25, 50);
Insert Into STUDENT3 Values (4, 'Steve', 15, 16, 24);
Insert Into STUDENT3 Values (5, 'Bob', 5, 8, 15);
Insert Into STUDENT3 Values (6, 'Alice', 18, 20, 48);
Insert Into STUDENT3 Values (7, 'Lucas', 14, 14, 35);
Insert Into STUDENT3 Values (8, 'Dustin', 11, 12, 25);
Insert Into Student3 Values (9, 'Suzie', 23, 21, 49);
Insert Into STUDENT3 Values (10, 'Jaden', 16, 15, 38);
Select * From Student3;
Select Avg(Physics) As Avg_Physics From Student3;
Select Max(Mathematics) As Highest_Marks_Mathematics From STUDENT3;
Select Min(Chemistry) As Lowest_Mark_Chemistry From Student3;
Select Count(*) As Physics_Passed From Student3 Where Physics>= 12;
Select * From Student3 Where Physics >= 12 And Chemistry >= 12 And Mathematics >= 25;
Select 
    S_Name,
    Physics,
    Chemistry,
    Mathematics,
    (Physics + Chemistry + Mathematics) AS total,
    Case 
        WHEN Physics >= 12 AND  Chemistry >= 12 AND  Mathematics >= 25 THEN 'Pass' 
        Else 'Fail' 
    End As Result,
    Rank()Over(Order By(Physics + Chemistry + Mathematics)Desc)As Rank
From Student3
Order By Rank;
Select (Count(Mathematics))/10*100 As Maths_Pass_Percentage From Student3 Where Mathematics>24;
Select (Count(S_Name))/10*100 As All_Pass From Student3 Where Physics>11 And Chemistry > 11 And Mathematics >24;
Select Avg(Totalmarks) As Totalmarks_Avg From Student3;
Select Count(*) As Total_Pass_Students From Student3 Where Physics>= 12 And Chemistry>= 12 And Mathematics >= 25;
