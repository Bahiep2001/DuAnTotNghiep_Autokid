CREATE DATABASE DATN_AutoKid
go

USE DATN_AutoKid
GO

-- Bảng ChucVu
CREATE TABLE ChucVu (
    IdChucVu INT PRIMARY KEY Identity,
    MaChucVu NVARCHAR(50),
    TenChucVu NVARCHAR(100)
);


-- Bảng NhanVien
CREATE TABLE NhanVien (
	IdNV INT PRIMARY KEY Identity,
    MaNV NVARCHAR(100),
    TenNV NVARCHAR(100),
    GioiTinh NVARCHAR(10),
    NgaySinh DATE,
    NgayLamViec DATE,
    MatKhau NVARCHAR(255),
    SDT NVARCHAR(20),
    Email NVARCHAR(100),
    TrangThaiNV NVARCHAR(20),
    DiaChi TEXT,
    IdChucVu INT,
    FOREIGN KEY (IdChucVu) REFERENCES ChucVu(IdChucVu)
);

-- Bảng ThongTinVanChuyen
CREATE TABLE ThongTinVanChuyen (
    IdTTVC INT PRIMARY KEY IDENTITY,
	MaTTVC NVARCHAR(50),
    Tinh NVARCHAR(50),
    Huyen NVARCHAR(50),
    Xa NVARCHAR(50),
    DiaChi NVARCHAR(255),
    TenNguoiNhan NVARCHAR(100),
    SDT NVARCHAR(20)
);

-- Bảng KhachHang
CREATE TABLE KhachHang (
	IdKH INT PRIMARY KEY Identity,
    MaKH  NVARCHAR(100),
    TenKH NVARCHAR(100),
    Email NVARCHAR(100),
    SDT NVARCHAR(20),
    DiaChi TEXT,
    MatKhau NVARCHAR(255),
	IdTTVC int,
	FOREIGN KEY (IdTTVC) REFERENCES ThongTinVanChuyen(IdTTVC)
);

-- Bảng PhuongThucThanhToan
CREATE TABLE PhuongThucThanhToan (
    IdPTTT INT PRIMARY KEY IDENTITY,
    MaPTTT NVARCHAR(50),
    TenPTTT NVARCHAR(100),
    MaCode NVARCHAR(100),
    ThongTinThanhToan TEXT,
    TrangThai NVARCHAR(50)
);


-- Bảng LoaiSP
CREATE TABLE LoaiSP (
    IdLoaiSP INT PRIMARY KEY Identity,
    MaLSP NVARCHAR(50),
    TenLoai NVARCHAR(100),
    TrangThai NVARCHAR(50),
    MoTa TEXT
);

-- Bảng KichCo
CREATE TABLE KichCo (
    IdKichCo INT PRIMARY KEY Identity,
    MaKC NVARCHAR(50),
    TenKC NVARCHAR(50),
    TrangThaiKC NVARCHAR(50),
    MoTa TEXT
);

-- Bảng MauSac
CREATE TABLE MauSac (
    IdMauSac INT PRIMARY KEY Identity,
    MaMS NVARCHAR(50),
    TenMS NVARCHAR(50),
    TrangThaiMS NVARCHAR(50)
);

-- Bảng ChatLieu
CREATE TABLE ChatLieu (
    IdChatLieu INT PRIMARY KEY Identity,
    MaCL NVARCHAR(50),
    TenCL NVARCHAR(50),
    TrangThaiCL VARCHAR(50)
);

-- Bảng ThuongHieu
CREATE TABLE ThuongHieu (
    IdThuongHieu INT PRIMARY KEY IDENTITY,
    MaTH NVARCHAR(50),
    TenTH NVARCHAR(100),
    TrangThaiTH NVARCHAR(50),
    DiaChi TEXT
);


-- Bảng SanPham
CREATE TABLE SanPham (
    IdSanPham INT PRIMARY KEY Identity,
    MaSP NVARCHAR(50),
    TenSP NVARCHAR(100),
    TrangThaiSP NVARCHAR(50),
    IdLoaiSP INT,
    FOREIGN KEY (IdLoaiSP) REFERENCES LoaiSP(IdLoaiSP)
);

