USE [master]
GO
/****** Object:  Database [QuanLyThuVien]    Script Date: 20/3/2018 10:01:28 AM ******/
CREATE DATABASE [QuanLyThuVien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyThuVien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyThuVien.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyThuVien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyThuVien_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyThuVien] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyThuVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyThuVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyThuVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyThuVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyThuVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyThuVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyThuVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyThuVien] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyThuVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyThuVien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyThuVien] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyThuVien]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 20/3/2018 10:01:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 20/3/2018 10:01:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia](
	[MaDG] [nvarchar](50) NOT NULL,
	[TenDG] [nvarchar](50) NOT NULL,
	[Khoa] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DocGia] PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MuonTra]    Script Date: 20/3/2018 10:01:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuonTra](
	[MaMuonTra] [nvarchar](50) NOT NULL,
	[SoLuongMuon] [int] NOT NULL,
	[SoLuongTra] [int] NOT NULL,
	[NgayMuon] [nvarchar](50) NOT NULL,
	[NgayTra] [nvarchar](50) NOT NULL,
	[SoLanGiaHan] [int] NULL,
	[MaDG] [nvarchar](50) NOT NULL,
	[MaSach] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MuonTra] PRIMARY KEY CLUSTERED 
(
	[MaMuonTra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 20/3/2018 10:01:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [nvarchar](50) NOT NULL,
	[TenSach] [nvarchar](50) NOT NULL,
	[TheLoai] [nvarchar](50) NOT NULL,
	[TenTG] [nvarchar](50) NOT NULL,
	[NXB] [int] NOT NULL,
	[ViTri] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ThongKeNguoiMuon]    Script Date: 20/3/2018 10:01:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ThongKeNguoiMuon]
AS
SELECT     distinct   dbo.DocGia.MaDG, dbo.DocGia.TenDG, dbo.Sach.MaSach, dbo.Sach.TenSach, dbo.MuonTra.SoLuongMuon, dbo.MuonTra.SoLuongTra
FROM            dbo.DocGia INNER JOIN
                         dbo.MuonTra ON dbo.DocGia.MaDG = dbo.MuonTra.MaDG INNER JOIN
                         dbo.Sach ON dbo.MuonTra.MaSach = dbo.Sach.MaSach



