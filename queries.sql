-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT ProductName
, CategoryName 
FROM Products 
JOIN Categories ON Products.CategoryId = Categories.CategoryId

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT [Order].id,
       shipper.CompanyName
  FROM [Order]
       JOIN
       shipper ON [Order].ShipVia = shipper.Id
       WHERE orderdate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName,
       OrderDetail.Quantity
  FROM [Order]
       JOIN
       OrderDetail ON [Order].id = orderdetail.OrderId
       JOIN
       Product ON orderDetail.ProductId = product.Id
 WHERE [Order].id = 10251
 ORDER BY ProductName ASC

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [Order].Id,
       customer.CompanyName,
       employee.LastName
  FROM [Order]
       JOIN
       customer ON [Order].CustomerId = customer.Id
       JOIN
       employee ON [Order].EmployeeId = employee.Id;