-- Bảng SanPhamChiTiet
CREATE TABLE SanPhamChiTiet (
    IdSanPhamChiTiet INT PRIMARY KEY Identity,
	MaSPCT NVARCHAR(50),
    IdSanPham INT,
    IdChatLieu INT,
    IdMauSac INT,
    IdKichCo INT,
	IdThuongHieu INT,
    MoTa TEXT,
    SoLuong INT,
    DonGia money,
	Anh NVARCHAR(255),
    TrangThaiSPCT NVARCHAR(50),
    FOREIGN KEY (IdSanPham) REFERENCES SanPham(IdSanPham),
    FOREIGN KEY (IdChatLieu) REFERENCES ChatLieu(IdChatLieu),
    FOREIGN KEY (IdMauSac) REFERENCES MauSac(IdMauSac),
    FOREIGN KEY (IdKichCo) REFERENCES KichCo(IdKichCo),
	FOREIGN KEY (IdThuongHieu) REFERENCES ThuongHieu(IdThuongHieu)
);

-- Bảng HoaDon
CREATE TABLE HoaDon (
	IdHD INT PRIMARY KEY Identity,
    MaHD NVARCHAR(100),
    IdKH INT,
    IdNV INT,
    IdPTTT INT,
    NgayTao DATETIME,
    PhiShip MONEY,
    HinhThucThanhToan NVARCHAR(50),
    TongTien MONEY,
    TrangThaiHD NVARCHAR(50),
    FOREIGN KEY (IdKH) REFERENCES KhachHang(IdKH),
    FOREIGN KEY (IdNV) REFERENCES NhanVien(IdNV),
    FOREIGN KEY (IdPTTT) REFERENCES PhuongThucThanhToan(IdPTTT)
);



-- Bảng HoaDonChiTiet
CREATE TABLE HoaDonChiTiet (
    IdHoaDonChiTiet INT PRIMARY KEY IDENTITY,
    IdHD INT,
    IdSanPhamChiTiet INT,
    SoLuong INT,
    DonGia MONEY,
    DonGiaSauGiam MONEY,
    FOREIGN KEY (IdHD) REFERENCES HoaDon(IdHD),
    FOREIGN KEY (IdSanPhamChiTiet) REFERENCES SanPhamChiTiet(IdSanPhamChiTiet)
);

-- Bảng KhuyenMai
CREATE TABLE KhuyenMai (
    IdKhuyenMai INT PRIMARY KEY IDENTITY,
    MaKM NVARCHAR(50),
    TenKM NVARCHAR(100),
    MucGiamGia INT,
    DieuKien NVARCHAR(100),
    NgayBatDau DATETIME,
    NgayKetThuc DATETIME,
    KieuGiamGia NVARCHAR(50),
    SoLuong INT,
    TrangThaiKM NVARCHAR(50),
    IdHD INT,
    FOREIGN KEY (IdHD) REFERENCES HoaDon(IdHD)
);

-- Bảng GioHang
CREATE TABLE GioHang (
    IdGioHang INT PRIMARY KEY IDENTITY,
    IdKH INT,
    TrangThai NVARCHAR(50),
    NgayTao DATETIME,
    FOREIGN KEY (IdKH) REFERENCES KhachHang(IdKH)
);

-- Bảng GioHangChiTiet
CREATE TABLE GioHangChiTiet (
    IdGioHangChiTiet INT PRIMARY KEY IDENTITY,
    IdGioHang INT,
    IdSanPhamChiTiet INT,
    SoLuong INT,
    DonGia MONEY,
    FOREIGN KEY (IdGioHang) REFERENCES GioHang(IdGioHang),
    FOREIGN KEY (IdSanPhamChiTiet) REFERENCES SanPhamChiTiet(IdSanPhamChiTiet)
);



