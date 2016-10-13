USE BalloonShop

GO

CREATE PROCEDURE OrdersGetByRecent 
(@Count smallint)
AS
-- Set the number of rows to be returned
SET ROWCOUNT @Count
-- Get list of orders
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
ORDER BY DateCreated DESC
-- Reset rowcount value
SET ROWCOUNT 0

GO

CREATE PROCEDURE OrdersGetByDate 
(@StartDate smalldatetime,
 @EndDate smalldatetime)
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE DateCreated BETWEEN @StartDate AND @EndDate
ORDER BY DateCreated DESC

GO

CREATE PROCEDURE OrdersGetUnverifiedUncanceled
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE Verified=0 AND Canceled=0
ORDER BY DateCreated DESC

GO

CREATE PROCEDURE OrdersGetVerifiedUncompleted
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE Verified=1 AND Completed=0
ORDER BY DateCreated DESC
