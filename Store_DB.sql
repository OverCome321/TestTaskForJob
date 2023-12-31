
CREATE DATABASE Store_DB
USE Store_DB

CREATE TABLE ProductCategory
(
	CategoryID INT PRIMARY KEY IDENTITY,
	CategoryName NVARCHAR(200) NOT NULL
)

CREATE TABLE Products
(
	ProductId INT PRIMARY KEY IDENTITY,
	ProductName NVARCHAR(200) NOT NULL
)
CREATE TABLE ProductCategoryMapping
(
	ProductCategoryID INT PRIMARY KEY IDENTITY,
	ProductId INT NOT NULL,
	CategoryID INT NOT NULL,
	FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
	FOREIGN KEY (CategoryID) REFERENCES ProductCategory(CategoryID)
)

-- ������� ��� ���������
INSERT INTO ProductCategory (CategoryName) VALUES ('�����');
INSERT INTO ProductCategory (CategoryName) VALUES ('�����');

-- ������� ��� ��������
INSERT INTO Products (ProductName) VALUES ('�������');
INSERT INTO Products (ProductName) VALUES ('�����');
INSERT INTO Products (ProductName) VALUES ('����������� ����');

-- ��������� ����� �������� � �����������
INSERT INTO ProductCategoryMapping (ProductId, CategoryID) VALUES (1); -- ������� - �����������
INSERT INTO ProductCategoryMapping (ProductId, CategoryID) VALUES (2, 1); -- ����� - �����
INSERT INTO ProductCategoryMapping (ProductId, CategoryID) VALUES (3, 2); -- ����������� ���� - �����


SELECT
    Products.ProductName,
    COALESCE(ProductCategory.CategoryName, '��� ���������') AS CategoryName
FROM
    Products
LEFT JOIN
    ProductCategoryMapping ON Products.ProductID = ProductCategoryMapping.ProductID
LEFT JOIN
    ProductCategory ON ProductCategoryMapping.CategoryID = ProductCategory.CategoryID;
