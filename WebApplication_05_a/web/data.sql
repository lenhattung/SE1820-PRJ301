-- Kiem tra va xoa ket noi toi database neu dang co
USE master;
GO

-- Kiem tra va xoa database cu neu ton tai
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Web_05_a')
BEGIN
    ALTER DATABASE Web_05_a SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Web_05_a;
END
GO

-- Tao co so du lieu voi ho tro Unicode cho tieng Viet
CREATE DATABASE Web_05_a
COLLATE SQL_Latin1_General_CP1254_CI_AS;
GO

-- Su dung co so du lieu
USE Web_05_a;
GO

-- Xoa bang neu da ton tai
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'products')
BEGIN
    DROP TABLE products;
END
GO

-- Tao bang product
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category NVARCHAR(50),
    stock_quantity INT DEFAULT 0
);
GO

-- Them du lieu mau
INSERT INTO products (product_id, product_name, price, category, stock_quantity) VALUES
(1, N'Điện thoại iPhone 14', 24990000, N'Điện thoại', 50),
(2, N'Laptop Dell XPS 13', 32900000, N'Laptop', 30),
(3, N'Tai nghe AirPods Pro', 4990000, N'Phụ kiện', 100),
(4, N'Samsung Galaxy S23', 21990000, N'Điện thoại', 45),
(5, N'iPad Air 2022', 15990000, N'Máy tính bảng', 60),
(6, N'Chuột không dây Logitech', 890000, N'Phụ kiện', 150),
(7, N'MacBook Pro M2', 35990000, N'Laptop', 25),
(8, N'Bàn phím cơ Gaming', 1890000, N'Phụ kiện', 80),
(9, N'Màn hình Dell 27"', 7990000, N'Màn hình', 40),
(10, N'Loa Bluetooth JBL', 2490000, N'Âm thanh', 70);
GO