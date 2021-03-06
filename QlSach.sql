USE [master]
GO
/****** Object:  Database [QlSach]    Script Date: 20/3/2018 10:00:22 AM ******/
CREATE DATABASE [QlSach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QlSach_Data', FILENAME = N'E:\QlSach_Data.MDF' , SIZE = 3008KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'QlSach_Log', FILENAME = N'E:\QlSach_Log.LDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [QlSach] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QlSach].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [QlSach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QlSach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QlSach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QlSach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QlSach] SET ARITHABORT OFF 
GO
ALTER DATABASE [QlSach] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QlSach] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QlSach] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [QlSach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QlSach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QlSach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QlSach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QlSach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QlSach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QlSach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QlSach] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QlSach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QlSach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QlSach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QlSach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QlSach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QlSach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QlSach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QlSach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QlSach] SET  MULTI_USER 
GO
ALTER DATABASE [QlSach] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [QlSach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QlSach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QlSach] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QlSach]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHD] [bigint] NOT NULL,
	[MaSach] [nvarchar](50) NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[MaHoaDon] [bigint] NOT NULL,
	[Gia] [float] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [bit] NOT NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[MaHoaDon] [bigint] NOT NULL,
	[makh] [bigint] NULL,
	[NgayMua] [datetime] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[Makh] [bigint] NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
	[SoDT] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[tendn] [nvarchar](50) NULL,
	[matkhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[Makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[loai]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_loai] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[luuhoadon]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[luuhoadon](
	[masach] [nvarchar](50) NULL,
	[soluongmua] [int] NULL,
	[ngay] [smalldatetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sach]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sach](
	[masach] [nvarchar](50) NOT NULL,
	[tensach] [nvarchar](50) NULL,
	[tacgia] [nvarchar](50) NULL,
	[soluong] [bigint] NULL,
	[gia] [bigint] NULL,
	[sotap] [nvarchar](50) NULL,
	[anh] [nvarchar](50) NULL,
	[maloai] [nvarchar](50) NULL,
	[NgayNhap] [datetime] NULL,
 CONSTRAINT [PK_sach] PRIMARY KEY CLUSTERED 
(
	[masach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[HoaDonBanSach]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HoaDonBanSach]
AS
SELECT        dbo.sach.masach, dbo.sach.tensach, dbo.sach.tacgia, dbo.ChiTietHoaDon.SoLuongMua, dbo.sach.gia, hoadon_1.NgayMua, hoadon_1.damua
FROM            dbo.sach INNER JOIN
                         dbo.ChiTietHoaDon ON dbo.sach.masach = dbo.ChiTietHoaDon.MaSach INNER JOIN
                         dbo.hoadon AS hoadon_1 ON dbo.ChiTietHoaDon.MaHoaDon = hoadon_1.MaHoaDon
WHERE        (hoadon_1.damua = 0)

GO
/****** Object:  View [dbo].[Test]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Test]
AS
SELECT        dbo.loai.tenloai, dbo.sach.tensach, dbo.sach.gia, dbo.ChiTietHoaDon.SoLuongMua, dbo.hoadon.NgayMua, dbo.KhachHang.hoten
FROM            dbo.ChiTietHoaDon INNER JOIN
                         dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                         dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.Makh INNER JOIN
                         dbo.sach ON dbo.ChiTietHoaDon.MaSach = dbo.sach.masach INNER JOIN
                         dbo.loai ON dbo.sach.maloai = dbo.loai.maloai

GO
/****** Object:  View [dbo].[TestThongKe]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TestThongKe]
AS
SELECT        dbo.loai.tenloai AS [Tên loại], COUNT(dbo.sach.soluong) AS [Số sách], SUM(dbo.sach.soluong) AS [Tổng số lượng], MIN(dbo.sach.gia) AS [Min giá], SUM(dbo.sach.soluong * dbo.sach.gia) AS [Tổng tiền]
FROM            dbo.loai INNER JOIN
                         dbo.sach ON dbo.loai.maloai = dbo.sach.maloai
GROUP BY dbo.loai.tenloai

GO
/****** Object:  View [dbo].[ThongKe2]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ThongKe2]
AS
SELECT        YEAR(NgayNhap) AS Năm, SUM(soluong) AS [Tổng số lượng]
FROM            dbo.sach
GROUP BY YEAR(NgayNhap)

GO
/****** Object:  View [dbo].[ThongKeHoaDon]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ThongKeHoaDon]
AS
SELECT        dbo.KhachHang.tendn, dbo.KhachHang.hoten, dbo.sach.tensach, dbo.ChiTietHoaDon.SoLuongMua, dbo.ChiTietHoaDon.Gia, SUM(dbo.ChiTietHoaDon.Gia * dbo.ChiTietHoaDon.SoLuongMua) AS ThanhTien, 
                         dbo.hoadon.damua
FROM            dbo.ChiTietHoaDon INNER JOIN
                         dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                         dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.Makh INNER JOIN
                         dbo.sach ON dbo.ChiTietHoaDon.MaSach = dbo.sach.masach
GROUP BY dbo.KhachHang.hoten, dbo.sach.tensach, dbo.ChiTietHoaDon.SoLuongMua, dbo.ChiTietHoaDon.Gia, dbo.KhachHang.tendn, dbo.hoadon.damua

GO
/****** Object:  View [dbo].[Vhoadon]    Script Date: 20/3/2018 10:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vhoadon]
AS
SELECT        dbo.sach.tensach, dbo.sach.gia, dbo.ChiTietHoaDon.SoLuongMua, dbo.hoadon.damua
FROM            dbo.sach INNER JOIN
                         dbo.loai ON dbo.sach.maloai = dbo.loai.maloai INNER JOIN
                         dbo.ChiTietHoaDon ON dbo.sach.masach = dbo.ChiTietHoaDon.MaSach INNER JOIN
                         dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon
WHERE        (dbo.hoadon.damua = 0)

GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSach], [SoLuongMua], [MaHoaDon], [Gia]) VALUES (8, N'tin15', 1, 3, 38000)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSach], [SoLuongMua], [MaHoaDon], [Gia]) VALUES (9, N'o3', 4, 4, 34000)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSach], [SoLuongMua], [MaHoaDon], [Gia]) VALUES (10, N'tin15', 9, 4, 38000)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSach], [SoLuongMua], [MaHoaDon], [Gia]) VALUES (11, N'n6', 1, 5, 78000)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSach], [SoLuongMua], [MaHoaDon], [Gia]) VALUES (12, N'tin15', 6, 5, 38000)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'1', N'nJWttVYrEbw=', 1)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'admin', N'21232f297a57a5a743894a0e4a801fc3', 1)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'admin1', N'c4ca4238a0b923820dcc509a6f75849b', 0)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'nguyendangtinhdx', N'c4ca4238a0b923820dcc509a6f75849b', 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (3, 1, CAST(N'2018-01-18 08:55:25.367' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (4, 1, CAST(N'2018-03-02 15:38:34.890' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (5, 1, CAST(N'2018-03-17 16:38:14.567' AS DateTime), 0)
INSERT [dbo].[KhachHang] ([Makh], [hoten], [diachi], [SoDT], [email], [tendn], [matkhau]) VALUES (1, N'Nguyen Dang Tinh', N'Hue, An Cuu', N'01263659419', N'nguyendangtinhdx@gmail.com', N'nguyendangtinhdx', N'c4ca4238a0b923820dcc509a6f75849b')
INSERT [dbo].[KhachHang] ([Makh], [hoten], [diachi], [SoDT], [email], [tendn], [matkhau]) VALUES (2, N'tinh bi', N'Hue, An Cuu', N'01263659419', N'tinhbidx@gmail.com', N'tinhbidx', N'c4ca4238a0b923820dcc509a6f75849b')
INSERT [dbo].[KhachHang] ([Makh], [hoten], [diachi], [SoDT], [email], [tendn], [matkhau]) VALUES (3, N'bi rain', N'Đà Nẵng', N'01263659419', N'birain@gmail.com', N'birain', N'c4ca4238a0b923820dcc509a6f75849b')
INSERT [dbo].[KhachHang] ([Makh], [hoten], [diachi], [SoDT], [email], [tendn], [matkhau]) VALUES (5, N'213', N'321', N'321', N'321', N'1', N'1')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'111', N'21234')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Bi quyet cuoc song', N'Bí quyết cuộc sống')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Chinh tri', N'Chính trị')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Dia ly', N'Địa lý')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Hoa hoc', N'Hóa học')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Khoa hoc', N'Khoa học')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Kinh te', N'Kinh tế')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Lich su', N'Lịch Sử')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Ngoai ngu', N'Ngoại ngữ')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'On thi CD-DH', N'Ôn thi CĐ-ĐH')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Tam ly', N'Tâm lý')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Tin', N'Tin Học')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Toan', N'Toán Học')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Van', N'Văn Học')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Vat ly', N'Vật lý')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Y hoc', N'Y học')
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'1111', N'Học nấu ăn', N'Trần Bảo Chung', 3, 10000, N'1', N'image_sach/a.jpg', N'111', CAST(N'2017-11-19 09:59:48.000' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'1111123123', N'Mạng', N'Lê Huỳnh', 11, 60000, N'2', N'image_sach/b4.jpg', N'Bi quyet cuoc song', CAST(N'2017-11-11 23:07:31.093' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b11', N'Tìm lại chính mình', N'Marcia Grad', 1, 35000, N'1', N'image_sach/b11.jpg', N'Bi quyet cuoc song', CAST(N'2017-11-11 15:52:39.783' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b12', N'Tìm lại giá trị cuộc sống', N'Mark V. Hansen, Jack Canfield', 40, 29000, N'1', N'image_sach/b12.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.000' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b14', N'Sứ mệnh yêu thương', N'Roger Cole', 26, 43000, N'1', N'image_sach/b14.jpg', N'Bi quyet cuoc song', CAST(N'2016-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b16', N'Con sẽ làm được', N'Donna M.Gennett- Ph.D', 100, 26000, N'1', N'image_sach/b16.jpg', N'Bi quyet cuoc song', CAST(N'2016-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b17', N'Đi tìm ý nghĩa cuộc sống', N'ERNIE CARWILE', 50, 40000, N'1', N'image_sach/b17.jpg', N'Bi quyet cuoc song', CAST(N'2016-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b18', N'Cảm ơn ký ức', N'CeceliAhern', 30, 48000, N'1', N'image_sach/b18.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b19', N'Hạt Giống Tâm Hồn dành cho sinh viên hoc sinh', N'Jack Canield-Mark Victor Hansen', 20, 25000, N'2', N'image_sach/b19.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b2', N'Bí mật của may mắn', N' Tổng hợp thành phố Hồ Chí Minh', 10, 21000, N'1', N'image_sach/b2.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b20', N'Hạt Giống Tâm Hồn dành riêng cho phụ nữ', N'Jack Canield-Mark Victor Hansen', 30, 25000, N'2', N'image_sach/b20.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b21', N'Hạt Giống Tâm Hồn dành cho tuổi Teen', N'Nhiều tác giả First News tổng hợp và thực hiện', 36, 32000, N'1', N'image_sach/b21.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b22', N'Làm thế nào để con chăm học', N'Lê Duyên Hải', 50, 29000, N'1', N'image_sach/b22.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b24', N'Những giá trị cuộc sống', N'Diane Tillman', 56, 30000, N'1', N'image_sach/b24.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b25', N'Quà tặng diệu kỳ', N'Mark V. Hansen, Jack Canfield', 30, 29000, N'1', N'image_sach/b25.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b3', N'Chấp cánh tuổi thơ', N'Tổng hợp TP Hồ Chí Minh', 15, 27000, N'1', N'image_sach/b3.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b4', N'Hạt giống yêu thương-Chicken Soup for the Soul 20', N'Nhiều tác giả - Tổng hợp và thực hiện First News', 20, 33000, N'1', N'image_sach/b4.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b5', N'Gía trị cuộc sống', N'Tổng hợp thành phố Hồ Chí Minh', 30, 17000, N'1', N'image_sach/b5.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b6', N'Hãy yêu cuộc sống của bạn chọn', N'Tổng hợp TP Hồ Chí Minh', 25, 43000, N'1', N'image_sach/b6.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b7', N'Quà tặng cuộc sống', N'Dr.Bernie S.Siegel', 30, 22000, N'1', N'image_sach/b7.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'b8', N'Quà tặng tinh thần dành cho phụ nữ', N'Nhiều tác giả - Biên soạn: First News', 10, 23000, N'1', N'image_sach/b8.jpg', N'Bi quyet cuoc song', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'c10', N'Triết học Phương Đông', N'M.T.STEPANLANTS', 49, 23000, N'1', N'image_sach/c10.jpg', N'Chinh tri', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'c11', N'Mắt bão - Những năm tháng của tôi tại CIA', N'George Tenet', 10, 144000, N'1', N'image_sach/c11.jpg', N'Chinh tri', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'c12', N'11Võ Văn Kiệt - Đổi mới, bản lĩnh và sáng tạo', N'Võ Văn Kiệt', 34, 55000, N'1', N'image_sach/c12.jpg', N'Chinh tri', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'c2', N'Các trường phái triết học', N'David E Cooper', 15, 110000, N'1', N'image_sach/c2.jpg', N'Chinh tri', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'c3', N'Chủ nghĩa Mac-Lênin bàn về TN và công tác TN', N'Phạm Đình Nghiệp', 40, 14000, N'1', N'image_sach/c3.jpg', N'Chinh tri', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'c4', N'Mỹ học Mac-Lenin', N'NXB Chính trị quốc gia', 30, 17000, N'1', N'image_sach/c4.jpg', N'Chinh tri', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'c5', N'Nhận diện chủ nghĩa tự do mới', N'Nguyễn Văn Thanh', 26, 16000, N'1', N'image_sach/c5.jpg', N'Chinh tri', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'c6', N'Tư tưởng HCM về dựng nước đi đôi với giữ nước', N'Viện khoa học xã hội nhân văn quân sự', 10, 56000, N'1', N'image_sach/c6.jpg', N'Chinh tri', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'c7', N'Cuộc chiến ngầm-Bí sử nhà trắng 2006-2008', N'Bob Woodward', 5, 130000, N'1', N'image_sach/c7.jpg', N'Chinh tri', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'c8', N'Tuyển tập danh tác triết học từ plato đến derrida', N'Eorrest E.baird', 3, 185000, N'1', N'image_sach/c8.jpg', N'Chinh tri', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'c9', N'Những chuyên đề triết học', N'Nhà xuất bản-Khoa học xã hội', 40, 19000, N'1', N'image_sach/c9.jpg', N'Chinh tri', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'd1', N'Bản đồ địa lý thế giới', N'Phạm Cao Hoàn', 29, 34000, N'1', N'image_sach/d1.jpg', N'Dia ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'd2', N'Địa lý hành chính Việt Nam', N'Nguyễn Huy', 10, 30000, N'1', N'image_sach/d2.jpg', N'Dia ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'd3', N'Ôn tập để học tốt địa lý 11', N'Phạm Thị Sen-Nguyễn Việt Hùng', 40, 20000, N'2', N'image_sach/d3.jpg', N'Dia ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'd4', N'Đổi mới phương pháp dạy học và kiểm tra địa lý 10', N'Nguyễn Hải Châu', 26, 27000, N'1', N'image_sach/d4.jpg', N'Dia ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'd5', N'Atlat địa lý Việt Nam', N'NXB Giáo dục', 500, 19000, N'1', N'image_sach/d5.jpg', N'Dia ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'd6', N'Địa lý và bản đồ', N'Hồ Tiến Huân', 48, 3600, N'1', N'image_sach/d6.jpg', N'Dia ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'd7', N'Địa lý kinh tế-Xã hội châu âu', N'Bùi Thị Hải Yến-Phạm Thị Ngọc Diệp', 40, 25000, N'1', N'image_sach/d7.jpg', N'Dia ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'h1', N'Hoá học đại cương', N'NXB khkt', 190, 36000, N'1', N'image_sach/h1.jpg', N'Hoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'h2', N'Hoá học 12 nâng cao', N'Nguyễn Đức Nghĩa', 330, 24000, N'1', N'image_sach/h2.jpg', N'Hoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'h3', N'Hướng dẫn sử dụng hiệu quả hoá 12 nâng cao', N'Lê Thanh Hải', 400, 36000, N'1', N'image_sach/h3.jpg', N'Hoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'h4', N'Hoá học 11 nâng cao', N'Nguyễn Minh An', 50, 31000, N'1', N'image_sach/h4.jpg', N'Hoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'h5', N'Hoá học 12', N'Trần Xuân Bắc', 40, 23000, N'1', N'image_sach/h5.jpg', N'Hoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'h6', N'Hoá học đại cương 1', N'Nguyễn Đức Vận', 600, 50000, N'2', N'image_sach/h6.jpg', N'Hoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'h7', N'Hoá học đại cương 2', N'Nguyễn Đức Vận', 700, 50000, N'2', N'image_sach/h7.jpg', N'Hoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'h8', N'Câu hỏi lý thuyết và bài tập trắc nghiệm hoá học', N'Lê Thanh Xuân', 56, 67000, N'1', N'image_sach/h8.jpg', N'Hoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k1', N'Từ điển tường giải kinh tế thị trường xã hội', N'Rolf H. Hasse-Hermann Schneider-Klaus Weigelt', 3, 165000, N'1', N'image_sach/k1.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k10', N'Nguồn gốc của khủng hoảng tài chính', N'George Cooper', 50, 55000, N'1', N'image_sach/k10.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k11', N'Vượt qua khủng hoảng kinh tế', N'Nguyễn Sơn', 48, 39000, N'1', N'image_sach/k11.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k12', N'Chiến lược cạnh tranh mới', N'Tạ Ngọc Ái', 36, 50000, N'1', N'image_sach/k12.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k2', N'Từ điển thuật ngữ thị trường chứng khoán', N'First News', 20, 65000, N'1', N'image_sach/k2.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k3', N'Quản trị tài chính', N'Eugene F Brigham -Joel F Houston', 5, 285000, N'1', N'image_sach/k3.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k4', N'Từ điển kinh tế thương mại Anh', N'Trần Văn Chánh', 10, 188000, N'1', N'image_sach/k4.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k5', N'Bí quyết kinh doanh', N'Tạ Ngọc Ái', 20, 68000, N'1', N'image_sach/k5.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k6', N'Thuật lãnh đạo', N'NXB Từ điển bách khoa', 30, 40000, N'1', N'image_sach/k6.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k7', N'Chiến lược thương hiệu Châu Á', N'Martin Roll', 45, 69000, N'1', N'image_sach/k7.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k8', N'Để thành công chứng khoán', N'NXB trẻ', 12, 60000, N'1', N'image_sach/k8.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'k9', N'Từ điển thuật ngữ kinh tế tài chính', N'Bernrd & Colli', 29, 63000, N'1', N'image_sach/k9.jpg', N'Kinh te', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa1', N'Hồ Sơ Nội Bộ', N'Lưu Bình', 18, 65000, N'1', N'image_sach/khoa1.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa11', N'Sách của bạn tôi', N'Anatole France', 29, 48000, N'1', N'image_sach/khoa11.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa12', N'Thắm sắc hoa đào', N'Vương An Ức', 68, 42000, N'1', N'image_sach/khoa12.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa13', N'Vô chiêu vô thức & viết ngắn tự chọn', N'Phan Cung Việt', 78, 45000, N'1', N'image_sach/khoa13.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa14', N'Thành phố Quốc Tế', N'Don Delillo', 37, 49000, N'1', N'image_sach/khoa14.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa15', N'Cuộc chiến khuy cúc', N'Louis Pergaud', 58, 54000, N'1', N'image_sach/khoa15.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa16', N'Thiết thư Trúc kiếm - 2 tập', N'Bạch Ngọc Thạch', 12, 189000, N'1', N'image_sach/khoa16.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa17', N'Học viện Công chúa - Princess Academy', N'Shannon Hale', 27, 59000, N'1', N'image_sach/khoa17.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa3', N'Thái độ quyết định thành công', N'Wayne Cordeiro', 10, 24000, N'1', N'image_sach/khoa3.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa4', N'Sydney yêu thương', N'Trung Nghĩa', 20, 38000, N'1', N'image_sach/khoa4.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa5', N'Thành Cổ Tinh Tuyệt', N'Nguyễn Thị Mơ Mộng', 35, 25000, N'1', N'image_sach/khoa5.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa7', N'Alice ở xứ sở diệu kì và Alice ở xứ sở trong gương', N'Lewis Carrol', 48, 58000, N'1', N'image_sach/khoa7.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa8', N'Lâu đài thần bí', N'Edward Eager', 50, 59000, N'1', N'image_sach/khoa8.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'khoa9', N'Truyện cổ Andersen', N'Hans Christian Andersen', 14, 95000, N'1', N'image_sach/khoa9.jpg', N'Khoa hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l1', N'Từ điển nhân vật lịch sử Việt Nam', N'Đinh Xuân Lâm, Trương Hữu Quýnh', 34, 78000, N'1', N'image_sach/l1.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l10', N'Chiếc áo Bác Hồ', N'Ngọc Châu', 60, 24000, N'1', N'image_sach/l10.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l11', N'Thời thanh niên của Bác Hồ', N'Hồng Hà', 29, 25500, N'1', N'image_sach/l11.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l12', N'Bác Hồ với tuổi trẻ năm châu', N'Trần Đương', 59, 20000, N'1', N'image_sach/l12.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l13', N'Những mẩu chuyện về đạo đức tác phong của Bác Hồ', N'NXB Thanh Niên', 18, 67000, N'1', N'image_sach/l13.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l14', N'Đại cương về văn hóa Việt Nam chặng đường 60 năm', N'NXB Quốc Gia', 45, 35000, N'1', N'image_sach/l14.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l15', N'Hoàng Lê Nhất Thống Chí', N'Ngô Gia Văn Phái', 100, 56000, N'1', N'image_sach/l15.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l16', N'Lịch sử đạo thiên chúa ở Việt Nam', N'Phạm Hồng Lam', 50, 24000, N'1', N'image_sach/l16.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l17', N'Lịch sử phật giáo', N'Nguyễn Tuệ Chân', 10, 115000, N'1', N'image_sach/l17.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l2', N'Một thiên lịch sử 6 đời Tổng Thống Mỹ Trung', N'Patrick Tyler', 10, 130000, N'1', N'image_sach/l2.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l3', N'Lịch sử Đông Nam Á', N'Lương Minh-Đỗ Thanh Bình-Trần Thị Vinh', 40, 45000, N'1', N'image_sach/l3.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l4', N'Lịch sử đạo phật Việt Nam', N'Nguyễn Duy Hinh', 67, 36000, N'1', N'image_sach/l4.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l5', N'Lịch sử bí mật đế chế Hoa Kỳ', N'John Perkins', 9, 104000, N'1', N'image_sach/l5.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l6', N'Lịch sử Trung Quốc 5000 năm', N'Lê Hán Đạt-Tào Hán Chương', 34, 49000, N'2', N'image_sach/l6.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l7', N'9 bản tuyên ngôn nổi tiếng thế giới', N'NXB Văn hoá thông tin', 20, 80000, N'1', N'image_sach/l7.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l8', N'Địa danh Hồ Chí Minh', N'NXB Thanh Niên', 100, 30000, N'1', N'image_sach/l8.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'l9', N'Nguyễn Aí Quốc với nhật ký chìm tàu', N'Phạm Quý Thích', 30, 40000, N'1', N'image_sach/l9.jpg', N'Lich su', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'ly1', N'Vật lý đại cương', N'Nguyễn Trong Hiếu', 51, 34000, N'1', N'image_sach/ly1.jpg', N'Vat ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'ly2', N'Phương pháp luyện thi môn vật lý', N'Võ Hải Hà', 87, 23000, N'1', N'image_sach/ly2.jpg', N'Vat ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'ly3', N'Hoc tốt vật lý 12', N'Lê Minh Trí', 90, 20000, N'1', N'image_sach/ly3.jpg', N'Vat ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'ly4', N'Giải các bài toán vật lý sơ cấp', N'Võ Việt Hùng', 100, 35000, N'3', N'image_sach/ly4.jpg', N'Vat ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'ly5', N'Bài tập và 453 bài toán vật lý 11', N'Nguyễn Lâm Huy', 200, 25500, N'1', N'image_sach/ly5.jpg', N'Vat ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'ly6', N'Giáo trình vật lý đại cương A1', N'Trương Quang Ngọc', 20, 65000, N'1', N'image_sach/ly6.jpg', N'Vat ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'ly7', N'168 câu hỏi lý thú về vật lý', N'Dương Văn Khoa', 98, 43000, N'1', N'image_sach/ly7.jpg', N'Vat ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'n1', N'Oxford', N'Oxford University Press', 29, 97000, N'1', N'image_sach/n1.jpg', N'Ngoai ngu', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'n2', N'Từ điển Anh-Anh-Việt', N'Nhà xuất bản thống kê', 20, 36000, N'1', N'image_sach/n2.jpg', N'Ngoai ngu', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'n3', N'Từ điển Anh-Anh-Việt', N'Quang Hùng - Ngọc Ánh', 40, 64000, N'1', N'image_sach/n3.jpg', N'Ngoai ngu', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
GO
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'n4', N'Oxford Wordpower Dictionary with CD-ROM', N'Oxford University Press', 50, 180000, N'1', N'image_sach/n4.jpg', N'Ngoai ngu', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'n5', N'Tiếng anh 12', N'Nguyễn Tùng', 10, 26000, N'1', N'image_sach/n7.jpg', N'Ngoai ngu', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'n6', N'Giáo trình tiếng anh khoa học máy tính', N'Quang Huy-Ngọc Ánh', 28, 78000, N'1', N'image_sach/n6.jpg', N'Ngoai ngu', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'o1', N'Đề thi tuyển sinh địa lý', N'Nguyễn Đức Vũ', 100, 25000, N'1', N'image_sach/o1.jpg', N'On thi CD-DH', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'o2', N'Tuyển chọn những bài ôn luyện thi CĐ-ĐH môn địa lý', N'Phí Công Việt', 18000, 50000, N'1', N'image_sach/o2.jpg', N'On thi CD-DH', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'o3', N'Ôn thi tốt nghiệp THPT-CĐ-ĐH môn Tiếng Anh', N'Nguyễn Thanh Nam', 40, 34000, N'1', N'image_sach/o3.jpg', N'On thi CD-DH', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'o4', N'Chuyên đề khảo sát hàm số luyện thi CĐ-ĐH', N'Trần Đức Huyên', 30, 40000, N'1', N'image_sach/o4.jpg', N'On thi CD-DH', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'o5', N'Chuẩn bị ôn thi tốt nghiệp THPT-CĐ-ĐH môn Vật lý', N'Nguyễn Minh Tuân', 20, 35000, N'1', N'image_sach/o5.jpg', N'On thi CD-DH', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'o6', N'Hướng dẫn ôn tập thi môn toán', N'Trần Công Mân', 46, 26000, N'3', N'image_sach/o6.jpg', N'On thi CD-DH', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'o7', N'Chuẩn bị ôn thi tốt nghiệp THPT-CĐ-ĐH môn Hoá Học', N'Nguyễn Huy Hoàng', 78, 47000, N'1', N'image_sach/o7.jpg', N'On thi CD-DH', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'o8', N'Luyện thi sinh học', N'Tàu Minh Việt', 57, 43000, N'1', N'image_sach/o8.jpg', N'On thi CD-DH', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N't1', N'Tâm lý làm sáng của trẻ em Việt Nam', N'Trần Thị Kim Yến', 49, 34000, N'1', N'image_sach/t1.jpg', N'Tam ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N't2', N'Tư vấn tâm lý căn bản', N'Nguyễn Thị Như Lan', 30, 23000, N'1', N'image_sach/t2.jpg', N'Tam ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N't3', N'Tâm lý học', N'Đào Duy Quang', 34, 56000, N'1', N'image_sach/t3.jpg', N'Tam ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N't4', N'Chuẩn bị tâm lý tuổi 40', N'Kajuri', 60, 29000, N'1', N'image_sach/t4.jpg', N'Tam ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N't5', N'Mãi thấm màu tình bạn', N'Nguyễn Trung Trực', 67, 45000, N'1', N'image_sach/t5.jpg', N'Tam ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N't6', N'Chuẩn bị tâm lý tuổi 50', N'Kajuri', 23, 17000, N'1', N'image_sach/t6.jpg', N'Tam ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N't7', N'Sức mạnh của trí tuệ cảm xúc', N'Roger Fisher & Daniel Sapiro', 40, 48000, N'1', N'image_sach/t7.jpg', N'Tam ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N't8', N'Gợi ý giải đáp những câu hỏi cho trẻ em', N'Liêm Trinh - Nguyễn Nghiêm', 20, 19000, N'1', N'image_sach/t8.jpg', N'Tam ly', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin1', N'Cấu trúc dữ liệu và giải thuật', N'Đỗ Xuân Lôi', 35, 30000, N'1', N'image_sach/tin1.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin10', N'Nâng Cấp Bảo Trì Và Xử Lý Phần Cứng Máy Tính tập 2', N'Michael Miller - Biên dịch Thanh Nguyên', 200, 45000, N'2', N'image_sach/tin10.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin11', N'Nâng Cấp Bảo Trì Và Xử Lý Phần Cứng Máy Tính tập 1', N'Michael Miller - Biên dịch Thanh Nguyên', 100, 45000, N'2', N'image_sach/tin11.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin12', N'Giáo Trình Thực Hành Flash', N'Phạm Quang  Hân - Hồ Chí Hoà ', 120, 35000, N'1', N'image_sach/tin12.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin13', N'Làm chủ Windows Server 2003- Tập 2', N'Phạm Hoàng Dũng', 40, 153000, N'2', N'image_sach/tin13.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin14', N'Sử dụng Illustrator CS cho người mới bắt đầu', N'KS. Ngọc Tuấn', 30, 46000, N'1', N'image_sach/tin14.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin15', N'Tinh chỉnh sự thực thi và tối ưu hóa ASP.NET', N'Ban biên soạn Hoàn Vũ-Chủ biên Phạm Đăng Khoa', 50, 38000, N'1', N'image_sach/tin15.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin16', N'Đồ họa vi tính Photoshop-Thật là đơn giản', N'Dương Mạnh Hùng - Lê Huy', 20, 60000, N'1', N'image_sach/tin16.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin2', N'Thiết kế sản phẩm với Cimatron E7.0', N'Nguyễn Trọng Hữu', 20, 63000, N'1', N'image_sach/tin2.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin3', N'Thực hành Visual C++ 6.0', N'Trương Công Tuấn', 12, 40000, N'1', N'image_sach/tin3.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin4', N'3D Studio Max 5.0', N'Trần Xuân Lôi', 12, 32000, N'1', N'image_sach/tin4.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin5', N'Thiết Kế Bản Vẽ Kỹ Thuật Với AUTOCAD 2005', N'Thuận Thành-Thành Tân', 25, 90000, N'1', N'image_sach/tin5.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin6', N'Lý thuyết cơ cở dữ liệu', N'Đõ tiến Tùng', 58, 32000, N'1', N'image_sach/tin6.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin7', N'Hướng dẫn sử dụng Photoshop 8.0', N'Nguyễn Tuấn Ngọc', 30, 80000, N'1', N'image_sach/tin7.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin8', N'Giáo Trình Cấu Trúc Máy Tính', N'Đặng Văn Anh', 20, 45000, N'1', N'image_sach/tin8.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'tin9', N'Tự học thiết kế Web và quản lý Web', N'Nguyễn Đình Tuấn', 15, 35000, N'1', N'image_sach/tin9.jpg', N'Tin', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'toan1', N'Giải tích', N'Nguyễn Gia Định', 8, 25000, N'1', N'image_sach/toan1.jpg', N'Toan', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'toan10', N'Toán hình giải tích 12', N'Nguyễn Huy Long', 39, 32000, N'1', N'image_sach/toan10.jpg', N'Toan', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'toan2', N'Cẩm Nang Toán Giải Tích', N'Hoàng Văn Phong', 100, 30000, N'1', N'image_sach/toan2.jpg', N'Toan', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'toan3', N'Giải Tích Số', N'Lê Minh Nghĩa', 300, 25000, N'1', N'image_sach/toan3.jpg', N'Toan', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'toan4', N'Giáo Trình Toán Giải Tích - Tập', N'Nguyễn Nhật Minh', 120, 19000, N'2', N'image_sach/toan4.jpg', N'Toan', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'toan5', N'Toán Học Với Đời Sống Sản Xuất Quốc Phòng', N'Trần Như Lệ', 100, 23000, N'2', N'image_sach/toan5.jpg', N'Toan', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'toan6', N'Tuyển Chọn 351 Bài Toán Giải Tích Tổ', N'Nguyễn Đình Anh', 50, 35000, N'1', N'image_sach/toan6.jpg', N'Toan', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'toan7', N'Toán Hình Giải Tích 12', N'Đào Văn Thi', 35, 26000, N'2', N'image_sach/toan7.jpg', N'Toan', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'toan8', N'Ảo thuật toán học', N'Matin Ganơ', 100, 23000, N'1', N'image_sach/toan8.jpg', N'Toan', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'toan9', N'Toán cao cấp giải tich', N'Phạm Hồng Danh', 40, 38000, N'2', N'image_sach/toan9.jpg', N'Toan', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v1', N'Chuyện chưa biết về nhà văn Nam Cao', N'Trần Thị Hồng', 101, 35000, N'1', N'image_sach/v1.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v10', N'Tắt Đèn 1', N'Ngô Tất Tố', 23, 23000, N'2', N'image_sach/v10.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v11', N'Thằng mõ trâu', N'Phạm Ngọc Tiến', 69, 27000, N'1', N'image_sach/v11.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v12', N'Huế - mùa mai đỏ', N'Xuân Thiều', 10, 110000, N'1', N'image_sach/v12.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v13', N'Chí Phèo', N'Nam Cao', 90, 34000, N'1', N'image_sach/v13.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v14', N'Thế giới Chữ Nghĩa trong thơ ca Tình Yêu', N'Dương Văn Khoa', 50, 36000, N'1', N'image_sach/v14.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v15', N'Chuyện tử tù Lê Quang Vịnh', N'Ngô Minh', 70, 30000, N'1', N'image_sach/v15.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v16', N'Truyện ngắn đương đại Việt Nam- tập 2', N'Nguyễn Lâm Huy', 40, 45000, N'2', N'image_sach/v16.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v17', N'Kiều', N'Nguyễn Du', 100, 32000, N'1', N'image_sach/v17.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v18', N'Cuộc đời và trang viết Nhìn nhận - đánh giá', N'Lê Tuấn Anh', 35, 65000, N'1', N'image_sach/v18.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v19', N'Truyện ngắn đương đại Việt Nam- tập 1', N'Nguyễn Lâm Huy', 65, 45000, N'2', N'image_sach/v19.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v2', N'Hành trang tuổi mười tám', N'Kim Nguyễn', 20, 23000, N'1', N'image_sach/v2.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v3', N'Xuân Từ Chiều', N'Y Ban', 100, 39000, N'1', N'image_sach/v3.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v4', N'Ca Dao Việt Nam Va Những Lời Bình', N'Lê Nam', 200, 23500, N'1', N'image_sach/v4.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v5', N'Tuyển tập truyện ngắn hay', N'Võ Việt Hùng', 100, 45000, N'1', N'image_sach/v5.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v6', N'Giông Tố', N'Ngô Tất Tố', 32, 35000, N'1', N'image_sach/v6.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v7', N'Hoàng Như Ma', N'Trần Hữu Tá', 50, 114000, N'1', N'image_sach/v7.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v8', N'Hòn Đất', N'Lê Hữu Nghị', 20, 30000, N'1', N'image_sach/v8.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'v9', N'Tắt Đèn', N'Ngô Tất Tố', 35, 25000, N'2', N'image_sach/v9.jpg', N'Van', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y10', N'Bệnh tiền liệt tuyến  giải pháp dự phòng-điều trị', N'Ngô Tín', 330, 18000, N'1', N'image_sach/y10.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y11', N'Cách ăn uống phòng bệnh ung thư', N'Ngọc Phương', 56, 42000, N'1', N'image_sach/y11.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y12', N'Cách phòng ngừa điều trị bệnh Gút', N'BS Mạnh Hải', 78, 45000, N'1', N'image_sach/y12.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y13', N'Bệnh gan mật những điều cần biết', N'BS Bạch Minh', 90, 37000, N'1', N'image_sach/y13.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y14', N'Vị thuốc chữa bệnh bằng rau củ quả', N'BS Lê Hữu Phước', 87, 29500, N'1', N'image_sach/y14.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y15', N'Trà với sức khoẻ và sắc đẹp', N'Lương Quỳnh Bạch', 99, 25000, N'1', N'image_sach/y15.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y16', N'Cẩm nang sức khoẻ gia đình', N'Nguyễn Lân Đính', 20, 120000, N'1', N'image_sach/y16.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y2', N'Phòng chữa bệnh béo Tri thức cơ sở của bệnh béo', N'Lưu Diễm Kiêu', 30, 10500, N'1', N'image_sach/y2.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y3', N'Bệnh Tăng Huyết Áp Cách Phòng Và Điều Trị', N' Bạch Minh', 20, 35000, N'1', N'image_sach/y3.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y4', N'Các bệnh ung thư thường gặp và đông y', N' Bác sĩ Hùng Minh', 100, 34000, N'1', N'image_sach/y4.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y5', N'34 bài thuốc chữa bệnh từ rau quả', N'Lê Hạnh', 110, 20000, N'1', N'image_sach/y5.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y6', N'Ấn huyệt bằng tay chữa bệnh', N'Võ Hải Hà', 120, 30000, N'1', N'image_sach/y6.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y7', N'Bạn chính là bác sỹ tốt nhất của mình', N'Lê Duyên Hải', 35, 40000, N'1', N'image_sach/y7.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y8', N'Từ điển Y học', N'BS Đặng Văn Chí', 200, 71000, N'1', N'image_sach/y8.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
INSERT [dbo].[sach] ([masach], [tensach], [tacgia], [soluong], [gia], [sotap], [anh], [maloai], [NgayNhap]) VALUES (N'y9', N'Các bệnh về da liễu phát hiện và điều trị', N'BS Lê Dung', 300, 30000, N'1', N'image_sach/y9.jpg', N'Y hoc', CAST(N'2017-10-24 19:23:03.970' AS DateTime))
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_hoadon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[hoadon] ([MaHoaDon])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_hoadon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[sach] ([masach])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_sach]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_KhachHang] FOREIGN KEY([makh])
REFERENCES [dbo].[KhachHang] ([Makh])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_KhachHang]
GO
ALTER TABLE [dbo].[sach]  WITH CHECK ADD  CONSTRAINT [FK_sach_loai] FOREIGN KEY([maloai])
REFERENCES [dbo].[loai] ([maloai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sach] CHECK CONSTRAINT [FK_sach_loai]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[25] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sach"
            Begin Extent = 
               Top = 3
               Left = 711
               Bottom = 133
               Right = 881
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "hoadon_1"
            Begin Extent = 
               Top = 12
               Left = 307
               Bottom = 142
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1485
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HoaDonBanSach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HoaDonBanSach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 0
               Left = 62
               Bottom = 130
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 1
               Left = 323
               Bottom = 131
               Right = 493
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 30
               Left = 552
               Bottom = 160
               Right = 722
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "loai"
            Begin Extent = 
               Top = 105
               Left = 22
               Bottom = 201
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 115
               Left = 441
               Bottom = 245
               Right = 611
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Test'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Test'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Test'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[28] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "loai"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 6
               Left = 357
               Bottom = 136
               Right = 527
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TestThongKe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TestThongKe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[27] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sach"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 180
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKe2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKe2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[13] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 0
               Left = 36
               Bottom = 130
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 26
               Left = 269
               Bottom = 156
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 74
               Left = 509
               Bottom = 182
               Right = 679
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "sach"
            Begin Extent = 
               Top = 0
               Left = 680
               Bottom = 130
               Right = 850
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 2460
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeHoaDon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeHoaDon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeHoaDon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sach"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "loai"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 101
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 135
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 135
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vhoadon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vhoadon'
GO
USE [master]
GO
ALTER DATABASE [QlSach] SET  READ_WRITE 
GO
