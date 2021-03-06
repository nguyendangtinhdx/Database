USE [master]
GO
/****** Object:  Database [FPTBaiTapJavaNangCaoQuanLyCuaHang]    Script Date: 20/3/2018 9:55:38 AM ******/
CREATE DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTBaiTapJavaNangCaoQuanLyCuaHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\FPTBaiTapJavaNangCaoQuanLyCuaHang.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FPTBaiTapJavaNangCaoQuanLyCuaHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\FPTBaiTapJavaNangCaoQuanLyCuaHang_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPTBaiTapJavaNangCaoQuanLyCuaHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET  MULTI_USER 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [FPTBaiTapJavaNangCaoQuanLyCuaHang]
GO
/****** Object:  Table [dbo].[DICHVU]    Script Date: 20/3/2018 9:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DICHVU](
	[MaDV] [nvarchar](50) NOT NULL,
	[TenDV] [nvarchar](50) NOT NULL,
	[DonViTinh] [nvarchar](50) NOT NULL,
	[DonGia] [int] NOT NULL,
 CONSTRAINT [PK_DICHVU] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 20/3/2018 9:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [nvarchar](50) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[DiaChiEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MAY]    Script Date: 20/3/2018 9:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAY](
	[MaMay] [nvarchar](50) NOT NULL,
	[ViTri] [nvarchar](50) NOT NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_May] PRIMARY KEY CLUSTERED 
(
	[MaMay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SUDUNGDICHVU]    Script Date: 20/3/2018 9:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUDUNGDICHVU](
	[MaKH] [nvarchar](50) NOT NULL,
	[MaDV] [nvarchar](50) NOT NULL,
	[NgaySuDung] [date] NOT NULL,
	[GioSuDung] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_SUDUNGDICHVU] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC,
	[MaDV] ASC,
	[NgaySuDung] ASC,
	[GioSuDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SUDUNGMAY]    Script Date: 20/3/2018 9:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUDUNGMAY](
	[MaKH] [nvarchar](50) NOT NULL,
	[MaMay] [nvarchar](50) NOT NULL,
	[NgayBatDauSuDung] [date] NOT NULL,
	[GioBatDauSuDung] [nvarchar](50) NOT NULL,
	[ThoiGianSuDung] [nvarchar](50) NULL,
 CONSTRAINT [PK_SUDUNGMAY] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC,
	[MaMay] ASC,
	[NgayBatDauSuDung] ASC,
	[GioBatDauSuDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[DangKy]    Script Date: 20/3/2018 9:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DangKy]
AS
SELECT        ThongKe.MaKH, ThongKe.TenKH, ThongKe.MaMay, ThongKe.ViTri, ThongKe.TrangThai, ThongKe.NgayBatDauSuDung, ThongKe.GioBatDauSuDung, ThongKe.ThoiGianSuDung, ThongKe.MaDV, ThongKe.NgaySuDung, 
                         ThongKe.GioSuDung, ThongKe.SoLuong, ThongKe2.MaKH AS Expr1, ThongKe2.TongTien
FROM            (SELECT        dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.MAY.MaMay, dbo.MAY.ViTri, dbo.MAY.TrangThai, dbo.SUDUNGMAY.NgayBatDauSuDung, dbo.SUDUNGMAY.GioBatDauSuDung, 
                                                    dbo.SUDUNGMAY.ThoiGianSuDung, dbo.DICHVU.MaDV, dbo.SUDUNGDICHVU.NgaySuDung, dbo.SUDUNGDICHVU.GioSuDung, dbo.SUDUNGDICHVU.SoLuong
                          FROM            dbo.KHACHHANG INNER JOIN
                                                    dbo.SUDUNGMAY ON dbo.SUDUNGMAY.MaKH = dbo.KHACHHANG.MaKH INNER JOIN
                                                    dbo.SUDUNGDICHVU ON dbo.SUDUNGDICHVU.MaKH = dbo.KHACHHANG.MaKH INNER JOIN
                                                    dbo.DICHVU ON dbo.DICHVU.MaDV = dbo.SUDUNGDICHVU.MaDV INNER JOIN
                                                    dbo.MAY ON dbo.MAY.MaMay = dbo.SUDUNGMAY.MaMay) AS ThongKe INNER JOIN
                             (SELECT        KHACHHANG_1.MaKH, SUM(DICHVU_1.DonGia * SUDUNGDICHVU_1.SoLuong) AS TongTien
                               FROM            dbo.KHACHHANG AS KHACHHANG_1 INNER JOIN
                                                         dbo.SUDUNGDICHVU AS SUDUNGDICHVU_1 ON SUDUNGDICHVU_1.MaKH = KHACHHANG_1.MaKH INNER JOIN
                                                         dbo.DICHVU AS DICHVU_1 ON DICHVU_1.MaDV = SUDUNGDICHVU_1.MaDV
                               GROUP BY KHACHHANG_1.MaKH, DICHVU_1.MaDV) AS ThongKe2 ON ThongKe2.MaKH = ThongKe.MaKH

GO
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [DonGia]) VALUES (N'DV01', N'Du lịch', N'VNĐ', 1000)
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [DonGia]) VALUES (N'DV02', N'Cầm đồ', N'VNĐ', 2000)
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [DonGia]) VALUES (N'DV03', N'Vận chuyển', N'$', 5000)
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [DonGia]) VALUES (N'DV04', N'Shipping', N'Euro', 2500)
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [DonGia]) VALUES (N'DV05', N'Chở hàng', N'VNĐ', 500000)
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [DonGia]) VALUES (N'DV06', N'Bán nhà', N'$', 65000)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SoDienThoai], [DiaChiEmail]) VALUES (N'KH01', N'Trần Văn Cường', N'Đà Nẵng', N'09565514455', N'cuongtv@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SoDienThoai], [DiaChiEmail]) VALUES (N'KH02', N'Lê Thành', N'Huế', N'12345678', N'thanhl@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SoDienThoai], [DiaChiEmail]) VALUES (N'KH03', N'Nguyễn Cao Tùng', N'Quảng Nam', N'123456789451', N'tungnc@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SoDienThoai], [DiaChiEmail]) VALUES (N'KH04', N'Trương Công Hùng', N'Quảng Trị', N'45641323', N'hungtc@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SoDienThoai], [DiaChiEmail]) VALUES (N'KH05', N'Quách Tuấn Du', N'Kon Tum', N'090123456798', N'duqt@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SoDienThoai], [DiaChiEmail]) VALUES (N'KH06', N'Trần Quang Đại', N'Đắc Lắc', N'89464511', N'daitq@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SoDienThoai], [DiaChiEmail]) VALUES (N'KH07', N'Nguyễn Công Phượng', N'Đà Nẵng', N'4354343543', N'phuongnc@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SoDienThoai], [DiaChiEmail]) VALUES (N'KH08', N'Lê Phước', N'Hue, An Cuu', N'0901231456', N'phuocl@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SoDienThoai], [DiaChiEmail]) VALUES (N'KH12342', N'3213', N'32131', N'0905954154', N'tinhdx@gmail.com')
INSERT [dbo].[MAY] ([MaMay], [ViTri], [TrangThai]) VALUES (N'M01', N'Hàng 1', N'Dùng được')
INSERT [dbo].[MAY] ([MaMay], [ViTri], [TrangThai]) VALUES (N'M02', N'Hàng 2', N'Bận')
INSERT [dbo].[MAY] ([MaMay], [ViTri], [TrangThai]) VALUES (N'M03', N'Hàng 3', N'Dùng được')
INSERT [dbo].[MAY] ([MaMay], [ViTri], [TrangThai]) VALUES (N'M04', N'Hàng 4', N'Đang sửa chữa')
INSERT [dbo].[MAY] ([MaMay], [ViTri], [TrangThai]) VALUES (N'M05', N'Hàng 5', N'Đang sửa chữa')
INSERT [dbo].[MAY] ([MaMay], [ViTri], [TrangThai]) VALUES (N'M06', N'Hàng 6', N'Dùng được')
INSERT [dbo].[MAY] ([MaMay], [ViTri], [TrangThai]) VALUES (N'M07', N'Hàng 7', N'Dùng được')
INSERT [dbo].[MAY] ([MaMay], [ViTri], [TrangThai]) VALUES (N'M08', N'Hàng 8', N'Đang sửa chữa')
INSERT [dbo].[MAY] ([MaMay], [ViTri], [TrangThai]) VALUES (N'M09', N'Hàng 9 ', N'Bận')
INSERT [dbo].[MAY] ([MaMay], [ViTri], [TrangThai]) VALUES (N'M10', N'Hàng 10', N'Rảnh')
INSERT [dbo].[SUDUNGDICHVU] ([MaKH], [MaDV], [NgaySuDung], [GioSuDung], [SoLuong]) VALUES (N'KH01', N'DV01', CAST(N'2015-12-30' AS Date), N'6:15', 50)
INSERT [dbo].[SUDUNGDICHVU] ([MaKH], [MaDV], [NgaySuDung], [GioSuDung], [SoLuong]) VALUES (N'KH02', N'DV02', CAST(N'2017-05-16' AS Date), N'8:11', 100)
INSERT [dbo].[SUDUNGDICHVU] ([MaKH], [MaDV], [NgaySuDung], [GioSuDung], [SoLuong]) VALUES (N'KH02', N'DV02', CAST(N'2222-02-11' AS Date), N'4:50', 5)
INSERT [dbo].[SUDUNGDICHVU] ([MaKH], [MaDV], [NgaySuDung], [GioSuDung], [SoLuong]) VALUES (N'KH03', N'DV02', CAST(N'2015-12-30' AS Date), N'6:49', 500)
INSERT [dbo].[SUDUNGDICHVU] ([MaKH], [MaDV], [NgaySuDung], [GioSuDung], [SoLuong]) VALUES (N'KH05', N'DV02', CAST(N'2011-12-11' AS Date), N'6:58', 15)
INSERT [dbo].[SUDUNGDICHVU] ([MaKH], [MaDV], [NgaySuDung], [GioSuDung], [SoLuong]) VALUES (N'KH07', N'DV03', CAST(N'2019-09-09' AS Date), N'6:25', 20)
INSERT [dbo].[SUDUNGMAY] ([MaKH], [MaMay], [NgayBatDauSuDung], [GioBatDauSuDung], [ThoiGianSuDung]) VALUES (N'KH01', N'M01', CAST(N'2015-12-11' AS Date), N'6:25', N'30 phút')
INSERT [dbo].[SUDUNGMAY] ([MaKH], [MaMay], [NgayBatDauSuDung], [GioBatDauSuDung], [ThoiGianSuDung]) VALUES (N'KH01', N'M01', CAST(N'2017-01-20' AS Date), N'5:55', N'5 phút')
INSERT [dbo].[SUDUNGMAY] ([MaKH], [MaMay], [NgayBatDauSuDung], [GioBatDauSuDung], [ThoiGianSuDung]) VALUES (N'KH01', N'M01', CAST(N'2204-02-11' AS Date), N'3:30', N'15 phút')
INSERT [dbo].[SUDUNGMAY] ([MaKH], [MaMay], [NgayBatDauSuDung], [GioBatDauSuDung], [ThoiGianSuDung]) VALUES (N'KH02', N'M02', CAST(N'2016-12-15' AS Date), N'9:21', N'60 phút')
INSERT [dbo].[SUDUNGMAY] ([MaKH], [MaMay], [NgayBatDauSuDung], [GioBatDauSuDung], [ThoiGianSuDung]) VALUES (N'KH02', N'M10', CAST(N'2018-04-04' AS Date), N'5:54', N'80 phút')
INSERT [dbo].[SUDUNGMAY] ([MaKH], [MaMay], [NgayBatDauSuDung], [GioBatDauSuDung], [ThoiGianSuDung]) VALUES (N'KH03', N'M07', CAST(N'2017-05-20' AS Date), N'6:14', N'64 phút')
INSERT [dbo].[SUDUNGMAY] ([MaKH], [MaMay], [NgayBatDauSuDung], [GioBatDauSuDung], [ThoiGianSuDung]) VALUES (N'KH04', N'M05', CAST(N'2016-02-01' AS Date), N'21:2', N'180 phút')
INSERT [dbo].[SUDUNGMAY] ([MaKH], [MaMay], [NgayBatDauSuDung], [GioBatDauSuDung], [ThoiGianSuDung]) VALUES (N'KH05', N'M05', CAST(N'2020-02-22' AS Date), N'5:47', N'90 phút')
INSERT [dbo].[SUDUNGMAY] ([MaKH], [MaMay], [NgayBatDauSuDung], [GioBatDauSuDung], [ThoiGianSuDung]) VALUES (N'KH07', N'M02', CAST(N'2018-08-08' AS Date), N'3:52', N'25 phút')
ALTER TABLE [dbo].[SUDUNGDICHVU]  WITH CHECK ADD  CONSTRAINT [FK_SUDUNGDICHVU_DICHVU] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DICHVU] ([MaDV])
GO
ALTER TABLE [dbo].[SUDUNGDICHVU] CHECK CONSTRAINT [FK_SUDUNGDICHVU_DICHVU]
GO
ALTER TABLE [dbo].[SUDUNGDICHVU]  WITH CHECK ADD  CONSTRAINT [FK_SUDUNGDICHVU_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[SUDUNGDICHVU] CHECK CONSTRAINT [FK_SUDUNGDICHVU_KHACHHANG]
GO
ALTER TABLE [dbo].[SUDUNGMAY]  WITH CHECK ADD  CONSTRAINT [FK_SUDUNGMAY_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[SUDUNGMAY] CHECK CONSTRAINT [FK_SUDUNGMAY_KHACHHANG]
GO
ALTER TABLE [dbo].[SUDUNGMAY]  WITH CHECK ADD  CONSTRAINT [FK_SUDUNGMAY_May] FOREIGN KEY([MaMay])
REFERENCES [dbo].[MAY] ([MaMay])
GO
ALTER TABLE [dbo].[SUDUNGMAY] CHECK CONSTRAINT [FK_SUDUNGMAY_May]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[0] 2[42] 3) )"
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
         Begin Table = "ThongKe"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ThongKe2"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 102
               Right = 443
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
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1635
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DangKy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DangKy'
GO
USE [master]
GO
ALTER DATABASE [FPTBaiTapJavaNangCaoQuanLyCuaHang] SET  READ_WRITE 
GO