-- Bảng HoaDon_History
CREATE TABLE HoaDon_History (
    IdLichSuHoaDon INT PRIMARY KEY IDENTITY,
    IdHD INT,
    NgayThayDoi DATETIME,
    NgayTao DATETIME,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (IdHD) REFERENCES HoaDon(IdHD)
);

-- Bảng DanhGia
CREATE TABLE DanhGia (
    IdDanhGia INT PRIMARY KEY IDENTITY,
    IdSanPhamChiTiet INT,
    NoiDungDanhGia TEXT,
    NgayTao DATETIME,
    SoSao INT,
    FOREIGN KEY (IdSanPhamChiTiet) REFERENCES SanPhamChiTiet(IdSanPhamChiTiet)
);

INSERT INTO LoaiSP (MaLSP, TenLoai, TrangThai, MoTa) 
VALUES 
('LSP001', N'Xe đạp trẻ em 3 bánh', N'Hoạt động', N'Xe đạp 3 bánh dành cho trẻ từ 1-3 tuổi'),
('LSP002', N'Xe đạp trẻ em có bánh phụ', N'Hoạt động', N'Xe đạp có bánh phụ dành cho trẻ từ 3-5 tuổi'),
('LSP003', N'Xe đạp trẻ em thể thao', N'Hoạt động', N'Xe đạp thể thao dành cho trẻ từ 5-7 tuổi'),
('LSP004', N'Xe đạp thăng bằng', N'Hoạt động', N'Xe đạp thăng bằng dành cho trẻ em từ 2-5 tuổi'),
('LSP005', N'Xe đạp điện trẻ em', N'Hoạt động', N'Xe đạp điện cho trẻ em từ 6-10 tuổi');

INSERT INTO SanPham (MaSP, TenSP, TrangThaiSP, IdLoaiSP) 
VALUES 
('SP001', N'Xe đạp 3 bánh ABC', N'Còn hàng', 1),
('SP002', N'Xe đạp có bánh phụ XYZ', N'Còn hàng', 2),
('SP003', N'Xe đạp thể thao KidsSport', N'Còn hàng', 3),
('SP004', N'Xe đạp thăng bằng JoyBalance', N'Còn hàng', 4),
('SP005', N'Xe đạp điện mini E-Bike', N'Còn hàng', 5);

INSERT INTO ChatLieu (MaCL, TenCL, TrangThaiCL) 
VALUES 
('CL001', N'Thép', N'Hoạt động'),
('CL002', N'Hợp kim nhôm', N'Hoạt động'),
('CL003', N'Nhựa cao cấp', N'Hoạt động'),
('CL004', N'Nhôm', N'Hoạt động'),
('CL005', N'Carbon', N'Hoạt động');

INSERT INTO MauSac (MaMS, TenMS, TrangThaiMS) 
VALUES 
('MS001', N'Đỏ', N'Hoạt động'),
('MS002', N'Xanh lá', N'Hoạt động'),
('MS003', N'Vàng', N'Hoạt động'),
('MS004', N'Đen', N'Hoạt động'),
('MS005', N'Hồng', N'Hoạt động');

INSERT INTO KichCo (MaKC, TenKC, TrangThaiKC, MoTa) 
VALUES 
('KC001', N'Nhỏ', N'Hoạt động', N'Kích thước nhỏ dành cho trẻ từ 1-3 tuổi'),
('KC002', N'Trung bình', N'Hoạt động', N'Kích thước trung bình dành cho trẻ từ 3-5 tuổi'),
('KC003', N'Lớn', N'Hoạt động', N'Kích thước lớn dành cho trẻ từ 5-7 tuổi'),
('KC004', N'Rất lớn', N'Hoạt động', N'Kích thước rất lớn dành cho trẻ trên 7 tuổi'),
('KC005', N'Siêu nhỏ', N'Hoạt động', N'Kích thước dành cho trẻ sơ sinh');

