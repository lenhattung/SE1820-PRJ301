-- Tạo bảng Sách
CREATE TABLE tblBooks (
    BookID Char(5) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Author NVARCHAR(100) NOT NULL,
    PublishYear INT,
    Price DECIMAL(10,2),
    Quantity INT DEFAULT 0,
);

-- Thêm dữ liệu mẫu
INSERT INTO tblBooks (BookID, Title, Author, PublishYear, Price, Quantity) VALUES
('B0001', 'Dế Mèn Phiêu Lưu Ký', 'Tô Hoài', 1941, 65000, 10),
('B0002', 'Số Đỏ', 'Vũ Trọng Phụng', 1936, 75000, 5),
('B0003', 'Nhật Ký Trong Tù', 'Hồ Chí Minh', 1943, 55000, 8),
('B0004', 'Truyện Kiều', 'Nguyễn Du', 1820, 85000, 15),
('B0005', 'Tắt Đèn', 'Ngô Tất Tố', 1937, 60000, 12),
('B0006', 'Chí Phèo', 'Nam Cao', 1941, 45000, 20),
('B0007', 'Vang Bóng Một Thời', 'Nguyễn Tuân', 1940, 70000, 7),
('B0008', 'Những Ngã Tư Và Những Cột Đèn', 'Trần Đăng Khoa', 1968, 50000, 9),
('B0009', 'Bên Kia Bờ Hy Vọng', 'Nguyễn Ngọc Thuần', 2005, 80000, 6),
('B0010', 'Mắt Biếc', 'Nguyễn Nhật Ánh', 1990, 95000, 25);