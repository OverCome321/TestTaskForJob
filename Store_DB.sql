
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

-- Добавим еще категории
INSERT INTO ProductCategory (CategoryName) VALUES ('Книги');
INSERT INTO ProductCategory (CategoryName) VALUES ('Спорт');

-- Добавим еще продукты
INSERT INTO Products (ProductName) VALUES ('Ноутбук');
INSERT INTO Products (ProductName) VALUES ('Книга');
INSERT INTO Products (ProductName) VALUES ('Бейсбольная бита');

-- Связываем новые продукты с категориями
INSERT INTO ProductCategoryMapping (ProductId, CategoryID) VALUES (1); -- Ноутбук - Электроника
INSERT INTO ProductCategoryMapping (ProductId, CategoryID) VALUES (2, 1); -- Книга - Книги
INSERT INTO ProductCategoryMapping (ProductId, CategoryID) VALUES (3, 2); -- Бейсбольная бита - Спорт


SELECT
    Products.ProductName,
    COALESCE(ProductCategory.CategoryName, 'Без категории') AS CategoryName
FROM
    Products
LEFT JOIN
    ProductCategoryMapping ON Products.ProductID = ProductCategoryMapping.ProductID
LEFT JOIN
    ProductCategory ON ProductCategoryMapping.CategoryID = ProductCategory.CategoryID;
