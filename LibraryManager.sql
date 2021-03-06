USE [master]
GO
/****** Object:  Database [LibraryManager]    Script Date: 20/3/2018 9:58:55 AM ******/
CREATE DATABASE [LibraryManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\LibraryManager.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\LibraryManager_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryManager] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManager] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManager] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryManager] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LibraryManager]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsUsing] [tinyint] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Authors]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorId] [nvarchar](50) NOT NULL,
	[AuthorName] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Certificate] [nvarchar](50) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[BookId] [nvarchar](50) NOT NULL,
	[AuthorId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BookAuthor] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC,
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [nvarchar](50) NOT NULL,
	[BookName] [nvarchar](200) NOT NULL,
	[CategoryItemId] [nvarchar](50) NOT NULL,
	[PublisherId] [nvarchar](50) NOT NULL,
	[SaveCategoryId] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[PublisherDate] [smalldatetime] NULL,
	[Unit] [tinyint] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [tinyint] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BorrowBook]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowBook](
	[BorrowBookId] [int] IDENTITY(0,1) NOT NULL,
	[BookId] [nvarchar](50) NOT NULL,
	[BorrowDate] [smalldatetime] NOT NULL,
	[ReturnDate] [smalldatetime] NULL,
	[Note] [text] NULL,
	[EmployeeId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BorrowBook] PRIMARY KEY CLUSTERED 
(
	[BorrowBookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [nvarchar](50) NOT NULL,
	[CategoryName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryItem]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryItem](
	[CategoryItemId] [nvarchar](50) NOT NULL,
	[CategoryItemName] [nvarchar](200) NOT NULL,
	[CategoryId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryItem] PRIMARY KEY CLUSTERED 
(
	[CategoryItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [nvarchar](50) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [nvarchar](50) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](20) NULL,
	[DepartmentId] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FunctionRole]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionRole](
	[FunctionRoleId] [int] IDENTITY(0,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[FunctionId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FunctionRole] PRIMARY KEY CLUSTERED 
(
	[FunctionRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Functions]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[FunctionId] [nvarchar](50) NOT NULL,
	[FunctionName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Functions] PRIMARY KEY CLUSTERED 
(
	[FunctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectId] [nvarchar](50) NOT NULL,
	[ProjectName] [nvarchar](200) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NULL,
	[EmployeeId] [nvarchar](50) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherId] [nvarchar](50) NOT NULL,
	[PublisherName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeStorage]    Script Date: 20/3/2018 9:58:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeStorage](
	[SaveCategoryId] [nvarchar](50) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeStorage] PRIMARY KEY CLUSTERED 
(
	[SaveCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [Password], [RoleId], [IsUsing]) VALUES (N'admin', N'-3110-365773-7089-85-6686-3287-1415-12062', 1, 0)
INSERT [dbo].[Account] ([Username], [Password], [RoleId], [IsUsing]) VALUES (N'hungpham', N'27-121-61-7512-9170-6-35-5710397-6719-128113', 1, 0)
INSERT [dbo].[Account] ([Username], [Password], [RoleId], [IsUsing]) VALUES (N'huynhvanmin', N'-3110-365773-7089-85-6686-3287-1415-12062', 3, 0)
INSERT [dbo].[Account] ([Username], [Password], [RoleId], [IsUsing]) VALUES (N'nguyenthithuthuy', N'-3110-365773-7089-85-6686-3287-1415-12062', 3, 0)
INSERT [dbo].[Account] ([Username], [Password], [RoleId], [IsUsing]) VALUES (N'nhantam.ibst', N'-3110-365773-7089-85-6686-3287-1415-12062', 2, 0)
INSERT [dbo].[Account] ([Username], [Password], [RoleId], [IsUsing]) VALUES (N'tranminhduc', N'-3110-365773-7089-85-6686-3287-1415-12062', 3, 0)
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_001', N'KTS. Phùng Phu', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_002', N'Trần Minh Đức', N'', N'Tiến sỹ')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_003', N'HS. Lê Huyên', N'Phó giáo sư', N'Tiến sỹ')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_004', N'KTS. Tôn Thành Chi', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_005', N'KTS. Đỗ Thị Thanh Mai', N'', N'Thạc sỹ')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_006', N'HS. Đoàn Sỹ Lạng', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_007', N'Knut Einarlarsen', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_008', N'Nils Masvin', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_009', N'C.V.Horie', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_010', N'Jukka Jokilehto', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_011', N'Bernad M.Feilden', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_012', N'Marianne Webb', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_013', N'Susan Buys', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_014', N'Victoria Oakley', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_015', N'Đại học Waseda', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_016', N'Vũ Hữu Minh', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_017', N'Borobudur', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_018', N'Phan Thuận An', N'', N'')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [Title], [Certificate]) VALUES (N'AUT_019', N'Ardant du Picq', N'', N'')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0001', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0002', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0003', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0004', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0005', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0007', N'AUT_001')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0008', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0009', N'AUT_017')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0010', N'AUT_017')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0011', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0012', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0013', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0014', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0015', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-1/0016', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0002', N'AUT_001')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0002', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0003', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0004', N'AUT_003')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0006', N'AUT_001')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0006', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0007', N'AUT_004')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0008', N'AUT_005')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0009', N'AUT_006')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0010', N'AUT_007')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0010', N'AUT_008')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0011', N'AUT_009')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0012', N'AUT_010')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0013', N'AUT_011')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0014', N'AUT_012')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0015', N'AUT_013')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-2/0015', N'AUT_014')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0001', N'AUT_001')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0001', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0002', N'AUT_001')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0003', N'AUT_015')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0004', N'AUT_001')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0005', N'AUT_016')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0006', N'AUT_001')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0007', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0008', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0009', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0010', N'AUT_018')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0011', N'AUT_001')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0011', N'AUT_002')
INSERT [dbo].[BookAuthor] ([BookId], [AuthorId]) VALUES (N'A1-3/0011', N'AUT_018')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0001', N'Luật di sản văn hóa và văn bản hướng dẫn thi hành', N'A1-1', N'PUB_016', N'SAVE2', N'#', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), 0, 10000, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0002', N'Luật di sản văn hóa', N'A1-1', N'PUB_016', N'SAVE2', N'#', CAST(N'2001-01-01 00:00:00' AS SmallDateTime), 0, 3400, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0003', N'Bảo tàng với sự nghiệp công nghiệp hóa, hiện đại hóa đất nước', N'A1-1', N'PUB_002', N'SAVE2', N'#', CAST(N'1998-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0004', N'Quản lý và đánh giá dự án trùng tu bảo tồn di sản kiến trúc - đô thị', N'A1-1', N'PUB_003', N'SAVE2', N'#', CAST(N'2002-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0005', N'Các Hiến chương quốc tế về bảo toàn và trùng tu', N'A1-1', N'PUB_004', N'SAVE2', N'#', CAST(N'2001-01-01 00:00:00' AS SmallDateTime), 0, 0, 7, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0007', N'Công tác bảo tồn di tích', N'A1-1', N'PUB_005', N'SAVE2', N'#', CAST(N'1998-01-01 00:00:00' AS SmallDateTime), 0, 0, 3, 1, N'Tài li?u tham kh?o n?i b?')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0008', N'Báo cáo Hội nghị Asean về bảo tồn và trùng tu các Di tích & Khu di tích dành cho chuyên gia trẻ', N'A1-1', N'PUB_004', N'SAVE2', N'#', CAST(N'1998-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 1, N'Trích d?ch - Tài li?u tham kh?o n?i b?')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0009', N'REPORT: Asean Workshop on conservation and restoration of monuments and siter for young professionnals', N'A1-1', N'PUB_013', N'SAVE2', N'#', CAST(N'1999-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0010', N'REPORT: Asean Workshop on Standardization for Archaeological Conservation and Restoration Procedure', N'A1-1', N'PUB_013', N'SAVE2', N'#', CAST(N'1999-01-01 00:00:00' AS SmallDateTime), 0, 0, 2, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0011', N'Văn kiện Nara về giữ gìn tính nguyên gốc của di tích trong quá trình trùng tu', N'A1-1', N'PUB_007', N'SAVE2', N'#', CAST(N'2000-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0012', N'Các Luật pháp lệnh của Quốc hội - Ủy ban Thường vụ Quốc hội khóa X', N'A1-1', N'PUB_016', N'SAVE2', N'#', CAST(N'2002-01-01 00:00:00' AS SmallDateTime), 0, 260000, 1, 0, N'Ban hành các n?m 2000-2002')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0013', N'Một con đường tiếp cận di sản văn hóa - Tập 2', N'A1-1', N'PUB_009', N'SAVE2', N'#', CAST(N'2005-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'T?p h?p các bài vi?t')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0014', N'Hội thảo khoa học và thực tiễn - Xây dựng và thực thi các dự án bảo tồn di tích', N'A1-1', N'PUB_010', N'SAVE2', N'#', CAST(N'2005-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0015', N'Quản lý du lịch tại các khu di sản thế giới', N'A1-1', N'PUB_011', N'SAVE3', N'#', CAST(N'2006-01-01 00:00:00' AS SmallDateTime), 0, 75000, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-1/0016', N'Hiến chương và văn kiện quốc tế về bảo tồn di tích', N'A1-1', N'PUB_011', N'SAVE3', N'#', CAST(N'2000-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0002', N'Nghiên cứu và ứng dụng kỹ thuật công nghệ bảo quản công trình di tích Huế (1993-2002) - Tập 1', N'A1-2', N'PUB_005', N'SAVE2', N'#', CAST(N'2002-01-01 00:00:00' AS SmallDateTime), 0, 0, 2, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0003', N'Hướng dẫn tu bổ nhà truyền thống', N'A1-2', N'PUB_012', N'SAVE2', N'#', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), 0, 0, 2, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0004', N'Nghề sơn cổ truyền Việt Nam', N'A1-2', N'PUB_001', N'SAVE2', N'#', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0006', N'Báo cáo các công nghệ thích ứng trùng tu di tích Huế', N'A1-2', N'PUB_005', N'SAVE2', N'#', CAST(N'1999-01-01 00:00:00' AS SmallDateTime), 0, 0, 5, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0007', N'Chất liệu màu sắc trong kiến trúc cổ Trung Quốc', N'A1-2', N'PUB_013', N'SAVE2', N'#', CAST(N'2002-01-01 00:00:00' AS SmallDateTime), 0, 0, 4, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0008', N'Phục chế 6 bức tranh tường nội thất Khải Tường Lâu - Cung An Định', N'A1-2', N'PUB_005', N'SAVE2', N'#', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), 0, 0, 3, 1, N'Báo cáo sau khóa h?c')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0009', N'Dự án tu bổ phục hồi màu sắc họa tiết hoa văn trang trí Khải Tường Lâu - Cung An Định', N'A1-2', N'PUB_005', N'SAVE2', N'#', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), 0, 0, 3, 0, N'Báo cáo khóa h?c t?p hu?n')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0010', N'Conservation of Historie Timber Structures', N'A1-2', N'PUB_013', N'SAVE2', N'#', CAST(N'2000-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0011', N'Materials for Conservation', N'A1-2', N'PUB_013', N'SAVE2', N'#', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0012', N'A History of Architectural Conservation', N'A1-2', N'PUB_013', N'SAVE2', N'#', CAST(N'2002-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0013', N'Conservation of Historic Buildings', N'A1-2', N'PUB_013', N'SAVE2', N'#', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0014', N'Lacquer: Technology and Conservation', N'A1-2', N'PUB_013', N'SAVE2', N'#', CAST(N'2000-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-2/0015', N'Conservation and Restoration of Ceramics', N'A1-2', N'PUB_013', N'SAVE2', N'#', CAST(N'2002-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 1, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-3/0001', N'Huế - Di sản và cuộc sống', N'A1-3', N'PUB_005', N'SAVE2', N'#', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), 0, 0, 12, 0, N'K? ni?m 10 nam Hu? di s?n van hóa th? gi?i')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-3/0002', N'Di sản văn hóa Huế - 20 năm bảo tồn và phát huy giá trị', N'A1-3', N'PUB_005', N'SAVE2', N'#', CAST(N'2002-01-01 00:00:00' AS SmallDateTime), 0, 0, 2, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-3/0003', N'Phục hồi Điện Cần Chánh', N'A1-3', N'PUB_005', N'SAVE2', N'#', CAST(N'2000-01-01 00:00:00' AS SmallDateTime), 0, 0, 4, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-3/0004', N'Di sản văn hóa Huế - Bảo tồn và phát triển', N'A1-3', N'PUB_005', N'SAVE2', N'#', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-3/0005', N'Để không là người ở trọ', N'A1-3', N'PUB_014', N'SAVE2', N'#', CAST(N'2001-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-3/0006', N'Thời gian đã chứng minh - Tập san kỷ niệm 5 năm thực hiện dự án Quy hoạch bảo tồn và phát huy giá trị di tích Cố đô Huế', N'A1-3', N'PUB_005', N'SAVE2', N'#', CAST(N'2001-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-3/0007', N'Văn hóa lịch sử Huế qua góc nhìn làng xã phụ cận và quan hệ với bên ngoài', N'A1-3', N'PUB_015', N'SAVE2', N'#', CAST(N'2010-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-3/0008', N'Bảo tàng Mỹ thuật Cung đình Huế - Phần III', N'A1-3', N'PUB_005', N'SAVE2', N'#', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-3/0009', N'Di tích thắng cảnh lịch sử văn hóa - Phụ nữ Việt Nam (Tập 1)', N'A1-3', N'PUB_008', N'SAVE2', N'#', CAST(N'1999-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-3/0010', N'Kinh thành Huế', N'A1-3', N'PUB_005', N'SAVE2', N'#', CAST(N'2002-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'A1-3/0011', N'Huế - Di sản văn hóa thế giới', N'A1-3', N'PUB_008', N'SAVE2', N'#', CAST(N'1999-01-01 00:00:00' AS SmallDateTime), 0, 0, 1, 0, N'')
INSERT [dbo].[Books] ([BookId], [BookName], [CategoryItemId], [PublisherId], [SaveCategoryId], [ProjectId], [PublisherDate], [Unit], [Price], [Quantity], [Note], [Description]) VALUES (N'BK001', N'Test Book', N'A1-1', N'PUB_011', N'SAVE2', N'#', CAST(N'2012-11-20 00:00:00' AS SmallDateTime), 0, 10000, 10, 1, N'')
SET IDENTITY_INSERT [dbo].[BorrowBook] ON 