INSERT INTO ThuongHieu (MaTH, TenTH, TrangThaiTH, DiaChi) 
VALUES 
('TH001', N'ABC', N'Hoạt động', N'Địa chỉ ABC - Việt Nam'),
('TH002', N'XYZ', N'Hoạt động', N'Địa chỉ XYZ - Nhật Bản'),
('TH003', N'KidsSport', N'Hoạt động', N'Địa chỉ KidsSport - Hàn Quốc'),
('TH004', N'JoyBalance', N'Hoạt động', N'Địa chỉ JoyBalance - Mỹ'),
('TH005', N'Mini E-Bike', N'Hoạt động', N'Địa chỉ Mini E-Bike - Trung Quốc');

INSERT INTO SanPhamChiTiet (MaSPCT, IdSanPham, IdChatLieu, IdMauSac, IdKichCo, IdThuongHieu, MoTa, SoLuong, DonGia, Anh, TrangThaiSPCT) 
VALUES 
('SPCT001', 1, 1, 1, 1, 1, N'Xe đạp 3 bánh ABC màu đỏ, khung thép, kích cỡ nhỏ', 50, 500000, 'abc_red.jpg', N'Còn hàng'),
('SPCT002', 2, 2, 2, 2, 2, N'Xe đạp có bánh phụ XYZ màu xanh, khung hợp kim, kích cỡ trung bình', 30, 800000, 'xyz_green.jpg', N'Còn hàng'),
('SPCT003', 3, 3, 3, 3, 3, N'Xe đạp thể thao KidsSport màu vàng, khung hợp kim, kích cỡ lớn', 20, 1500000, 'kidsport_yellow.jpg', N'Còn hàng'),
('SPCT004', 4, 4, 4, 4, 4, N'Xe đạp thăng bằng JoyBalance màu hồng, khung nhôm, kích cỡ nhỏ', 40, 600000, 'joybalance_pink.jpg', N'Còn hàng'),
('SPCT005', 5, 5, 5, 5, 5, N'Xe đạp điện mini E-Bike màu đen, khung thép, kích cỡ lớn', 15, 2500000, 'ebike_black.jpg', N'Còn hàng'),
('SPCT006', 1, 1, 2, 1, 1, N'Xe đạp 3 bánh ABC màu xanh, khung thép, kích cỡ nhỏ', 45, 520000, 'abc_green.jpg', N'Còn hàng'),
('SPCT007', 2, 2, 3, 2, 2, N'Xe đạp có bánh phụ XYZ màu vàng, khung hợp kim, kích cỡ trung bình', 35, 820000, 'xyz_yellow.jpg', N'Còn hàng'),
('SPCT008', 3, 3, 4, 3, 3, N'Xe đạp thể thao KidsSport màu đen, khung hợp kim, kích cỡ lớn', 18, 1520000, 'kidsport_black.jpg', N'Còn hàng'),
('SPCT009', 4, 4, 5, 4, 4, N'Xe đạp thăng bằng JoyBalance màu xanh dương, khung nhôm, kích cỡ nhỏ', 37, 620000, 'joybalance_blue.jpg', N'Còn hàng'),
('SPCT010', 5, 5, 1, 5, 5, N'Xe đạp điện mini E-Bike màu trắng, khung thép, kích cỡ lớn', 10, 2550000, 'ebike_white.jpg', N'Còn hàng');

INSERT INTO ChucVu (MaChucVu, TenChucVu) 
VALUES 
('CV001', N'Quản lý'),
('CV002', N'Nhân viên'),
('CV003', N'ADMIN')

INSERT INTO NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, NgayLamViec, MatKhau, SDT, Email, TrangThaiNV, DiaChi, IdChucVu) 
VALUES 
('NV001', N'Trần Văn A', 1, '1990-05-15', '2023-01-01', 'password123', '0901234567', 'trana@gmail.com', N'Hoạt động', N'Số 1, đường A', 1),
('NV002', N'Nguyễn Thị B', 1, '1995-08-20', '2023-02-01', 'password123', '0907654321', 'nguyenb@gmail.com', N'Hoạt động', N'Số 2, đường B', 2),
('NV003', N'Nguyễn Văn C', 2, '1992-11-10', '2023-03-15', 'password123', '0902223334', 'nguyenc@gmail.com', N'Hoạt động', N'Số 3, đường C', 3);

