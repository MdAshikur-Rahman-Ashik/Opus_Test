Create Database ProductOpusDB

Use ProductOpusDB
go

Create Table Categories(
CategoryId int Primary Key Identity(1,1),
CategoryName Nvarchar(100) Not null
)
go

Create Table Products(
 Id int Primary Key Identity(1,1),
 Name Nvarchar(100) Not null,
 Price Decimal(18,2)not null,

 CategoryId int Not Null
 Foreign Key(CategoryId) References Categories(CategoryId),
)
go


Insert Into Products(Name,Price,CategoryId) Values
('Laptop',56000,1),
('Mobile',4522,2),
('Computer',70000,1)

go

Insert Into Categories(CategoryName) Values
('Electronics'),
('Mobile'),
('Accessories')
go

----Ouestion-2
Select * from Products
Where Price>50
Order by Name ASC
go

----Ouestion-2
Update Products
Set Price=60000
Where Id=7 
go

----Ouestion-3
Select p.Id,p.Name as ProductName,p.Price,c.CategoryName From Products p
Inner JOIN Categories c 
on p.CategoryId=c.CategoryId;
go


----Ouestion-4
Create PROC sp_UpdateProductPrice
@ProductId int,
@NewPrice decimal(18,2)

As 
Begin

IF EXISTS( Select 5 from Products Where Id=@ProductId)

Begin

Update Products
SET Price=@NewPrice
Where Id=@ProductId;

Print 'Update Successfully';

End
Else

Begin
print 'Product Not Found';
End

End;
go
-----Call

EXEC sp_UpdateProductPrice @ProductId=6, @NewPrice=3005;
go