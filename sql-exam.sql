--1
select ProductID,ProductName
from Products
where UnitPrice > 30
and UnitPrice < 40;

--2
select Categories.CategoryName,
Categories.Description
from Categories
where CategoryName = 'Condiments';

--3
select ProductName
from Products
where Products.CategoryID in (
select CategoryID
from Categories
WHERE Description LIKE '%s%')

--4
select distinct ProductName 
from Products
inner join [Order Details]
on Products.ProductID = [Order Details].ProductID
inner join Orders
on [Order Details].OrderID = Orders.OrderID
inner join Customers
on Orders.CustomerID = Customers.CustomerID
where Customers.CustomerID = 'ALFKI';

--5
select Orders.OrderID,
ShipCountry,ShipCity
from Orders
where ShipCountry = 'Brazil'
or ShipCity = 'London'

--6
select CustomerID 
from Orders
where ShipVia in (
select ShipperID
from Shippers
where CompanyName = 'Federal Shipping')

--7
create procedure ProductName 
@OrderID int 
as 
begin
select ProductName, 
Products.UnitPrice
from Products
inner join [Order Details]
on Products.ProductID = 
[Order Details].ProductID
where [Order Details].OrderID
= @OrderID
end
go
exec ProductName 10250;
drop procedure ProductName;

--8
select 
Orders.CustomerID,
Orders.EmployeeID,
Orders.Freight,
Orders.ShipVia,
Orders.ShipName,
Orders.ShipAddress,
Orders.ShipCity,
Orders.ShipRegion,
Orders.ShipPostalCode,
Orders.ShipCountry
from Orders
where CustomerID like 'B%'
and ShipVia = 1 
and  ShipName like 'B%'
and (EmployeeID = 2 or EmployeeID = 5 );

--9
select * from [Order Details];
select * from Orders;

--10
select top 9
CustomerID,
Region,
Country
from Customers
where Country = 'France' 
or Country = 'Canada' 




