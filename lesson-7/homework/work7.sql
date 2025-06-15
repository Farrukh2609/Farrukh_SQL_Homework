--1.
select MIN(Price)
from Products

--2
select MAX(Salary)
from Employees

--3
select COUNT(*) as TotalRows --bu yerda TotalRows chiqadigan natijani ustinini nomi yuqoridaga savollarga ham qoshsa boladi
from Customers

--4.
select COUNT(distinct Category) as TotalCategory
from Products
-- bu yerda UNIQUE PRODUCT CATEGORIES deb soralyabdi  yani bunda DISTINCT CATEGORY qilib bajarish soralgan agar total amount deb soralganda Distinct qilib bajarilmasdi

--5.
select SUM(SaleAmount) as TotalSales
from Sales
where ProductID = 7
--sales jadvaldagi where yani product id 7 ga teng bolgandagi mahsulotlatni saleamount ni umumiy sotuvni hisoblaydi va natijani ToatalSales ustuniga chiqaradi

--6
select AVG(age) as CalAge
from Employees

--7
select DepartmentName, COUNT(*) as NumberDepartment
from Employees
group by DepartmentName;
--bu yerda Empolyees jadvaldagi hodimlarni departmentni umumiy qilib (GROUP BY) guruhlab (COUNT) hisoblan natijani NumberDepartment ustiniga chiqaradi

--8
select Category, MIN(Price) MIN, MAX(Price) as MAX
from Products
group by Category;
--category ustundagi mahsulotlarni toifalar boyicha guruhlab ularni MIN va MAX (PRICE) narxini chiqaradi natijani MIN va MAX ustunlariga beradi

--9.
select CustomerID, SUM(SaleAmount) as TotalSales
from Sales
Group by CustomerID;
--sales jadvaldagi ID larni umumiy qilib guruhlab ularning umumiy sotuv miqdorini hisoblab TotalSales ustiniga chiqaradi

--10.
select DepartmentName, COUNT(*) AS EmpName 
from Employees
group by DepartmentName
having COUNT(*) > 5;
--bu having bilan ishlaydi chunki 5 tadan kop hodimni sorayabdi uning uchun Countda foydalanish kere count esa Having bilan billa ishlaydi

--11.
select ProductID,
AVG(SaleAmount) as AvaregeSale ,
SUM(SaleAmount) as SumSale
from Sales
group by ProductID;
--har bir productni ID sini guruhlab ularni Avarage va umumiy summasini hisoblab AvaregaSale va SumSale ustinlariga natijani chiqaradi


--12.
select COUNT(*) as NumberHR
from Employees
Where DepartmentName = 'HR';
--employees jadvaldagi departmentname HR bolgan hodimlarni umimiy sonini hisoblaydi bu yerda oddiy ustunlar boyicha savol bolgani uchun Where dan foydalandim

--13.
select DepartmentName, MAX(Salary) Max, MIN(Salary) as Min
from Employees
group by DepartmentName;
-- bu savolda departmentlardagi hodimlarni guruhlab highest va lowest salary larni MAX va MIN boyicha hisobladim

--14
select DepartmentName, AVG(Salary) as AvaregeSalary
from Employees
group by DepartmentName;
--hodimlarni department boyicha guruhlab avarage salary ni hisoblab natijani AvaregeSalary ga ustinga yonaltirdim

--15.
select DepartmentName,
AVG(Salary) as AvaregeSalary,
COUNT(*) as EmpWork
from Employees
group by DepartmentName;
--hodimlarni department boyicha guruhlab avarage salary ni hisoblab natijani AvaregeSalary ga ustinga yonaltirdim va ishlaydigan hodimlarni Count qilib hisoblab EmpWork ustunga yonaltirdim

--16.
select Category, AVG(Price) as AvaragePrice
from Products
group by Category
having AVG(Price) > 400;
--bu yerda men Products jadvaldagi Categroy ustundagi mahsulotlarni ortacha narxi 400 dan katta bolganlarni chiqar deb shart qoydim albatta bu  filtirlash having orqali amalga oshiriladi.

