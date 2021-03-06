USE [master]
GO
/****** Object:  Database [Qlcafe]    Script Date: 20/3/2018 9:59:51 AM ******/
CREATE DATABASE [Qlcafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Qlcafe', FILENAME = N'E:\Qlcafe.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Qlcafe_log', FILENAME = N'E:\Qlcafe_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Qlcafe] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Qlcafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Qlcafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Qlcafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Qlcafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Qlcafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Qlcafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Qlcafe] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Qlcafe] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Qlcafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Qlcafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Qlcafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Qlcafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Qlcafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Qlcafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Qlcafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Qlcafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Qlcafe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Qlcafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Qlcafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Qlcafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Qlcafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Qlcafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Qlcafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Qlcafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Qlcafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Qlcafe] SET  MULTI_USER 
GO
ALTER DATABASE [Qlcafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Qlcafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Qlcafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Qlcafe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Qlcafe]
GO
/****** Object:  UserDefinedFunction [dbo].[fun_nextanh]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_nextanh](@lastmonan VARCHAR(6), @prefixmonan VARCHAR(5), @sizeonan INT)
RETURNS VARCHAR(6)
AS	
BEGIN
	IF	(@lastmonan = '')
		SET @lastmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	DECLARE @num_lastmonan INT, @nextmonan VARCHAR(6)
	SET @lastmonan = LTRIM(RTRIM(@lastmonan))
	SET @num_lastmonan =REPLACE(@lastmonan,@prefixmonan,'') + 1
	SET @sizeonan = @sizeonan - LEN(@prefixmonan)
	SET @nextmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	SET @nextmonan = @prefixmonan + RIGHT(REPLICATE(0,@sizeonan) + CONVERT(VARCHAR(MAX),@num_lastmonan),@sizeonan)
	RETURN @nextmonan
END


GO
/****** Object:  UserDefinedFunction [dbo].[fun_nextbaohiem]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_nextbaohiem](@lastmonan VARCHAR(5), @prefixmonan varchar(3), @sizeonan INT)
RETURNS VARCHAR(5)
AS	
BEGIN
	IF	(@lastmonan = '')
		SET @lastmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	DECLARE @num_lastmonan INT, @nextmonan VARCHAR(5)
	SET @lastmonan = LTRIM(RTRIM(@lastmonan))
	SET @num_lastmonan =REPLACE(@lastmonan,@prefixmonan,'') + 1
	SET @sizeonan = @sizeonan - LEN(@prefixmonan)
	SET @nextmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	SET @nextmonan = @prefixmonan + RIGHT(REPLICATE(0,@sizeonan) + CONVERT(VARCHAR(MAX),@num_lastmonan),@sizeonan)
	RETURN @nextmonan
END


GO
/****** Object:  UserDefinedFunction [dbo].[fun_nextchucvu]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_nextchucvu](@lastmonan VARCHAR(5), @prefixmonan varchar(3), @sizeonan INT)
RETURNS VARCHAR(5)
AS	
BEGIN
	IF	(@lastmonan = '')
		SET @lastmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	DECLARE @num_lastmonan INT, @nextmonan VARCHAR(5)
	SET @lastmonan = LTRIM(RTRIM(@lastmonan))
	SET @num_lastmonan =REPLACE(@lastmonan,@prefixmonan,'') + 1
	SET @sizeonan = @sizeonan - LEN(@prefixmonan)
	SET @nextmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	SET @nextmonan = @prefixmonan + RIGHT(REPLICATE(0,@sizeonan) + CONVERT(VARCHAR(MAX),@num_lastmonan),@sizeonan)
	RETURN @nextmonan
END


GO
/****** Object:  UserDefinedFunction [dbo].[fun_nexthoso]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_nexthoso](@lastmonan VARCHAR(7), @prefixmonan varchar(5), @sizeonan INT)
RETURNS VARCHAR(7)
AS	
BEGIN
	IF	(@lastmonan = '')
		SET @lastmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	DECLARE @num_lastmonan INT, @nextmonan VARCHAR(7)
	SET @lastmonan = LTRIM(RTRIM(@lastmonan))
	SET @num_lastmonan =REPLACE(@lastmonan,@prefixmonan,'') + 1
	SET @sizeonan = @sizeonan - LEN(@prefixmonan)
	SET @nextmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	SET @nextmonan = @prefixmonan + RIGHT(REPLICATE(0,@sizeonan) + CONVERT(VARCHAR(MAX),@num_lastmonan),@sizeonan)
	RETURN @nextmonan
END


GO
/****** Object:  UserDefinedFunction [dbo].[fun_nextkhachhang]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_nextkhachhang](@lastmonan VARCHAR(7), @prefixmonan varchar(5), @sizeonan INT)
RETURNS VARCHAR(7)
AS	
BEGIN
	IF	(@lastmonan = '')
		SET @lastmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	DECLARE @num_lastmonan INT, @nextmonan VARCHAR(7)
	SET @lastmonan = LTRIM(RTRIM(@lastmonan))
	SET @num_lastmonan =REPLACE(@lastmonan,@prefixmonan,'') + 1
	SET @sizeonan = @sizeonan - LEN(@prefixmonan)
	SET @nextmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	SET @nextmonan = @prefixmonan + RIGHT(REPLICATE(0,@sizeonan) + CONVERT(VARCHAR(MAX),@num_lastmonan),@sizeonan)
	RETURN @nextmonan
END


GO
/****** Object:  UserDefinedFunction [dbo].[fun_nextnhanvien]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_nextnhanvien](@lastmonan VARCHAR(5), @prefixmonan varchar(3), @sizeonan INT)
RETURNS VARCHAR(5)
AS	
BEGIN
	IF	(@lastmonan = '')
		SET @lastmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	DECLARE @num_lastmonan INT, @nextmonan VARCHAR(5)
	SET @lastmonan = LTRIM(RTRIM(@lastmonan))
	SET @num_lastmonan =REPLACE(@lastmonan,@prefixmonan,'') + 1
	SET @sizeonan = @sizeonan - LEN(@prefixmonan)
	SET @nextmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	SET @nextmonan = @prefixmonan + RIGHT(REPLICATE(0,@sizeonan) + CONVERT(VARCHAR(MAX),@num_lastmonan),@sizeonan)
	RETURN @nextmonan
END


GO
/****** Object:  UserDefinedFunction [dbo].[fun_nextphieumua]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_nextphieumua](@lastmonan VARCHAR(7), @prefixmonan varchar(5), @sizeonan INT)
RETURNS VARCHAR(7)
AS	
BEGIN
	IF	(@lastmonan = '')
		SET @lastmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	DECLARE @num_lastmonan INT, @nextmonan VARCHAR(7)
	SET @lastmonan = LTRIM(RTRIM(@lastmonan))
	SET @num_lastmonan =REPLACE(@lastmonan,@prefixmonan,'') + 1
	SET @sizeonan = @sizeonan - LEN(@prefixmonan)
	SET @nextmonan = @prefixmonan + REPLICATE(0,@sizeonan - LEN(@prefixmonan))
	SET @nextmonan = @prefixmonan + RIGHT(REPLICATE(0,@sizeonan) + CONVERT(VARCHAR(MAX),@num_lastmonan),@sizeonan)
	RETURN @nextmonan
END


GO
/****** Object:  Table [dbo].[Anh]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anh](
	[MaAnh] [nvarchar](50) NOT NULL,
	[Path] [nvarchar](250) NULL,
	[MaHoSo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Anh] PRIMARY KEY CLUSTERED 
(
	[MaAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ban]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [nvarchar](50) NOT NULL,
	[TenBan] [nvarchar](50) NOT NULL,
	[SoGhe] [bigint] NOT NULL,
 CONSTRAINT [PK_Ban] PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BAOHIEM]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAOHIEM](
	[MaBaoHiem] [nvarchar](50) NOT NULL,
	[LoaiBaoHiem] [nvarchar](50) NULL,
	[MoTa] [nvarchar](1000) NULL,
	[Anh] [nvarchar](250) NULL,
	[MucDenBu] [bigint] NULL,
 CONSTRAINT [PK_BAOHIEM] PRIMARY KEY CLUSTERED 
(
	[MaBaoHiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaCtHd] [bigint] NOT NULL,
	[MaHang] [nvarchar](50) NULL,
	[SoLuongMua] [bigint] NOT NULL,
	[ThanhTien] [bigint] NOT NULL,
	[MaHD] [bigint] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaCtHd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHUCVU]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUCVU](
	[MaChucVu] [nvarchar](50) NOT NULL,
	[TenChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHUCVU] PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hang]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hang](
	[MaHang] [nvarchar](50) NOT NULL,
	[TenHang] [nvarchar](50) NOT NULL,
	[Gia] [bigint] NOT NULL,
	[SoLuong] [bigint] NOT NULL,
	[DonViTinh] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Hang] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [bigint] NOT NULL,
	[MaNv] [nvarchar](50) NOT NULL,
	[MaBan] [nvarchar](50) NOT NULL,
	[NgayBan] [datetime] NULL,
	[DaTraTien] [bit] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOSOTAINAN]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOSOTAINAN](
	[MaHoSo] [nvarchar](50) NOT NULL,
	[MaNhanVien] [nvarchar](50) NULL,
	[MaKhachHang] [nvarchar](50) NULL,
	[BienSo] [nvarchar](50) NULL,
	[NgayXayRaTaiNan] [date] NULL,
	[TenTaiXe] [nvarchar](50) NULL,
	[MoTaThietHai] [nvarchar](250) NULL,
	[CoBangLaiChua] [nvarchar](50) NULL,
	[DiaDiemTaiNan] [nvarchar](50) NULL,
	[MucDoThietHai] [int] NULL,
	[MucDoDenBu] [int] NULL,
	[LyDo] [nvarchar](250) NULL,
	[XacNhanDenBu] [nvarchar](50) NULL,
	[TrangThaiXacThuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_HOSOTAINAN] PRIMARY KEY CLUSTERED 
(
	[MaHoSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHanVien]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHanVien](
	[Manv] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[Manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUMUABAOHIEM]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUMUABAOHIEM](
	[MaPhieuBaoHiem] [nvarchar](50) NOT NULL,
	[MaKhachHang] [nvarchar](50) NULL,
	[MaNhanVien] [nvarchar](50) NULL,
	[BienSo] [nchar](10) NULL,
	[NgayMua] [date] NULL,
	[TinhTrangThanhToan] [nvarchar](50) NULL,
	[MaBaoHiem] [nvarchar](50) NULL,
	[PhuongThucThanhToan] [nvarchar](50) NULL,
	[SoChoNgoi] [nvarchar](50) NULL,
	[ThoiHan] [bigint] NULL,
	[SoTienThucThu] [bigint] NULL,
	[SoTienDaThanhToan] [bigint] NULL,
 CONSTRAINT [PK_PHIEUMUABAOHIEM] PRIMARY KEY CLUSTERED 
(
	[MaPhieuBaoHiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [nvarchar](50) NULL,
	[MaNhanVien] [nvarchar](50) NULL,
	[MaKhachHang] [nvarchar](50) NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[XE]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XE](
	[BienSo] [nvarchar](50) NOT NULL,
	[LoaiXe] [nvarchar](50) NULL,
	[MaKhachHang] [nvarchar](50) NULL,
 CONSTRAINT [PK_XE] PRIMARY KEY CLUSTERED 
(
	[BienSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[BanChuaThanhToan]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BanChuaThanhToan]
AS
SELECT        dbo.Ban.MaBan, dbo.Ban.TenBan, dbo.Ban.SoGhe, dbo.HoaDon.DaTraTien
FROM            dbo.Ban INNER JOIN
                         dbo.HoaDon ON dbo.Ban.MaBan = dbo.HoaDon.MaBan
WHERE        (dbo.HoaDon.DaTraTien = 0)

GO
/****** Object:  View [dbo].[BanTrong]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BanTrong]
AS
SELECT        MaBan, TenBan, SoGhe
FROM            dbo.Ban
WHERE        (MaBan NOT IN
                             (SELECT DISTINCT Ban_1.MaBan
                               FROM            dbo.Ban AS Ban_1 INNER JOIN
                                                         dbo.HoaDon ON Ban_1.MaBan = dbo.HoaDon.MaBan INNER JOIN
                                                         dbo.ChiTietHoaDon ON dbo.HoaDon.MaHD = dbo.ChiTietHoaDon.MaHD
                               WHERE        (Ban_1.MaBan IN
                                                             (SELECT        MaBan
                                                               FROM            dbo.HoaDon AS HoaDon_1)) AND (dbo.HoaDon.MaHD IN
                                                             (SELECT        MaHD
                                                               FROM            dbo.ChiTietHoaDon AS ChiTietHoaDon_1))))

GO
/****** Object:  View [dbo].[HoaDonBanHang]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HoaDonBanHang]
AS
SELECT        dbo.Hang.TenHang, dbo.Hang.Gia, dbo.ChiTietHoaDon.SoLuongMua, dbo.ChiTietHoaDon.ThanhTien, dbo.Ban.MaBan, dbo.HoaDon.DaTraTien
FROM            dbo.Hang INNER JOIN
                         dbo.ChiTietHoaDon ON dbo.Hang.MaHang = dbo.ChiTietHoaDon.MaHang INNER JOIN
                         dbo.HoaDon ON dbo.ChiTietHoaDon.MaHD = dbo.HoaDon.MaHD INNER JOIN
                         dbo.Ban ON dbo.HoaDon.MaBan = dbo.Ban.MaBan
WHERE        (dbo.HoaDon.DaTraTien = 0)

GO
/****** Object:  View [dbo].[Qtk]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Qtk]
AS
SELECT        dbo.Hang.TenHang, dbo.Hang.Gia, dbo.ChiTietHoaDon.SoLuongMua, dbo.ChiTietHoaDon.ThanhTien, dbo.HoaDon.NgayBan
FROM            dbo.Hang INNER JOIN
                         dbo.ChiTietHoaDon ON dbo.Hang.MaHang = dbo.ChiTietHoaDon.MaHang INNER JOIN
                         dbo.HoaDon ON dbo.ChiTietHoaDon.MaHD = dbo.HoaDon.MaHD

GO
/****** Object:  View [dbo].[ThongKeHoaDon]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ThongKeHoaDon]
AS
SELECT        dbo.Ban.MaBan, dbo.Ban.TenBan, dbo.Hang.TenHang, dbo.Hang.Gia, dbo.ChiTietHoaDon.SoLuongMua, dbo.ChiTietHoaDon.ThanhTien, dbo.HoaDon.DaTraTien
FROM            dbo.Hang INNER JOIN
                         dbo.ChiTietHoaDon ON dbo.Hang.MaHang = dbo.ChiTietHoaDon.MaHang INNER JOIN
                         dbo.HoaDon ON dbo.ChiTietHoaDon.MaHD = dbo.HoaDon.MaHD INNER JOIN
                         dbo.Ban ON dbo.HoaDon.MaBan = dbo.Ban.MaBan

GO
/****** Object:  View [dbo].[VHienThiHoaDon]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VHienThiHoaDon]
AS
SELECT        dbo.ChiTietHoaDon.MaCtHd, dbo.Hang.TenHang, dbo.Hang.Gia, dbo.ChiTietHoaDon.SoLuongMua, dbo.ChiTietHoaDon.ThanhTien, dbo.Ban.MaBan
FROM            dbo.Hang INNER JOIN
                         dbo.ChiTietHoaDon ON dbo.Hang.MaHang = dbo.ChiTietHoaDon.MaHang INNER JOIN
                         dbo.HoaDon ON dbo.ChiTietHoaDon.MaHD = dbo.HoaDon.MaHD INNER JOIN
                         dbo.Ban ON dbo.HoaDon.MaBan = dbo.Ban.MaBan INNER JOIN
                         dbo.NHanVien ON dbo.HoaDon.MaNv = dbo.NHanVien.Manv

GO
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe]) VALUES (N'1', N'Bàn số 1', 5)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe]) VALUES (N'2', N'Bàn số 2', 4)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe]) VALUES (N'3', N'Bàn số 3', 7)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe]) VALUES (N'4', N'Bàn số 4', 8)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe]) VALUES (N'5', N'Bàn số 5', 10)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe]) VALUES (N'6', N'Bàn số 6', 6)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (1, N'cc', 2, 22000, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (2, N'rv', 1, 50000, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (3, N'sd', 4, 40000, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (7, N'chao', 5, 50000, 3)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (13, N'bia', 1, 7500, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (14, N'bia', 14, 105000, 3)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (15, N'fs', 4, 32000, 4)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (16, N'chao', 1, 10000, 4)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (17, N'bia', 12, 90000, 4)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (18, N'ps', 6, 6000, 5)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (19, N'bia', 4, 30000, 6)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (20, N'fd', 1, 6000, 6)
INSERT [dbo].[ChiTietHoaDon] ([MaCtHd], [MaHang], [SoLuongMua], [ThanhTien], [MaHD]) VALUES (21, N'rv', 6, 300000, 6)
INSERT [dbo].[Hang] ([MaHang], [TenHang], [Gia], [SoLuong], [DonViTinh]) VALUES (N'bia', N'Bia Hua Đa', 7500, 13, N'chai')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [Gia], [SoLuong], [DonViTinh]) VALUES (N'cc', N'coca', 11000, 6, N'chai')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [Gia], [SoLuong], [DonViTinh]) VALUES (N'chao', N'Cháo', 10000, 17, N'tô')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [Gia], [SoLuong], [DonViTinh]) VALUES (N'fd', N'Phê đen', 6000, 257, N'ly')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [Gia], [SoLuong], [DonViTinh]) VALUES (N'fs', N'Phê sửa', 8000, 211, N'ly')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [Gia], [SoLuong], [DonViTinh]) VALUES (N'ps', N'Pepsi', 1000, 880, N'chai')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [Gia], [SoLuong], [DonViTinh]) VALUES (N'rv', N'Rượi Vang', 50000, 29, N'chai')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [Gia], [SoLuong], [DonViTinh]) VALUES (N'sd', N'Sâm dứa', 10000, 27, N'ly')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [Gia], [SoLuong], [DonViTinh]) VALUES (N'x', N'Xôi', 5000, 65, N'hộp')
INSERT [dbo].[HoaDon] ([MaHD], [MaNv], [MaBan], [NgayBan], [DaTraTien]) VALUES (1, N'admin', N'1', CAST(N'2017-12-06 10:47:37.637' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHD], [MaNv], [MaBan], [NgayBan], [DaTraTien]) VALUES (3, N'admin', N'4', CAST(N'2017-12-06 10:48:20.620' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHD], [MaNv], [MaBan], [NgayBan], [DaTraTien]) VALUES (4, N'admin', N'6', CAST(N'2018-01-03 19:31:56.067' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaNv], [MaBan], [NgayBan], [DaTraTien]) VALUES (5, N'admin', N'2', CAST(N'2018-01-04 00:29:55.490' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaNv], [MaBan], [NgayBan], [DaTraTien]) VALUES (6, N'admin', N'5', CAST(N'2018-01-11 11:14:29.807' AS DateTime), 1)
INSERT [dbo].[NHanVien] ([Manv], [HoTen], [DiaChi], [MatKhau], [Quyen]) VALUES (N'admin', N'Nguyễn Đăng Tỉnh', N'Quảng Nam', N'C8qiotBAbGg=', N'admin')
INSERT [dbo].[NHanVien] ([Manv], [HoTen], [DiaChi], [MatKhau], [Quyen]) VALUES (N'nv1', N'Lê Thanh Minh', N'Huế', N'nJWttVYrEbw=', N'staff')
INSERT [dbo].[NHanVien] ([Manv], [HoTen], [DiaChi], [MatKhau], [Quyen]) VALUES (N'nv2', N'Trần Văn Bình', N'Quảng Trị', N'nJWttVYrEbw=', N'staff')
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_Hang] FOREIGN KEY([MaHang])
REFERENCES [dbo].[Hang] ([MaHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_Hang]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Ban] FOREIGN KEY([MaBan])
REFERENCES [dbo].[Ban] ([MaBan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Ban]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaNv])
REFERENCES [dbo].[NHanVien] ([Manv])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[PHIEUMUABAOHIEM]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUMUABAOHIEM_BAOHIEM] FOREIGN KEY([MaBaoHiem])
REFERENCES [dbo].[BAOHIEM] ([MaBaoHiem])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PHIEUMUABAOHIEM] CHECK CONSTRAINT [FK_PHIEUMUABAOHIEM_BAOHIEM]
GO
/****** Object:  Trigger [dbo].[tg_nextanh]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_nextanh] ON [dbo].[Anh]
FOR INSERT
AS	
BEGIN
	DECLARE @lastanhtg VARCHAR(6)
	SET @lastanhtg = (SELECT TOP	1	dbo.Anh.MaAnh FROM dbo.Anh ORDER BY MaAnh DESC)
	UPDATE dbo.Anh SET MaAnh = dbo.fun_nextanh(@lastanhtg,'A',6) WHERE MaAnh = ''
END


GO
/****** Object:  Trigger [dbo].[tg_nextbaohiem]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_nextbaohiem] ON [dbo].[BAOHIEM]
FOR INSERT
AS	
BEGIN
	DECLARE @lastbaohiem VARCHAR(5)
	SET @lastbaohiem = (SELECT TOP	1	dbo.BAOHIEM.MaBaoHiem FROM dbo.BAOHIEM ORDER BY MaBaoHiem DESC)
	UPDATE dbo.BAOHIEM SET MaBaoHiem = dbo.fun_nextbaohiem(@lastbaohiem,'BH',5) WHERE MaBaoHiem = ''
END


GO
/****** Object:  Trigger [dbo].[tg_nextchucvu1]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_nextchucvu1] ON [dbo].[CHUCVU]
FOR INSERT
AS	
BEGIN
	DECLARE @lastchucvu VARCHAR(5)
	SET @lastchucvu = (SELECT TOP	1	dbo.CHUCVU.MaChucVu FROM dbo.CHUCVU ORDER BY MaChucVu DESC)
	UPDATE dbo.CHUCVU SET MaChucVu = dbo.fun_nextchucvu(@lastchucvu,'CV',5) WHERE MaChucVu = ''
END	


GO
/****** Object:  Trigger [dbo].[tg_nexthoso]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_nexthoso] ON [dbo].[HOSOTAINAN]
FOR INSERT
AS	
BEGIN
	DECLARE @lasthoso VARCHAR(7)
	SET @lasthoso = (SELECT TOP	1	dbo.HOSOTAINAN.MaHoSo FROM dbo.HOSOTAINAN ORDER BY MaHoSo DESC)
	UPDATE dbo.HOSOTAINAN SET MaHoSo = dbo.fun_nexthoso(@lasthoso,'HS',7) WHERE MaHoSo = ''
END


GO
/****** Object:  Trigger [dbo].[tg_nextphieumua]    Script Date: 20/3/2018 9:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_nextphieumua] ON [dbo].[PHIEUMUABAOHIEM]
FOR INSERT
AS	
BEGIN
	DECLARE @lastphieumua VARCHAR(7)
	SET @lastphieumua = (SELECT TOP	1	dbo.PHIEUMUABAOHIEM.MaPhieuBaoHiem FROM dbo.PHIEUMUABAOHIEM ORDER BY MaPhieuBaoHiem DESC)
	UPDATE dbo.PHIEUMUABAOHIEM SET MaPhieuBaoHiem = dbo.fun_nextphieumua(@lastphieumua,'MP',7) WHERE MaPhieuBaoHiem = ''
END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[24] 2[9] 3) )"
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
         Begin Table = "Ban"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 7
               Left = 373
               Bottom = 137
               Right = 543
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BanChuaThanhToan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BanChuaThanhToan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[24] 2[10] 3) )"
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
         Begin Table = "Ban"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BanTrong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BanTrong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[29] 4[24] 2[15] 3) )"
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
         Begin Table = "Ban"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Hang"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
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
   End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HoaDonBanHang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HoaDonBanHang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HoaDonBanHang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[29] 4[32] 2[20] 3) )"
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
         Begin Table = "Hang"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 135
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Qtk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Qtk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[31] 2[15] 3) )"
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
         Begin Table = "Ban"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Hang"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 58
               Left = 410
               Bottom = 257
               Right = 580
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
   End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeHoaDon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
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
         Configuration = "(H (1[54] 4[34] 2[8] 3) )"
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
         Begin Table = "Hang"
            Begin Extent = 
               Top = 123
               Left = 34
               Bottom = 252
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 0
               Left = 413
               Bottom = 129
               Right = 583
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 141
               Left = 241
               Bottom = 270
               Right = 411
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Ban"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 118
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NHanVien"
            Begin Extent = 
               Top = 134
               Left = 459
               Bottom = 284
               Right = 629
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
         T' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VHienThiHoaDon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'able = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1395
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VHienThiHoaDon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VHienThiHoaDon'
GO
USE [master]
GO
ALTER DATABASE [Qlcafe] SET  READ_WRITE 
GO
