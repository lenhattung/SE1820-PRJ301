-- Tạo database
CREATE DATABASE prj301_1820_slot8
GO

-- Sử dụng database vừa tạo
USE prj301_1820_slot8
GO

-- Tạo bảng tblUsers
CREATE TABLE tblUsers (
    userID varchar(50) PRIMARY KEY,
    fullName nvarchar(100) NOT NULL,
    roleID char(2) NOT NULL,
    password varchar(50) NOT NULL
);
GO

-- Thêm 3 người dùng mẫu với tên tiếng Việt
INSERT INTO tblUsers (userID, fullName, roleID, password) VALUES
('admin01', N'Quản Trị Viên', 'AD', 'admin123'),
('user001', N'Nguyễn Văn Anh', 'US', 'user123'),
('user002', N'Trần Thị Bình', 'US', 'user456');
GO