--17.
select YEAR(SaleDate) as SaleYear,
SUM(SaleAmount) as TotalSales
from Sales
group by YEAR(SaleDate)
order by SaleYear
--YEAR(SaleDate) bu sales jadvaldagi SaleDate dan faqat yilni oladi va shu yil boyicha GROUP BY YEAR(SaleDate) guruhlab umumiy har bir yilni umumiy miqdorini hisoblaydi va ORDER BY  bu yillarni yil tartibid chiqaradi

--18.
select CustomerID, COUNT(*) as OrderCount
from Orders
group by CustomerID
having COUNT(*) >= 3;
--orders jadvalidagi Customers yani mijozlarni ID si korsatilgan ustun bor oshandan eng kamida 3 ta yoki unda koproq buyurtma bergan mijozni ID raqamini korsatdim

--19. 
select DepartmentName, AVG(Salary) AS AvaregeSalary
from Employees
group by DepartmentName
having AVG(Salary) > 60000;
--hodimlarni department boyicha guruhlab ortacha slaryni hisoblab  va ortacha salary 60000 dan katta bolganlarni AvaregeSalary ustunga yonaltirdim

--20.
select Category, AVG(price) as AvaregePrice
from Products
group by Category
having AVG(Price) > 150;
--mahsulotlar jadvalidan category larni guruhlab har bir category mahsulaotlarni ortacha avarege narxini price ni hisoblab va avarege Price 150 dan katta bolganlarini AvaregePrice ustiniga yonaltirdim

--21. 
select CustomerID, SUM(SaleAmount) as TotalSales
from Sales
group by CustomerID
having SUM(SaleAmount) > 1500;
--jadvaldagi Mijozlarni ID boyicha guruhlab  umumiy sotuvni hisoblab 1500 dan kattasini chiqarib natijani TotalSales ustinga yonaltirdim

--22. 
select DepartmentName,
SUM(Salary) as  SumSalary,
AVG(Salary) as AvaregeSalary
from Employees
group by DepartmentName
having AVG(Salary) > 65000;
--jadvaldagi har bir departmentni guruhlab har birni umumiy salary ni  va avarege salaryni hisoblab chiqib avarege salary 65000 dan katta bolgandi natiajsini chiqardim va natija 2 departnment chiqdi

--23.
--men bunda aniq bir natijani qilaolmadim chunki assistantdan soramadim  jadvalni lekin  githud dan dababasesni topdim va sales.orders jadval juda katta ekan github [alejotima/TSQL2012]

--24
select 
YEAR(OrderDate) as SaleYear, 
MONTH(OrderDate) as SaleMonth,
SUM(TotalAmount) as TotalSales,
COUNT(distinct ProductID) as Sold
from Orders
group by YEAR(OrderDate), MONTH(OrderDate)
having COUNT(distinct ProductID) >= 2;
--Year va Month bu yerda date ustindagi yil va oylarni alohida qilib ustinlarga yonaltiradi va ularni guruhlaydi GROUP BY bilan
--har bir yilni va oyni umumiy summasini hisoblaydi SUM bilan va TotalSales ustinga yonaltiradi
--count bu yerda Unique product sold soralgan shuning uchun harbir mahsulotni productni ID raqamini COUNT qilib  takrorlamasdan distinct qilib chiqarib beradi va yana filtirlaydi yani 2 tadan kop yoki 2 ta mahsulot sotilgan bolsa chiqaradi bu HAVING orqali filtirlaydi


--25
select YEAR(OrderDate) as QuantityYear,
MIN(Quantity) Min, MAX(quantity) as Max
from Orders
group by YEAR(OrderDate)
--har doimgidek date dan yilni alohida qilib QuantityYear ustinga yonaltirdim va  va osha yillarni guruhlab MAX va MIN qiymatlarini topdim Quantity ustinidagi 
