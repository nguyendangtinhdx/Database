USE [master]
GO
/****** Object:  Database [QL_CTBH]    Script Date: 20/3/2018 9:59:24 AM ******/
CREATE DATABASE [QL_CTBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_CTBH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_CTBH.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_CTBH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_CTBH_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_CTBH] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_CTBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_CTBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_CTBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_CTBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_CTBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_CTBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_CTBH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_CTBH] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_CTBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_CTBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_CTBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_CTBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_CTBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_CTBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_CTBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_CTBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_CTBH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_CTBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_CTBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_CTBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_CTBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_CTBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_CTBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_CTBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_CTBH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_CTBH] SET  MULTI_USER 
GO
ALTER DATABASE [QL_CTBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_CTBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_CTBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_CTBH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QL_CTBH]
GO
/****** Object:  UserDefinedFunction [dbo].[fun_nextanh]    Script Date: 20/3/2018 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_nextanh](@lastmonan VARCHAR(6), @prefixmonan varchar(5), @sizeonan INT)
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
/****** Object:  UserDefinedFunction [dbo].[fun_nextbaohiem]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fun_nextchucvu]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fun_nexthoso]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fun_nextkhachhang]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fun_nextnhanvien]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fun_nextphieumua]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  Table [dbo].[Anh]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  Table [dbo].[BAOHIEM]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  Table [dbo].[CHUCVU]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  Table [dbo].[HOSOTAINAN]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 20/3/2018 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKhachHang] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[SoTaiKhoan] [nvarchar](50) NULL,
	[NganHang] [nvarchar](50) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 20/3/2018 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNhanVien] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[CMND] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SoTaiKhoan] [nvarchar](50) NULL,
	[NganHang] [nvarchar](250) NULL,
	[MaChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUMUABAOHIEM]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  Table [dbo].[XE]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  View [dbo].[DanhSachMuaBaoHiem]    Script Date: 20/3/2018 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DanhSachMuaBaoHiem]
AS
SELECT        dbo.PHIEUMUABAOHIEM.MaPhieuBaoHiem, dbo.KHACHHANG.MaKhachHang, dbo.KHACHHANG.HoTen, dbo.KHACHHANG.DiaChi, dbo.KHACHHANG.SoDienThoai, dbo.PHIEUMUABAOHIEM.BienSo, dbo.BAOHIEM.MaBaoHiem, 
                         dbo.BAOHIEM.LoaiBaoHiem, dbo.BAOHIEM.Anh, dbo.BAOHIEM.MucDenBu, dbo.PHIEUMUABAOHIEM.ThoiHan, dbo.PHIEUMUABAOHIEM.SoChoNgoi, dbo.PHIEUMUABAOHIEM.NgayMua, 
                         dbo.PHIEUMUABAOHIEM.SoTienThucThu, dbo.PHIEUMUABAOHIEM.PhuongThucThanhToan, dbo.KHACHHANG.SoTaiKhoan, dbo.KHACHHANG.NganHang, dbo.PHIEUMUABAOHIEM.SoTienDaThanhToan, 
                         dbo.NHANVIEN.MaNhanVien, dbo.PHIEUMUABAOHIEM.TinhTrangThanhToan
FROM            dbo.BAOHIEM INNER JOIN
                         dbo.PHIEUMUABAOHIEM ON dbo.BAOHIEM.MaBaoHiem = dbo.PHIEUMUABAOHIEM.MaBaoHiem INNER JOIN
                         dbo.KHACHHANG ON dbo.PHIEUMUABAOHIEM.MaKhachHang = dbo.KHACHHANG.MaKhachHang LEFT OUTER JOIN
                         dbo.NHANVIEN ON dbo.PHIEUMUABAOHIEM.MaNhanVien = dbo.NHANVIEN.MaNhanVien


GO
INSERT [dbo].[BAOHIEM] ([MaBaoHiem], [LoaiBaoHiem], [MoTa], [Anh], [MucDenBu]) VALUES (N'BH001', N'BẢO HIỂM TNDS Ô TÔ', N'1. Chủ xe cơ giới phải tham gia bảo hiểm bắt buộc trách nhiệm dân sự của chủ xe cơ giới theo quy định tại Nghị định về chế độ bảo hiểm bắt buộc trách nhiệm dân sự của chủ xe cơ giới và Quy tắc, điều khoản, biểu phí do Bộ Tài chính ban hành.
</p><p>2. Khi chủ xe tham gia bảo hiểm theo quy định, sẽ được bồi thường theo các trường hợp sau:
a. Thiệt hại ngoài hợp đồng về thân thể, tính mạng và tài sản đối với bên thứ ba do xe cơ giới gây ra.
b. Thiệt hại về thân thể và tính mạng của hành khách theo hợp đồng vận chuyển hành khách do xe cơ giới gây ra.
3. Ngoài việc tham gia hợp đồng bảo hiểm bắt buộc trách nhiệm dân sự, chủ xe cơ giới có thể thỏa thuận với Bảo Minh để tham gia hợp đồng bảo hiểm trách nhiệm dân sự tự nguyện vượt mức bắt buộc..
', N'oto.jpeg', 5000000)
INSERT [dbo].[BAOHIEM] ([MaBaoHiem], [LoaiBaoHiem], [MoTa], [Anh], [MucDenBu]) VALUES (N'BH002', N'BẢO HIỂM TNDS XE MÁY', N'1 Thiệt hại về thân thể, tính mạng và tài sản đối với bên thứ ba do xe cơ giới gây ra.</p><p>
2 Thiệt hại về thân thể và tính mạng của hành khách theo hợp đồng vận chuyển hành khách do xe cơ giới gây ra.', N'moto2.jpg', 4500000)
INSERT [dbo].[BAOHIEM] ([MaBaoHiem], [LoaiBaoHiem], [MoTa], [Anh], [MucDenBu]) VALUES (N'BH003', N'BẢO HIỂM VẬT CHẤT Ô TÔ', N'Bồi thường cho chủ xe những thiệt hại vật chất xe xảy ra do những tai nạn bất ngờ, ngoài sự kiểm soát của chủ xe, lái xe trong các trường hợp:</p><p>
1 Bị tai nạn do đâm va, lật đổ.</p><p>
2 Cháy nổ, bão lụt, sét đánh.</p><p>
3 Mất cắp toàn bộ và các rủi ro bất ngờ khác.</p><p>
4 Ngoài ra thanh toán những chi phí cần thiết và hợp lý cho việc ngăn ngừa, hạn chế tổn thất, trục vớt, kéo xe đến nơi sửa chữa, giám định tổn thất.', N'oto-vatchat.jpg', 4800000)
INSERT [dbo].[BAOHIEM] ([MaBaoHiem], [LoaiBaoHiem], [MoTa], [Anh], [MucDenBu]) VALUES (N'BH004', N'BẢO HIỂM VẬT CHẤT XE MÁY', N'Bồi thường cho chủ xe những thiệt hại vật chất xe xảy ra do những tai nạn bất ngờ, ngoài sự kiểm soát của chủ xe, lái xe trong các trường hợp:</p><p>
1 Bị tai nạn do đâm va, lật đổ.</p><p>
2 Cháy nổ, bão lụt, sét đánh.</p><p>
3 Mất cắp toàn bộ và các rủi ro bất ngờ khác.</p><p>
4 Ngoài ra thanh toán những chi phí cần thiết và hợp lý cho việc ngăn ngừa, hạn chế tổn thất, trục vớt, kéo xe đến nơi sửa chữa, giám định tổn thất.', N'moto-vatchat.jpg', 6200000)
INSERT [dbo].[CHUCVU] ([MaChucVu], [TenChucVu]) VALUES (N'CV001', N'Giám Đốc')
INSERT [dbo].[CHUCVU] ([MaChucVu], [TenChucVu]) VALUES (N'CV002', N'Nhân Viên')
INSERT [dbo].[HOSOTAINAN] ([MaHoSo], [MaNhanVien], [MaKhachHang], [BienSo], [NgayXayRaTaiNan], [TenTaiXe], [MoTaThietHai], [CoBangLaiChua], [DiaDiemTaiNan], [MucDoThietHai], [MucDoDenBu], [LyDo], [XacNhanDenBu], [TrangThaiXacThuc]) VALUES (N'HS00001', NULL, N'KH00005', N'75-H154675 ', CAST(N'2018-03-14' AS Date), N'Nguyễn Văn Anh', N'Xe bị gãy sườn, hư lốp', N'Có', N'Đà Nẵng', NULL, NULL, NULL, NULL, N'Giám Định')
INSERT [dbo].[HOSOTAINAN] ([MaHoSo], [MaNhanVien], [MaKhachHang], [BienSo], [NgayXayRaTaiNan], [TenTaiXe], [MoTaThietHai], [CoBangLaiChua], [DiaDiemTaiNan], [MucDoThietHai], [MucDoDenBu], [LyDo], [XacNhanDenBu], [TrangThaiXacThuc]) VALUES (N'HS00002', N'NV002', N'KH00004', N'92-C174203', CAST(N'2018-03-01' AS Date), N'Trần Thị Thanh Tuyến', N'Trầy xướt,  gãy kính chiều hậu,
Hư đèn sau xe', N'Có', N'QUảng Nam', 40, 40, N'Không', N'Có', N'Đã Xác Thực')
INSERT [dbo].[HOSOTAINAN] ([MaHoSo], [MaNhanVien], [MaKhachHang], [BienSo], [NgayXayRaTaiNan], [TenTaiXe], [MoTaThietHai], [CoBangLaiChua], [DiaDiemTaiNan], [MucDoThietHai], [MucDoDenBu], [LyDo], [XacNhanDenBu], [TrangThaiXacThuc]) VALUES (N'HS00003', NULL, N'KH00003', N'43-H156237', CAST(N'2018-03-08' AS Date), N'Nguyễn Thanh Bình', N'Hư hỏng nặng', N'Chưa', N'Quảng Nam', NULL, NULL, NULL, NULL, N'Giám Định')
INSERT [dbo].[HOSOTAINAN] ([MaHoSo], [MaNhanVien], [MaKhachHang], [BienSo], [NgayXayRaTaiNan], [TenTaiXe], [MoTaThietHai], [CoBangLaiChua], [DiaDiemTaiNan], [MucDoThietHai], [MucDoDenBu], [LyDo], [XacNhanDenBu], [TrangThaiXacThuc]) VALUES (N'HS00004', N'NV003', N'KH00001', N'43-C156897', CAST(N'2017-12-12' AS Date), N'Nguyễn Lương Phú', N'gãy kính', N'Có', N'Quảng Bình', NULL, NULL, NULL, NULL, N'Xác Thực')
INSERT [dbo].[HOSOTAINAN] ([MaHoSo], [MaNhanVien], [MaKhachHang], [BienSo], [NgayXayRaTaiNan], [TenTaiXe], [MoTaThietHai], [CoBangLaiChua], [DiaDiemTaiNan], [MucDoThietHai], [MucDoDenBu], [LyDo], [XacNhanDenBu], [TrangThaiXacThuc]) VALUES (N'HS00005', NULL, N'KH00006', N'23K-2133  ', CAST(N'2017-04-21' AS Date), N'Văn Bá Khương', N'Gãnh vành xe', N'Có', N'Hà Nội', NULL, NULL, NULL, NULL, N'Giám Định')
INSERT [dbo].[HOSOTAINAN] ([MaHoSo], [MaNhanVien], [MaKhachHang], [BienSo], [NgayXayRaTaiNan], [TenTaiXe], [MoTaThietHai], [CoBangLaiChua], [DiaDiemTaiNan], [MucDoThietHai], [MucDoDenBu], [LyDo], [XacNhanDenBu], [TrangThaiXacThuc]) VALUES (N'HS00006', N'NV003', N'KH00006', N'23K-2133  ', CAST(N'2017-03-12' AS Date), N'Văn Bá Khương', N'Gãy vành xe
', N'Có', N'Hà Nội', 10, 10, N'Không', N'Có', N'Đã Xác Thực')
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [SoTaiKhoan], [NganHang]) VALUES (N'KH00001', N'Nguyễn Lương Phú', N'55 Điện Biên Phủ', N'01263659486', NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [SoTaiKhoan], [NganHang]) VALUES (N'KH00003', N'Đoàn Thị Thúy', N'Quảng Ngãi', N'0905211983', NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [SoTaiKhoan], [NganHang]) VALUES (N'KH00004', N'Trần Thị Thanh Tuyền', N'Đà Nẵng', N'01282394862', NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [SoTaiKhoan], [NganHang]) VALUES (N'KH00005', N'Phạm Thị Thúy', N'Quảng Ngãi', N'01295684757', NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [SoTaiKhoan], [NganHang]) VALUES (N'KH00006', N'Nguyễn Đăng Tỉnh', N'Quảng Nam', N'01263659419', N'9704158403341881', N'Sacombank')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'admin', N'Nguyễn Lương Phú', CAST(N'1995-11-18' AS Date), N'Nam', N'0972529160', N'nguyenluong@gmail.com', N'192052494', N'Vinh Thanh', N'060016090', N'VietinBank', N'CV001')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV001', N'Bùi Tiến Dũng', CAST(N'1994-02-23' AS Date), N'Nam', N'0972529160', N'buitiendung@gmail.com', N'192052494', N'55 Điện Biên Phủ Huế', N'0160016090', N'VietinBank', N'CV002')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV002', N'Nguyễn Đăng Tỉnh', CAST(N'1995-03-10' AS Date), N'Nam', N'01234567893', N'nguyendangtinh@gmail.com', N'123456789', N'Quảng Nam', N'123456798', N'DongA', N'CV002')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV003', N'Trần Thị Thanh Tuyền', CAST(N'1996-10-03' AS Date), N'Nữ', N'0972529160', N'thanhtuyen@gmail.com', N'206214589', N'Quảng Nam', N'132132132', N'DongA', N'CV002')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV004', N'Phạm Thị Thúy', CAST(N'1996-12-12' AS Date), N'Nữ', N'01225556547', N'thuypham@gmail.com', N'987789987', N'Quảng Ngãi', N'132132132', N'VietTinBank', N'CV002')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV005', N'Nguyễn Văn Anh', CAST(N'1993-12-01' AS Date), N'Nam', N'01234657812', N'anhtran@gmail.com', N'987654789', N'Nghệ An', N'5435436544', N'DongA', N'CV002')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV006', N'Nguyễn Văn Bách', CAST(N'1992-03-06' AS Date), N'Nam', N'01223659484', N'bachnguyen@gmail.com', N'325412632', N'Hà Tĩnh', N'42343546547', N'DongA', N'CV002')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV007', N'Đoàn Thị Trang', CAST(N'1996-07-06' AS Date), N'Nữ', N'0972529160', N'thuydoan@gmail.com', N'678675342', N'Thanh Hóa', N'2568767343', N'VietcomBank', N'CV002')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV008', N'Đỗ Trường Sơn', CAST(N'1995-05-05' AS Date), N'Nam', N'01664574708', N'sontruong@gmail.com', N'543295146', N'Hà Nội', N'132465798', N'VietcomBank', N'CV002')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV009', N'Nguyễn Thị Phu', CAST(N'2000-12-12' AS Date), N'Nữ', N'01234567893', N'thitinh@gmail.com', N'963258741', N'Quảng Trị', N'9701465465', N'TPBank', N'CV002')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV010', N'Phạm Thị Thanh', CAST(N'1994-09-05' AS Date), N'Nữ', N'01282356841', N'phamthithanh@gmail.com', N'205235689', N'Đà Lạt', N'2865974569', N'VietTinBank', N'CV002')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV011', N'Nguyễn Văn Hùng', CAST(N'1990-04-28' AS Date), N'Nam', N'01202606837', N'hungnguyen@gmail.com', N'021546986', N'Đà Nẵng', N'124563789', N'DongA', N'CV002')
INSERT [dbo].[NHANVIEN] ([MaNhanVien], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [CMND], [DiaChi], [SoTaiKhoan], [NganHang], [MaChucVu]) VALUES (N'NV012', N'Đoàn Thanh Quan', CAST(N'1996-06-14' AS Date), N'Nam', N'01263659486', N'quandoan140696@gmail.com', N'365365365', N'55 Điện Biên Phủ', N'132321123321', N'VietTinBank', N'CV002')
INSERT [dbo].[PHIEUMUABAOHIEM] ([MaPhieuBaoHiem], [MaKhachHang], [MaNhanVien], [BienSo], [NgayMua], [TinhTrangThanhToan], [MaBaoHiem], [PhuongThucThanhToan], [SoChoNgoi], [ThoiHan], [SoTienThucThu], [SoTienDaThanhToan]) VALUES (N'MP00001', N'KH00005', NULL, N'75H-54675 ', CAST(N'2018-03-14' AS Date), N'Chưa thanh toán', N'BH001', N'', N'Xe dưới 6 chỗ', 6, 275000, 0)
INSERT [dbo].[PHIEUMUABAOHIEM] ([MaPhieuBaoHiem], [MaKhachHang], [MaNhanVien], [BienSo], [NgayMua], [TinhTrangThanhToan], [MaBaoHiem], [PhuongThucThanhToan], [SoChoNgoi], [ThoiHan], [SoTienThucThu], [SoTienDaThanhToan]) VALUES (N'MP00002', N'KH00004', NULL, N'92-C174203', CAST(N'2018-03-14' AS Date), N'Chưa thanh toán', N'BH002', N'', N'Chọn số chỗ ngồi', 64, 2640000, 0)
INSERT [dbo].[PHIEUMUABAOHIEM] ([MaPhieuBaoHiem], [MaKhachHang], [MaNhanVien], [BienSo], [NgayMua], [TinhTrangThanhToan], [MaBaoHiem], [PhuongThucThanhToan], [SoChoNgoi], [ThoiHan], [SoTienThucThu], [SoTienDaThanhToan]) VALUES (N'MP00003', N'KH00003', NULL, N'43-H156237', CAST(N'2018-03-14' AS Date), N'Chưa thanh toán', N'BH003', N'', N'Xe dưới 6 chỗ', 24, 1056000, 0)
INSERT [dbo].[PHIEUMUABAOHIEM] ([MaPhieuBaoHiem], [MaKhachHang], [MaNhanVien], [BienSo], [NgayMua], [TinhTrangThanhToan], [MaBaoHiem], [PhuongThucThanhToan], [SoChoNgoi], [ThoiHan], [SoTienThucThu], [SoTienDaThanhToan]) VALUES (N'MP00004', N'KH00001', N'NV003', N'43-C156897', CAST(N'2018-03-14' AS Date), N'Đã thanh toán', N'BH001', N'Thanh toán khi mua bảo hiểm', N'Xe dưới 6 chỗ', 6, 275000, 275000)
INSERT [dbo].[PHIEUMUABAOHIEM] ([MaPhieuBaoHiem], [MaKhachHang], [MaNhanVien], [BienSo], [NgayMua], [TinhTrangThanhToan], [MaBaoHiem], [PhuongThucThanhToan], [SoChoNgoi], [ThoiHan], [SoTienThucThu], [SoTienDaThanhToan]) VALUES (N'MP00005', N'KH00006', N'NV003', N'23K-2133  ', CAST(N'2018-03-17' AS Date), N'Đã thanh toán', N'BH003', N'Chuyển khoản', N'Xe từ 6 đến 11 chỗ', 24, 1056000, 1056000)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'CV001', N'admin', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'doanthithuy@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'KH', NULL, N'KH00003')
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'nguyendangtinhdx@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'KH', NULL, N'KH00006')
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'nguyenluongphu.1995@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'KH', NULL, N'KH00001')
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV001', N'e10adc3949ba59abbe56e057f20f883e', N'CV001', N'NV001', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV002', N'e10adc3949ba59abbe56e057f20f883e', N'CV002', N'NV002', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV003', N'e10adc3949ba59abbe56e057f20f883e', N'CV002', N'NV003', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV004', N'e10adc3949ba59abbe56e057f20f883e', N'CV002', N'NV004', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV005', N'e10adc3949ba59abbe56e057f20f883e', N'CV001', N'NV005', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV006', N'e10adc3949ba59abbe56e057f20f883e', N'CV001', N'NV006', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV007', N'e10adc3949ba59abbe56e057f20f883e', N'CV001', N'NV007', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV008', N'e10adc3949ba59abbe56e057f20f883e', N'CV002', N'NV008', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV009', N'e10adc3949ba59abbe56e057f20f883e', N'CV002', N'NV009', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV010', N'e10adc3949ba59abbe56e057f20f883e', N'CV002', N'NV010', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV011', N'e10adc3949ba59abbe56e057f20f883e', N'CV002', N'NV011', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'NV012', N'e10adc3949ba59abbe56e057f20f883e', N'CV002', N'NV012', NULL)
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'phamthuy@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'KH', NULL, N'KH00005')
INSERT [dbo].[TAIKHOAN] ([TenDangNhap], [MatKhau], [Quyen], [MaNhanVien], [MaKhachHang]) VALUES (N'thanhtuyen03@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'KH', NULL, N'KH00004')
ALTER TABLE [dbo].[Anh]  WITH CHECK ADD  CONSTRAINT [FK_Anh_HOSOTAINAN] FOREIGN KEY([MaHoSo])
REFERENCES [dbo].[HOSOTAINAN] ([MaHoSo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Anh] CHECK CONSTRAINT [FK_Anh_HOSOTAINAN]
GO
ALTER TABLE [dbo].[HOSOTAINAN]  WITH CHECK ADD  CONSTRAINT [FK_HOSOTAINAN_KHACHHANG] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KHACHHANG] ([MaKhachHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HOSOTAINAN] CHECK CONSTRAINT [FK_HOSOTAINAN_KHACHHANG]
GO
ALTER TABLE [dbo].[HOSOTAINAN]  WITH CHECK ADD  CONSTRAINT [FK_HOSOTAINAN_NHANVIEN] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NHANVIEN] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HOSOTAINAN] CHECK CONSTRAINT [FK_HOSOTAINAN_NHANVIEN]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_CHUCVU] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[CHUCVU] ([MaChucVu])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_CHUCVU]
GO
ALTER TABLE [dbo].[PHIEUMUABAOHIEM]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUMUABAOHIEM_BAOHIEM] FOREIGN KEY([MaBaoHiem])
REFERENCES [dbo].[BAOHIEM] ([MaBaoHiem])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PHIEUMUABAOHIEM] CHECK CONSTRAINT [FK_PHIEUMUABAOHIEM_BAOHIEM]
GO
ALTER TABLE [dbo].[PHIEUMUABAOHIEM]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUMUABAOHIEM_KHACHHANG] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KHACHHANG] ([MaKhachHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PHIEUMUABAOHIEM] CHECK CONSTRAINT [FK_PHIEUMUABAOHIEM_KHACHHANG]
GO
ALTER TABLE [dbo].[PHIEUMUABAOHIEM]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUMUABAOHIEM_NHANVIEN] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NHANVIEN] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PHIEUMUABAOHIEM] CHECK CONSTRAINT [FK_PHIEUMUABAOHIEM_NHANVIEN]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_TAIKHOAN_KHACHHANG] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KHACHHANG] ([MaKhachHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [FK_TAIKHOAN_KHACHHANG]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_TAIKHOAN_NHANVIEN] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NHANVIEN] ([MaNhanVien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [FK_TAIKHOAN_NHANVIEN]
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD  CONSTRAINT [FK_XE_KHACHHANG] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KHACHHANG] ([MaKhachHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[XE] CHECK CONSTRAINT [FK_XE_KHACHHANG]
GO
/****** Object:  Trigger [dbo].[tg_nextanh]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  Trigger [dbo].[tg_nextbaohiem]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  Trigger [dbo].[tg_nextchucvu1]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  Trigger [dbo].[tg_nexthoso]    Script Date: 20/3/2018 9:59:24 AM ******/
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
/****** Object:  Trigger [dbo].[tg_nextchucvu]    Script Date: 20/3/2018 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_nextchucvu] ON [dbo].[KHACHHANG]
FOR INSERT
AS	
BEGIN
	DECLARE @lastchitiethoatdong VARCHAR(5)
	SET @lastchitiethoatdong = (SELECT TOP	1	dbo.CHUCVU.MaChucVu FROM dbo.CHUCVU ORDER BY MaChucVu DESC)
	UPDATE dbo.CHUCVU SET MaChucVu = dbo.fun_nextchucvu(@lastchitiethoatdong,'CV',5) WHERE MaChucVu = ''
END	


GO
/****** Object:  Trigger [dbo].[tg_nextkhachhang]    Script Date: 20/3/2018 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_nextkhachhang] ON [dbo].[KHACHHANG]
FOR INSERT
AS	
BEGIN
	DECLARE @lastchitiethoatdong VARCHAR(7)
	SET @lastchitiethoatdong = (SELECT TOP	1	dbo.KHACHHANG.MaKhachHang FROM dbo.KHACHHANG ORDER BY MaKhachHang DESC)
	UPDATE dbo.KHACHHANG SET MaKhachHang = dbo.fun_nextkhachhang(@lastchitiethoatdong,'KH',7) WHERE MaKhachHang = ''
END	


GO
/****** Object:  Trigger [dbo].[tg_nextnhanvien]    Script Date: 20/3/2018 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_nextnhanvien] ON [dbo].[NHANVIEN]
FOR INSERT
AS	
BEGIN
	DECLARE @lastnhanvien VARCHAR(5)
	SET @lastnhanvien = (SELECT TOP	1	dbo.NHANVIEN.MaNhanVien FROM dbo.NHANVIEN ORDER BY MaNhanVien DESC)
	UPDATE dbo.NHANVIEN SET MaNhanVien = dbo.fun_nextnhanvien(@lastnhanvien,'NV',5) WHERE MaNhanVien = ''
END	


GO
/****** Object:  Trigger [dbo].[tg_nextphieumua]    Script Date: 20/3/2018 9:59:24 AM ******/
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
         Configuration = "(H (1[24] 4[5] 2[46] 3) )"
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
         Begin Table = "BAOHIEM"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "KHACHHANG"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "NHANVIEN"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PHIEUMUABAOHIEM"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 881
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
      Begin ColumnWidths = 21
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DanhSachMuaBaoHiem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Alias = 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DanhSachMuaBaoHiem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DanhSachMuaBaoHiem'
GO
USE [master]
GO
ALTER DATABASE [QL_CTBH] SET  READ_WRITE 
GO