INSERT INTO ThongTinVanChuyen (MaTTVC, Tinh, Huyen, Xa, DiaChi, TenNguoiNhan, SDT) 
VALUES 
('TTVC001', N'Thành phố Hà Nội', N'Quận Hoàn Kiếm', N'Phường Tràng Tiền', N'Số 4, phố B', N'Trần Văn A', '0901234567'),
('TTVC002', N'Tỉnh Thanh Hóa', N'Huyện Hoằng Hóa', N'Xã Hoằng Lộc', N'Số 10, đường C', N'Nguyễn Thị B', '0907654321');

INSERT INTO PhuongThucThanhToan (MaPTTT, TenPTTT, MaCode, ThongTinThanhToan, TrangThai) 
VALUES 
('PTTT001', N'Transfer', N'COD', N'Chuyển khoản ngân hàng', N'Hoạt động'),
('PTTT002', N'Thẻ tín dụng', N'Card', N'Sử dụng thẻ tín dụng để thanh toán', N'Hoạt động'),
('PTTT003', N'Thu tiền khi giao hàng', N'Pay on delivery', N'Thanh toán khi nhận hàng', N'Hoạt động');

INSERT INTO KhachHang (MaKH, TenKH, Email, SDT, DiaChi, MatKhau, IdTTVC) 
VALUES 
('KH001', N'Nguyễn Văn D', N'dnguyen@gmail.com', '0903456789', N'Số 5, đường D', 'password123', 1),
('KH002', N'Trần Thị E', N'e.tran@gmail.com', '0909876543', N'Số 6, đường E', 'password123', 2);

INSERT INTO HoaDon (MaHD, IdKH, IdNV, IdPTTT, NgayTao, PhiShip, HinhThucThanhToan, TongTien, TrangThaiHD) 
VALUES 
('HD001', 1, 1, 1, GETDATE(), 50000, N'Transfer', 1500000, N'Hoạt động'),
('HD002', 2, 2, 2, GETDATE(), 60000, N'Pay on delivery', 3000000, N'Hoạt động');

INSERT INTO HoaDonChiTiet (IdHD, IdSanPhamChiTiet, SoLuong, DonGia, DonGiaSauGiam) 
VALUES 
(1, 1, 2, 500000, 1000000),
(1, 2, 1, 800000, 800000),
(2, 3, 3, 1500000, 4500000);

INSERT INTO KhuyenMai (MaKM, TenKM, MucGiamGia, DieuKien, NgayBatDau, NgayKetThuc, KieuGiamGia, SoLuong, TrangThaiKM, IdHD) 
VALUES 
('KM001', N'Giảm giá mùa hè', 10, N'Mua 2 sản phẩm', '2024-06-01', '2024-06-30', N'Giảm giá theo phần trăm', 100, N'Hoạt động', 1);

INSERT INTO GioHang (IdKH, TrangThai, NgayTao) 
VALUES 
(1, N'Đang hoạt động', GETDATE()),
(2, N'Đang hoạt động', GETDATE());

INSERT INTO GioHangChiTiet (IdGioHang, IdSanPhamChiTiet, SoLuong, DonGia) 
VALUES 
(1, 1, 1, 500000),
(1, 2, 2, 800000),
(2, 3, 1, 1500000);

INSERT INTO DanhGia (IdSanPhamChiTiet, NoiDungDanhGia, NgayTao, SoSao) 
VALUES 
(1, N'Sản phẩm rất tốt, trẻ em thích.', GETDATE(), 5),
(2, N'Chất lượng tốt nhưng giá hơi cao.', GETDATE(), 4);

INSERT INTO HoaDon_History (IdHD, NgayThayDoi, NgayTao, TrangThai) 
VALUES 
(1, GETDATE(), GETDATE(), N'Hoạt động'),
(2, GETDATE(), GETDATE(), N'Hoạt động');
