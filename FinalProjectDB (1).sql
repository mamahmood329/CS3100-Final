-- final project table creation --

Create Schema FinalProjectDB;

Show Schemas;

Use FinalProjectDB;

CREATE TABLE Parents (
	ParentID varchar(6) primary key,
	LastName varchar(30) not null,
	FirstName varchar(30),
	Address varchar(100) not null,
    Phonenumber varchar(15) not null,
    Email varchar(50) not null
);

Describe Parents;

Insert into Parents
(ParentID,LastName,FirstName,Address,Phonenumber,Email)
VALUES
('010000','Reed','Eveline','7121 Brickyard Street Chardon, OH 44024','(440) 981-7711','Reedeveline@gmail.com'),
('020000','Stephens','Linda','547 King Rd. Clementon, NJ 08021','(744) 361-6890','Stephenslinda@gmail.com'),
('030000','Dawkins','Jamal','9710 Mountainview St. Palm Coast, FL 32137','(548) 585-5075','Dawkinsjamal@gmail.com'),
('040000','Fitch','Pablo','7673 NE. Warren St. Hicksville, NY 11801','(611) 276-7424','Fitchpablo@gmail.com');

Select *
FROM Parents;

CREATE TABLE Meals (
	MealID varchar(6) primary key,
	Description varchar(250) not null
);

Describe Meals;

Insert into Meals
(MealID,Description)
VALUES
('12345','Chicken Nuggets, Glazed Sweet Potatoes, Chilled Mixed Fruit, Choice of Milk'),
('22345','Bean Nachos, Corn Whole Kernel, Apple Slices w/ Cinnamon, Choice of Milk'),
('32345','PBJ w/ Cheesestick, Fresh Mango, Fresh Cucumber w/ Dip, Choice of Milk'),
('42345','Chili Beef With Beans, Cornbread, Chilled Pears, Choice of Milk'),
('51234','Deli Sandwich w/ Lettuce & Tomato, Mini Carrots, Fresh Grapes, Choice of Milk');

Select *
FROM Meals;

CREATE TABLE Prices (
	PriceID varchar(6) primary key,
	MealType varchar(50) not null,
    Price DECIMAL(5,2) not null,
    MealCost varchar(10)
);

Describe Prices;

Insert into Prices
(PriceID,MealType,Price,MealCost)
VALUES
('00100','Free',0.00,2.00),
('00200','Reduced',0.40,2.00),
('00300','Regular',3.00,2.00);

Select *
FROM Prices;

CREATE TABLE Students (
	StudentID varchar(6) primary key,
	LastName varchar(30) not null,
	FirstName varchar(30),
    StudentGrade varchar(3),
    ParentID varchar(6),
    PriceID varchar(6),
    FOREIGN KEY (ParentID) REFERENCES Parents(ParentID),
	FOREIGN KEY (PriceID) REFERENCES Prices(PriceID)
);

Describe Students;

Insert into Students
(StudentID,LastName,FirstName,StudentGrade,ParentID,PriceID)
VALUES
('100000','Reed','Mary',6,'010000','00100'),
('200000','Stephens','Joanne',7,'020000','00200'),
('300000','Dawkins','Stephen',8,'030000','00300'),
('400000','Fitch','Louis',6,'040000','00200'),
('500000','Fitch','Jason',7,'040000','00200');

Select *
FROM Students;

CREATE TABLE Transactions (
	TransactionID varchar(7) primary key,
	TransactionDate datetime,
    StudentID varchar(6),
    MealID varchar(5),
    Foreign Key (StudentID) References Students(StudentID),
	Foreign Key (MealID) References Meals(MealID)
);

Describe Transactions;

Insert into Transactions
(TransactionID,TransactionDate,StudentID,MealID)
VALUES
('0000001','2018-02-04','100000','22345'),
('0000002','2018-02-04','200000','22345'),
('0000003','2018-02-08','200000','42345'),
('0000004','2018-02-08','400000','42345'),
('0000005','2018-02-22','200000','32345');

Select *
FROM Transactions;

CREATE TABLE Payments (
	PaymentID varchar(7) primary key,
	PaymentDate datetime,
    PaymentMethod varchar(15) not null,
    PaymentAmount DECIMAL(5,2) not null,
    StudentID varchar(6),
    ParentID varchar(6),
    Foreign Key (StudentID) References Students(StudentID),
	Foreign Key (ParentID) References Parents(ParentID)
);

Describe Payments;

Insert into Payments
(PaymentID,PaymentDate,PaymentMethod,PaymentAmount,StudentID,ParentID)
VALUES
('1000000','2018-01-10','Credit Card','15','400000','040000'),
('2000000','2018-01-15','Cash','20','300000','030000'),
('3000000','2018-02-01','Credit Card','10','200000','020000');

Select *
FROM Payments;
