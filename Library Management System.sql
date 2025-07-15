create table Publisher(
                       Publisher_id int primary key,
                       Name varchar(10),
                       Address varchar(30));
create table Language(
                      Language_id int primary key,
                      Name varchar(10));
create table Author(
                    Author_Id int primary key,
                    Name varchar(10),
                    Email varchar(10),
                    Phone_Number int,
                    Status varchar(10));
create table Book(
                  Book_Id int primary key, 
                  Title varchar(10),
                  Language_id int,
                  foreign key (Language_id) references Language (Language_id),
                  MRP int,
                  Publisher_id int,
                  foreign key (Publisher_id) references Publisher (Publisher_id),
                  Published_Date date,
                  Volume int,
                  Status varchar(10));
create table Member(
                    Member_Id int primary key,
                    Name varchar(10),
                    Branch_Code varchar(10),
                    Roll_Number int,
                    Phone_Number int,
                    Email_Id varchar(10),
                    Date_of_Join date,
                    Status varchar(10));
create table Book_Issue(
                        Issue_Id int primary key,
                        Date_Of_Issue date,
                        Book_Id int,
                        foreign key (Book_Id) references Book (Book_Id),
                        Member_Id int,
                        foreign key (Member_Id) references Member (Member_Id),
                        Expected_Date_Of_Return date,
                        Status varchar(10));
create table Book_Return(
                         Issue_Id int primary key,
                         foreign key (Issue_Id) references Book_Issue (Issue_Id),
                         Actual_Date_Of_Return date,
                         LateDays int,
                         LateFee int); 
create table Book_Author(
                         Book_Id int,
                         foreign key (Book_Id) references Book (Book_Id),
                         Author_Id int,
                         foreign key (Author_Id) references Author (Author_Id),
                         primary key(Book_Id, Author_Id));
create table LATE_FEE_RULE(
                           FromDays date,
                           ToDays date,
                           Amount int,
                           primary key(FromDays,ToDays)); 
alter table Book Add Publisher varchar(10);      
alter table Member modify Branch_Code int;
rename LATE_FEE_RULE to FINE_TABLE;