INSERT [dbo].[BorrowBook] ([BorrowBookId], [BookId], [BorrowDate], [ReturnDate], [Note], [EmployeeId]) VALUES (0, N'BK001', CAST(N'2012-10-10 00:00:00' AS SmallDateTime), CAST(N'2013-01-21 00:00:00' AS SmallDateTime), N'', N'EMP002')
INSERT [dbo].[BorrowBook] ([BorrowBookId], [BookId], [BorrowDate], [ReturnDate], [Note], [EmployeeId]) VALUES (3, N'BK001', CAST(N'2012-10-10 00:00:00' AS SmallDateTime), CAST(N'2012-12-21 00:00:00' AS SmallDateTime), N'Test', N'EMP002')
INSERT [dbo].[BorrowBook] ([BorrowBookId], [BookId], [BorrowDate], [ReturnDate], [Note], [EmployeeId]) VALUES (9, N'A1-1/0001', CAST(N'2013-01-21 00:00:00' AS SmallDateTime), CAST(N'2013-01-21 00:00:00' AS SmallDateTime), N'', N'EMP002')
SET IDENTITY_INSERT [dbo].[BorrowBook] OFF
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (N'A1', N'Khoa học bảo tồn', N'')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (N'cateA1', N'Khoa học bảo tồn di sản', N'')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (N'cateA2', N'Khoa học xã hội - nhân văn phục vụ bảo tồn', N'')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (N'cateB1', N'Khoa học công nghệ - Kỹ thuật xây dựng', N'')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (N'cateB2', N'Hướng dẫn kỹ thuật - Xây dựng', N'')
INSERT [dbo].[CategoryItem] ([CategoryItemId], [CategoryItemName], [CategoryId]) VALUES (N'A1-1', N'Lý luận pháp chế bảo tồn di tích', N'cateA1')
INSERT [dbo].[CategoryItem] ([CategoryItemId], [CategoryItemName], [CategoryId]) VALUES (N'A1-2', N'Khoa học công nghệ bảo tồn di tích', N'cateA1')
INSERT [dbo].[CategoryItem] ([CategoryItemId], [CategoryItemName], [CategoryId]) VALUES (N'A1-3', N'Nghiên cứu về di tích', N'cateA1')
INSERT [dbo].[CategoryItem] ([CategoryItemId], [CategoryItemName], [CategoryId]) VALUES (N'A1-4', N'Tiêu chuẩn về bảo tồn di tích', N'cateA1')
INSERT [dbo].[CategoryItem] ([CategoryItemId], [CategoryItemName], [CategoryId]) VALUES (N'A2-1', N'Lịch sử - Khảo cổ', N'cateA2')
INSERT [dbo].[CategoryItem] ([CategoryItemId], [CategoryItemName], [CategoryId]) VALUES (N'A2-2', N'Nghiên cứu văn hóa phi vật thể', N'cateA2')
INSERT [dbo].[CategoryItem] ([CategoryItemId], [CategoryItemName], [CategoryId]) VALUES (N'B1-1', N'Kỹ thuật & Công nghệ xây dựng', N'cateB1')
INSERT [dbo].[CategoryItem] ([CategoryItemId], [CategoryItemName], [CategoryId]) VALUES (N'B1-2', N'Quy hoạch - Kiến trúc - Thiết kế mẫu', N'cateB1')
INSERT [dbo].[CategoryItem] ([CategoryItemId], [CategoryItemName], [CategoryId]) VALUES (N'B2-1', N'Hướng dẫn kỹ thuật', N'cateB2')
INSERT [dbo].[CategoryItem] ([CategoryItemId], [CategoryItemName], [CategoryId]) VALUES (N'B2-2', N'Thủy lợi', N'cateB2')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (N'DEP_BGD', N'Ban Giám đốc', N'')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (N'DEP_PQLDA', N'Phòng Quản lý Dự án', N'')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (N'DEP_PTH', N'Phòng Tổng hợp', N'')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (N'DEP_PTN', N'Phòng Thí nghiệm LAS-XD 578', N'')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (N'DEP_XCN', N'Xưởng Công nghệ TBDT&XD', N'')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (N'DEP_XDA1', N'Xưởng Dự án 1', N'')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description]) VALUES (N'DEP_XDA2', N'Xưởng Dự án 2', N'')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [Address], [Email], [Mobile], [DepartmentId], [Username]) VALUES (N'EMP002', N'Lê Nhân Tâm', N'10/10 Chế Lan Viên, TP-Huế', N'nhantam.ibst@yahoo.com.vn', N'0913490430', N'DEP_PTH', N'nhantam.ibst')
SET IDENTITY_INSERT [dbo].[FunctionRole] ON 

INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1061, 2, N'mng_auth')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1062, 2, N'mng_book')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1063, 2, N'mng_emp')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1078, 1, N'mng_auth')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1079, 1, N'mng_book')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1080, 1, N'mng_cate')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1081, 1, N'mng_cate_item')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1082, 1, N'mng_depart')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1083, 1, N'mng_emp')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1084, 1, N'mng_prj')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1085, 1, N'mng_pub')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1087, 1, N'sys_account_mng')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1088, 1, N'sys_role_mng')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1090, 1, N'mng_save_catagory')
INSERT [dbo].[FunctionRole] ([FunctionRoleId], [RoleId], [FunctionId]) VALUES (1091, 1, N'sys_rolefunction_mng')
SET IDENTITY_INSERT [dbo].[FunctionRole] OFF
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'mng_auth', N'Manager Authors', N'Management function author')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'mng_book', N'Manager Book', N'Management function book')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'mng_cate', N'Manager Category', N'Management function category')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'mng_cate_item', N'Manager Category Item', N'Management function category item')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'mng_depart', N'Manager Department', N'Management function department')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'mng_emp', N'Manager Employee', N'Mangement function employee')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'mng_prj', N'Manager Project', N'Management function project')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'mng_pub', N'Manager Publisher', N'Management function publisher')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'mng_save_catagory', N'Manager Save Catagory', N'Management function save catagory')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'sys_account_mng', N'Account Manager', N'Management user of system')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'sys_role_mng', N'Role Manager', N'Role management system')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Description]) VALUES (N'sys_rolefunction_mng', N'Role Function Management', N'Role function management of system')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [StartDate], [EndDate], [EmployeeId], [Description]) VALUES (N'#', N'- Không thuộc dự án nào -', CAST(N'2000-01-01 00:00:00' AS SmallDateTime), NULL, N'EMP002', N'Không thu?c d? án nào')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [StartDate], [EndDate], [EmployeeId], [Description]) VALUES (N'PRJ_TV001', N'Lập BCKTKT Tả Trà', CAST(N'2010-08-30 07:00:00' AS SmallDateTime), NULL, N'EMP002', N'Tu v?n l?p báo cáo kinh t? k? thu?t: B?o t?n, tu b? và ph?c h?i di tích T? Trà.')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_001', N'NXB Xây dựng', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_002', N'NXB Hà Nội', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_003', N'Trường Đại học Kiến trúc Hà Nội', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_004', N'Hội đồng quốc tế về di tích và di chỉ', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_005', N'Trung tâm Bảo tồn Di tích Cố đô Huế', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_006', N'Borobudur - Indonesia', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_007', N'Cục Bảo tồn Bảo tàng', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_008', N'NXB Phụ Nữ', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_009', N'Cục Di sản Văn hóa', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_010', N'Viện Bảo tồn Di tích', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_011', N'UNESCO', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_012', N'Nhà di sản thành phố', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_013', N'Tài liệu nước ngoài', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_014', N'NXB Trẻ', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_015', N'NXB Thuận Hóa', N'')
INSERT [dbo].[Publishers] ([PublisherId], [PublisherName], [Address]) VALUES (N'PUB_016', N'NXB Chính trị Quốc gia', N'')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description]) VALUES (1, N'Administrator', N'Administrator')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description]) VALUES (2, N'Management', N'Management')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description]) VALUES (3, N'User', N'User')
INSERT [dbo].[TypeStorage] ([SaveCategoryId], [CategoryName]) VALUES (N'SAVE1', N'Đặc biệt')
INSERT [dbo].[TypeStorage] ([SaveCategoryId], [CategoryName]) VALUES (N'SAVE2', N'Phổ biến')
INSERT [dbo].[TypeStorage] ([SaveCategoryId], [CategoryName]) VALUES (N'SAVE3', N'Nội bộ')
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Roles]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([AuthorId])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Authors]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Books]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_CategoryItem] FOREIGN KEY([CategoryItemId])
REFERENCES [dbo].[CategoryItem] ([CategoryItemId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_CategoryItem]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Projects]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishers] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([PublisherId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishers]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_TypeStorage] FOREIGN KEY([SaveCategoryId])
REFERENCES [dbo].[TypeStorage] ([SaveCategoryId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_TypeStorage]
GO
ALTER TABLE [dbo].[BorrowBook]  WITH CHECK ADD  CONSTRAINT [FK_BorrowBook_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[BorrowBook] CHECK CONSTRAINT [FK_BorrowBook_Books]
GO
ALTER TABLE [dbo].[BorrowBook]  WITH CHECK ADD  CONSTRAINT [FK_BorrowBook_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BorrowBook] CHECK CONSTRAINT [FK_BorrowBook_Employees]
GO
ALTER TABLE [dbo].[CategoryItem]  WITH CHECK ADD  CONSTRAINT [FK_CategoryItem_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryItem] CHECK CONSTRAINT [FK_CategoryItem_Category]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Account]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Department]
GO
ALTER TABLE [dbo].[FunctionRole]  WITH CHECK ADD  CONSTRAINT [FK_FunctionRole_Functions] FOREIGN KEY([FunctionId])
REFERENCES [dbo].[Functions] ([FunctionId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FunctionRole] CHECK CONSTRAINT [FK_FunctionRole_Functions]
GO
ALTER TABLE [dbo].[FunctionRole]  WITH CHECK ADD  CONSTRAINT [FK_FunctionRole_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FunctionRole] CHECK CONSTRAINT [FK_FunctionRole_Roles]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Employees]
GO
USE [master]
GO
ALTER DATABASE [LibraryManager] SET  READ_WRITE 
GO
