USE [master]
GO
/****** Object:  Database [JavaEE_Example]    Script Date: 20/3/2018 9:58:29 AM ******/
CREATE DATABASE [JavaEE_Example]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JavaEE_Example', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\JavaEE_Example.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JavaEE_Example_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\JavaEE_Example_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JavaEE_Example] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JavaEE_Example].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JavaEE_Example] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JavaEE_Example] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JavaEE_Example] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JavaEE_Example] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JavaEE_Example] SET ARITHABORT OFF 
GO
ALTER DATABASE [JavaEE_Example] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [JavaEE_Example] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [JavaEE_Example] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JavaEE_Example] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JavaEE_Example] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JavaEE_Example] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JavaEE_Example] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JavaEE_Example] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JavaEE_Example] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JavaEE_Example] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JavaEE_Example] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JavaEE_Example] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JavaEE_Example] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JavaEE_Example] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JavaEE_Example] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JavaEE_Example] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JavaEE_Example] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JavaEE_Example] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JavaEE_Example] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JavaEE_Example] SET  MULTI_USER 
GO
ALTER DATABASE [JavaEE_Example] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JavaEE_Example] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JavaEE_Example] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JavaEE_Example] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [JavaEE_Example]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 20/3/2018 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [nvarchar](20) NOT NULL,
	[TenKhoa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 20/3/2018 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[TenDangNhap] [nvarchar](30) NOT NULL,
	[MatKhau] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 20/3/2018 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MSV] [nvarchar](20) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [int] NULL,
	[MaKhoa] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'CNTT', N'Khoa Công nghệ thông tin')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'Hoa', N'Khoa Hóa')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'Ly', N'Khoa Lý')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'Toan', N'Khoa Toán')
INSERT [dbo].[NguoiDung] ([TenDangNhap], [MatKhau]) VALUES (N'admin', N'123')
INSERT [dbo].[NguoiDung] ([TenDangNhap], [MatKhau]) VALUES (N'fpt', N'123')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051010565', N'Lý Lê Bằng', 1, N'Toan')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051016523', N'Trần Anh Tuấn', 1, N'Toan')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051036666', N'Lê Lan Anh', 0, N'Hoa')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051037777', N'Đặng Thúy Nga', 0, N'Ly')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051070388', N'Nguyễn Văn A', 1, N'CNTT')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051070584', N'Trần Văn Long', 1, N'CNTT')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051072354', N'Lê Văn Nam', 1, N'Hoa')
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_Khoa]
GO
USE [master]
GO
ALTER DATABASE [JavaEE_Example] SET  READ_WRITE 
GO
