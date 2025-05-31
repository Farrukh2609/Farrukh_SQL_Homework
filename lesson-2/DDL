--CREATE DATABASE Sql2Ddl
USE SQL2DDL

-- 1. Employees jadvalini yaratiladi
CREATE TABLE Employees (
    EmpID INT, -- butun son hodim id raqami
    Name VARCHAR(50), --hodimni ismini yozish 50 ta belgigacha
    Salary DECIMAL(10,2)  --hodim oyligi 
);

-- 2. Employees qismiga yangi yozuv va  qiymat qoshadi 1 qatorli (INSERT)
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Ali Valiyev', 6000.00); --tablening birinchi rows qismiga qiymat qoshadi

-- 3. Bir nechta qatorli INSERT
INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
    (2, 'Dilnoza Karimova', 6500.00),
    (3, 'Javlonbek Abdullayev', 4800.00); --tablening 2 3 rows qismini qiymatlari

-- 4. EmpID = 1 bo'lgan xodimning ish haqini 7000 ga o'zgartirish
UPDATE Employees -- hodimlar table ni yangilaydi
SET Salary = 7000 --oylikni ozgartirish 
WHERE EmpID = 1; --aynan qayerdagi hodimni oyligini ozgartirish bu yerda 1 hodim berilgan 

-- 5. EmpID = 2 bolgan hodimni o‘chirish
DELETE FROM Employees --hodimlarlar table dan ochirish 
WHERE EmpID = 2; --aynan qayerdagi hodimni korsatish bu yerda 2 rows qismi korsatilgan

-- 6. DELETE vs TRUNCATE vs DROP
-- DELETE: Faqat yozuvlarni o‘chiradi, jadvalni tuzilishi shunday qoladi WHERE bilan aynan qayerdagi hodimni ochirish mumkin
-- TRUNCATE: jadvaldagi yani table dagi hamma narsani ochiradi lekin struktura qoladi Employess table 
-- DROP: Jadvalni butunlay o‘chiradi malumotlar ham ustunlar ham 

-- 7. Name ustunini VARCHAR(100) ga o‘zgartirish
ALTER TABLE Employees --ALTER ozgartirish yani hodimlar table ni ozgartirish 
ALTER COLUMN Name VARCHAR(100); --name ustinining maksimaluzinligini 100 tagacha ozgartirish oldin 50 tagacha edi

-- 8. Yangi ustun qo‘shish
ALTER TABLE Employees  --ALTER ozgartirish kiritish hodimnlar table ga 
ADD Department VARCHAR(50); --yangi ustun  qoshadi yani Department nomli

-- 9. Salary ustunini FLOAT ga o‘zgartirish
ALTER TABLE Employees  --ALTER ozgartirish kiritish hodimnlar table ga 
ALTER COLUMN Salary FLOAT;  -- FLOAT suzuvchi nuqta raqamlari, bu raqamlaning kasr qismi bolishi mumkin

-- 10. Departments jadvalini yaratish yangi
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- 11. Employees jadvalidan barcha yozuvlarni tuzilmani saqlagan holda o‘chirish
TRUNCATE TABLE Employees;

--Intermediate level

-- 12. INSERT INTO SELECT yordamida 5 ta yozuv
INSERT INTO Departments (DepartmentID, DepartmentName) --qaysi ustunlarga malumot qoshish kerakligini korsatish
SELECT 1, 'Boshqaruv' UNION -- 1 chi rows qismiga  UNION orqali satrlar birlashadi va jadvalga kiritiladi
SELECT 2, 'Hisob-kitob' UNION
SELECT 3, 'Marketing' UNION
SELECT 4, 'IT bo‘limi' UNION
SELECT 5, 'HR';

-- DROP TABLE Employees;
-- DROP TABLE Departments;

-- SELECT * FROM Employees;
-- SELECT * FROM Departments;

-- 13. Salary > 5000 bo‘lgan xodimlar uchun Department ni 'Boshqaruv' ga yangilash
UPDATE Employees -- hodimlar table ni yangilaydi 
SET Department = 'Boshqaruv' --department ustiniga yangi qiymat qoshadi
WHERE Salary > 5000; --oyliklari 5000 dan katta bolgan oyliklarni yangilaydi

-- 14. Barcha xodimlarni o‘chirish (lekin struktura qoladi)
TRUNCATE TABLE Employees;

-- 15. Employees jadvalidan Department ustunini o‘chirish
ALTER TABLE Employees --hodimlar tableni ozgartiradi ALTER
DROP COLUMN Department; --Department nomli ustun butunlay ochirialdi DROP

-- 16. Employees jadval nomini StaffMembers ga o‘zgartirish
EXEC sp_rename 'Employees', 'StaffMembers';
--sp_rename bu SQL serverga yani nomini ozgartrish uchun kod 
--EXEC bu buyruqni bajarish

-- 17. Departments jadvalini butunlay o‘chirish
DROP TABLE Departments; --Departments table ni ochirib yuborish hammasi table ni ham ochiradi

--ADVENCED level

-- 18. Products jadvalini yaratish
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
);

--19 narx har doim 0 dan katta boshish uchun Check cheklovini qoshish
ALTER TABLE Products
CHECK (Price > 0);

--20 StockQuantity ustinini  qoshish va DEFAULT 50 qiymat qoshish
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;



-- 21. Category ustunini ProductCategory ga o‘zgartirish
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

-- 22. Mahsulotlarni kiritish
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price)
VALUES 
    (1, 'Noutbuk', 'Elektronika', 1500.00),
    (2, 'Smartfon', 'Elektronika', 800.00),
    (3, 'Stol', 'Mebel', 200.00),
    (4, 'Stul', 'Mebel', 100.00),
    (5, 'Printer', 'Ofis texnika', 300.00);

-- 23. SELECT INTO yordamida zaxira jadval yaratish
SELECT * INTO Products_Backup
FROM Products;

-- 24. Jadval nomini Inventar ga o‘zgartirish
EXEC sp_rename 'Products', 'Inventory';

-- 25. Price ustunining ma'lumot turini FLOAT ga o‘zgartirish
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

-- 26. ProductCode ustunini IDENTITY bilan qo‘shish
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);
