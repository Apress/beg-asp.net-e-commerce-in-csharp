USE BalloonShop

GO

CREATE TABLE Audit (
  AuditID INT NOT NULL PRIMARY KEY,
  OrderID INT NOT NULL,
  DateStamp DATETIME NOT NULL,
  Message NVARCHAR(512),
  MessageNumber INT
) 

GO

ALTER TABLE Audit ADD CONSTRAINT FK_Audit_Orders 
FOREIGN KEY(OrderID) REFERENCES Shipping (OrderID)

GO

CREATE PROCEDURE CreateAudit
(@OrderID int,
 @Message nvarchar(512),
 @MessageNumber int)
AS

INSERT INTO Audit (OrderID, Message, MessageNumber)
VALUES (@OrderID, @Message, @MessageNumber)

GO

CREATE PROCEDURE CommerceLibOrderUpdateStatus
(@OrderID int,
 @Status int)
AS

UPDATE Orders
SET Status = @Status
WHERE OrderID = @OrderID

GO

CREATE PROCEDURE CommerceLibOrderSetAuthCode
(@OrderID int,
 @AuthCode nvarchar(50),
 @Reference nvarchar(50))
AS

UPDATE Orders
SET AuthCode = @AuthCode, Reference = @Reference
WHERE OrderID = @OrderID

GO

CREATE PROCEDURE CommerceLibOrderSetDateShipped
(@OrderID int)
AS

UPDATE Orders
SET DateShipped = GetDate()
WHERE OrderID = @OrderID

GO
