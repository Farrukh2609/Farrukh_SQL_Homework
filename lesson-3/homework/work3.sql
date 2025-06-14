CREATE DATABASE homework3
use [homework3]

--oson darajadagi ishlar 

--1. BULK INSERT  bu katta hajmdagi faylarni SQL serverga yuklash uchun ishlatiladi 
-- BULK INSERT Products
--FROM 'C:\data\products.csv'

--2. CSV(comma-Separated values), TXT(text file), XLXS(Excel file)

--3.
Create table Product(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price Decimal(10, 2)
);

--4.
insert into Product(ProductID, ProductName, Price) VALUES
(1, 'Laptop', 120.00),
(2, 'Smartphone', 150.00),
(3, 'Ipad', 80.00);

select * from Product

--5.
--NULL - biror bir qiymat kiritilmagan bolsa, masalan narx qiymati yoq bolsa NULL chiqaradi 
--NOT NULL -biror ustinga qiymat kiritilishi kerak bosh qolishi kere emas


--6.
alter table Product
add CONSTRAINT UQ_ProductName UNIQUE (ProductName);

--7.

--8
alter table Product
add CategoryID int;
--albatda bu yerda null qiymati ishlaydi chunki categoryid ga qiynat qoshganim yoq

SELECT * from Product

--9.
create table Category(
    CategoryID INT PRIMARY KEY,
    CategoryName varchar(40) UNIQUE
);

select * from Category

--10. INDENTITY 
--bu har doim table ustun yaratayotganimizda qollaniladi buni ALTER TABLE qilib bolmaydi
-- create table Category(
--     CategoryID INT INDENTIY(1,1) PRIMARY KEY,
--     CategoryName varchar(40) UNIQUE
-- );
--misol uchun Category table yaratdik uni CategoryID ni 1 boshlanadi va qolganiga 1 qoshilib boradi

--11.
BULK INSERT Product 
from '/Users/Jafar/Desktop/Products.txt '
--men bu yerda Products degan text file yuklab olib uni SQL Product table yukladim

--12. Men boshida Product deb table ochgan edim lekin Products ekan shuning uchun bu qoshimcha tableni nomini ozgartriaman
exec sp_rename 'product', 'Products';

select * from Products

--12. 
Alter table Products
Add CONSTRAINT  FK_Products_Category
FOREIGN KEY (CategoryID)
REFERENCES Category(CategoryID);

select * from Category

--13.
--Primary key - takrorlanmaydi, NULL qiymatiga ruxsat bermaydi, jadvalda faqat 1 bolishini taminlaydi
--UNIQUE KEY --takrorlanmaydi, 1 ta NULL qiymatiga ruxsat beradi bir nechta UNIQUE bolishi mumkin jadvaldagi soni

--14.
Alter table Products
add CONSTRAINT CHECK_Price CHECK (Price>0);

--15.
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;


--16.
SELECT ProductName, ISNULL(Price, 0) as Price 
from Products;

SELECT * from Category
select * from Products

--17.
--FOREIGN KEY  bu bir jadvaldagi ustunni boshqa jadvaldai ustun bilan boglaydi
--xatoliklar va boshqa malumot kirishtishni oldini oladi, faqat mavjud bolsa qiymatlarni kirita oladi

--18.
Create table Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Age INT CHECK (Age >= 18)
);

select * from Customers
-- Check bu Age ustiniga berildi yamni Age 18 dan katta yoki teng bolsa yoziladi

--19.
create table Numbers (
    NumID INT IDENTITY(100,10) PRIMARY KEY,
    NumData VARCHAR(50)
);
select * from Numbers

--20/
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);
select * from OrderDetails
--Bu kombinatsiya qaytarilmasligi kerak (ya'ni bir xil mahsulot bitta buyurtmada faqat bir marta bo‘ladi

--21.
--COALESCE and ISNULL ikkalasi ham NULL bolgan qiymatlarni boshqa qiymat bilan almashtirish uchun ishlatiladi 
--ishlash usuli boshqacha lekin ikkalasida ham
--ISNULL soddaroq holda ishlaydi
--COALESCE murakkabroq tekshirivlar uchun 

--22
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);
select * from Employees

--23
CREATE TABLE OrderItems (
    ItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    ProductName VARCHAR(100),
    CONSTRAINT FK_OrderItems_OrderDetails FOREIGN KEY (OrderID, ProductID)
    REFERENCES OrderDetails(OrderID, ProductID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
--BU YERDA MEN OrderDetails jadvali bn bogladim, 2 ta ustunni chunki men bu jadvaldagi 2 ta ustunni primary key qilgandim.