GO
/****** Object:  View [dbo].[ThongKeNguoiMuonQuaHan]    Script Date: 20/3/2018 10:01:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ThongKeNguoiMuonQuaHan]
AS
SELECT     distinct   dbo.DocGia.MaDG, dbo.DocGia.TenDG, dbo.Sach.MaSach, dbo.Sach.TenSach, dbo.MuonTra.NgayMuon, dbo.MuonTra.NgayTra, DATEDIFF(day, CAST(dbo.MuonTra.NgayMuon AS DATE), 
                         CAST(dbo.MuonTra.NgayTra AS DATE)) - 90 AS SoNgayQuaHan, (DATEDIFF(day, CAST(dbo.MuonTra.NgayMuon AS DATE), CAST(dbo.MuonTra.NgayTra AS DATE)) - 90) * 2000 AS TienNopPhat
FROM            dbo.DocGia INNER JOIN
                         dbo.MuonTra ON dbo.DocGia.MaDG = dbo.MuonTra.MaDG INNER JOIN
                         dbo.Sach ON dbo.MuonTra.MaSach = dbo.Sach.MaSach
WHERE        (DATEDIFF(day, CAST(dbo.MuonTra.NgayMuon AS DATE), CAST(dbo.MuonTra.NgayTra AS DATE)) > 90)


GO
/****** Object:  View [dbo].[ThongKeSachChuaDuocMuon]    Script Date: 20/3/2018 10:01:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ThongKeSachChuaDuocMuon]
AS
SELECT        MaSach, TenSach, TheLoai, TenTG, NXB, ViTri, SoLuong
FROM            dbo.Sach
WHERE        (MaSach NOT IN
                             (SELECT        MaSach
                               FROM            dbo.MuonTra))




GO
/****** Object:  View [dbo].[ThongKeSachDaMuon]    Script Date: 20/3/2018 10:01:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ThongKeSachDaMuon]
AS
SELECT DISTINCT dbo.Sach.MaSach, dbo.Sach.TenSach, dbo.Sach.NXB, dbo.Sach.TenTG, dbo.Sach.TheLoai, dbo.Sach.ViTri, A.SoLuongDaMuon, dbo.Sach.SoLuong - A.SoLuongDaMuon AS SoLuongConLai
FROM            dbo.MuonTra INNER JOIN
                         dbo.Sach ON dbo.MuonTra.MaSach = dbo.Sach.MaSach INNER JOIN
                             (SELECT        Sach_1.MaSach, SUM(MuonTra_2.SoLuongMuon) - SUM(MuonTra_2.SoLuongTra) AS SoLuongDaMuon
                               FROM            dbo.Sach AS Sach_1 INNER JOIN
                                                         dbo.MuonTra AS MuonTra_2 ON Sach_1.MaSach = MuonTra_2.MaSach
                               GROUP BY Sach_1.MaSach, Sach_1.TenSach, Sach_1.TheLoai, Sach_1.TenTG, Sach_1.NXB, Sach_1.ViTri
                               HAVING         (Sach_1.MaSach IN
                                                             (SELECT        MaSach
                                                               FROM            dbo.MuonTra AS MuonTra_1))) AS A ON dbo.Sach.MaSach = A.MaSach


GO
INSERT [dbo].[Admin] ([username], [password]) VALUES (N'admin', N'admin')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [Khoa], [SDT]) VALUES (N'DG1', N'Trần Minh Tuấn', N'Công nghệ thông tin', N'01653652615')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [Khoa], [SDT]) VALUES (N'DG2', N'Lê Thị Thúy', N'Báo chí', N'0908456214')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [Khoa], [SDT]) VALUES (N'DG3', N'Nguyễn Trọng Châu', N'Kiến trúc', N'01256365951')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [Khoa], [SDT]) VALUES (N'DG4', N'Trường Trọng Kiên', N'Vật lý', N'0908532651')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [Khoa], [SDT]) VALUES (N'DG5', N'Lưu Thị Lan', N'Lịch sử', N'0908532653')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [Khoa], [SDT]) VALUES (N'DG6', N'Nguyễn Thành Trung', N'Điện tử viễn thông', N'01635652487')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [Khoa], [SDT]) VALUES (N'DG7', N'Bùi Thị Thảo', N'Môi trường', N'01236598567')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [Khoa], [SDT]) VALUES (N'DG8', N'Lê Hoàng Nam', N'Địa chất', N'01234563128')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [Khoa], [SDT]) VALUES (N'DG9', N'Lê Hoàng Nam', N'Địa chất', N'01234563128')
INSERT [dbo].[MuonTra] ([MaMuonTra], [SoLuongMuon], [SoLuongTra], [NgayMuon], [NgayTra], [SoLanGiaHan], [MaDG], [MaSach]) VALUES (N'MT1', 3, 2, N'1-5-2017', N'4-1-2017', 1, N'DG1', N'S8')
INSERT [dbo].[MuonTra] ([MaMuonTra], [SoLuongMuon], [SoLuongTra], [NgayMuon], [NgayTra], [SoLanGiaHan], [MaDG], [MaSach]) VALUES (N'MT2', 2, 0, N'2-1-2017', N'2-2-2017', 2, N'DG2', N'S6')
INSERT [dbo].[MuonTra] ([MaMuonTra], [SoLuongMuon], [SoLuongTra], [NgayMuon], [NgayTra], [SoLanGiaHan], [MaDG], [MaSach]) VALUES (N'MT3', 1, 1, N'2-4-2017', N'5-8-2017', 2, N'DG3', N'S3')
INSERT [dbo].[MuonTra] ([MaMuonTra], [SoLuongMuon], [SoLuongTra], [NgayMuon], [NgayTra], [SoLanGiaHan], [MaDG], [MaSach]) VALUES (N'MT4', 3, 1, N'4-1-2017', N'7-7-2017', 2, N'DG4', N'S5')
INSERT [dbo].[MuonTra] ([MaMuonTra], [SoLuongMuon], [SoLuongTra], [NgayMuon], [NgayTra], [SoLanGiaHan], [MaDG], [MaSach]) VALUES (N'MT5', 2, 2, N'3-2-2017', N'6-4-2017', 2, N'DG5', N'S6')
INSERT [dbo].[MuonTra] ([MaMuonTra], [SoLuongMuon], [SoLuongTra], [NgayMuon], [NgayTra], [SoLanGiaHan], [MaDG], [MaSach]) VALUES (N'MT6', 3, 2, N'6-5-2017', N'9-5-2017', 1, N'DG1', N'S6')
INSERT [dbo].[MuonTra] ([MaMuonTra], [SoLuongMuon], [SoLuongTra], [NgayMuon], [NgayTra], [SoLanGiaHan], [MaDG], [MaSach]) VALUES (N'MT7', 1, 0, N'1-2-2017', N'4-11-2017', 0, N'DG6', N'S7')
INSERT [dbo].[MuonTra] ([MaMuonTra], [SoLuongMuon], [SoLuongTra], [NgayMuon], [NgayTra], [SoLanGiaHan], [MaDG], [MaSach]) VALUES (N'MT8', 1, 0, N'2-1-2017', N'6-5-2017', 0, N'DG8', N'S8')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TheLoai], [TenTG], [NXB], [ViTri], [SoLuong]) VALUES (N'S1', N'Tin học đại cương', N'Tự nhiên', N'Lý Thị Lan', 2000, N'H1', 30)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TheLoai], [TenTG], [NXB], [ViTri], [SoLuong]) VALUES (N'S2', N'Chủ nghĩa Mác - Lên Nin', N'Xã hội', N'Huỳnh Ngọc Hải', 1999, N'H2', 15)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TheLoai], [TenTG], [NXB], [ViTri], [SoLuong]) VALUES (N'S3', N'Cấu trúc hạ tầng', N'Tài liệu tham khảo', N'Bùi Trọng Hùng', 2002, N'H3', 25)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TheLoai], [TenTG], [NXB], [ViTri], [SoLuong]) VALUES (N'S4', N'Pháp luật', N'Xã hội', N'Trương Minh Hằng', 2003, N'H4', 36)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TheLoai], [TenTG], [NXB], [ViTri], [SoLuong]) VALUES (N'S5', N'Môi trường thiên nhiên', N'Xã hội', N'Lưu Thị Lan', 1999, N'H5', 45)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TheLoai], [TenTG], [NXB], [ViTri], [SoLuong]) VALUES (N'S6', N'Cấu trúc dữ liệu và thuật toán', N'Tự nhiên', N'Bùi Minh Đức', 2006, N'H6', 28)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TheLoai], [TenTG], [NXB], [ViTri], [SoLuong]) VALUES (N'S7', N'Cơ sở dữ liệu', N'Tự nhiên', N'Hồ Công Thịnh', 2004, N'H7', 39)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TheLoai], [TenTG], [NXB], [ViTri], [SoLuong]) VALUES (N'S8', N'Tư tưởng Hồ Chí Minh', N'Xã hội', N'Trần Thanh Tuyền', 2001, N'H8', 50)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TheLoai], [TenTG], [NXB], [ViTri], [SoLuong]) VALUES (N'S9', N'Kỹ năng mềm', N'Xã hội', N'Lưu Tuấn Đạt', 2000, N'H9', 45)
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_MuonTra_DocGia] FOREIGN KEY([MaDG])
REFERENCES [dbo].[DocGia] ([MaDG])
GO
ALTER TABLE [dbo].[MuonTra] CHECK CONSTRAINT [FK_MuonTra_DocGia]
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_MuonTra_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[MuonTra] CHECK CONSTRAINT [FK_MuonTra_Sach]
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
         Begin Table = "DocGia"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MuonTra"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Sach"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeNguoiMuon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeNguoiMuon'
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
         Begin Table = "DocGia"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MuonTra"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Sach"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeNguoiMuonQuaHan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeNguoiMuonQuaHan'
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
         Begin Table = "Sach"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeSachChuaDuocMuon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeSachChuaDuocMuon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[20] 3) )"
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
         Begin Table = "MuonTra"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Sach"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 636
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeSachDaMuon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeSachDaMuon'
GO
USE [master]
GO
ALTER DATABASE [QuanLyThuVien] SET  READ_WRITE 
GO
