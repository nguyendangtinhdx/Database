USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 9/5/2018 9:04:36 PM ******/
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\OnlineShop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\OnlineShop_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[About]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)),
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Category_Status]  DEFAULT ((1)),
	[ShowOnHome] [bit] NULL CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)),
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Content_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Content_Status]  DEFAULT ((1)),
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)),
	[Tags] [nvarchar](500) NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()),
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Language]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Language](
	[ID] [varchar](2) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsDefault] [bit] NOT NULL CONSTRAINT [DF_Language_IsDefault]  DEFAULT ((0)),
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)),
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](10) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL CONSTRAINT [DF_Product_Price]  DEFAULT ((0)),
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludedVAT] [bit] NULL,
	[Quantity] [int] NOT NULL CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)),
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Product_Status]  DEFAULT ((1)),
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)),
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)),
	[ShowOnHome] [bit] NULL CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)),
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)),
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Value] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[GroupID] [varchar](20) NULL CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER'),
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (1, N'Tin thế giới', N'tin-the-gioi', NULL, 1, NULL, CAST(N'2015-08-15 07:49:20.183' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (2, N'Tin trong nước', N'tin-trong-nuoc', NULL, 2, NULL, CAST(N'2015-08-15 07:49:33.087' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (3, N'Tin chính trị', N'tin-chinh-tri', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'vi')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status]) VALUES (1, N'<p>Công ty CP Online Shop</p><p>Địa chỉ: Số 1 Quang Trung Hà Đông </p> <p>Điện thoại: 04 6523 5342</p>', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Tags], [Language]) VALUES (1, N'tin tức demo', NULL, N'424', N'/Data/images/14.PNG', 1, N'42342342', 12, CAST(N'2015-09-20 08:01:57.590' AS DateTime), N'toanbn', CAST(N'2018-05-05 21:41:02.837' AS DateTime), NULL, N'313', N'13                                                                                                                                                                                                                                                        ', 0, NULL, 0, N'tin tức,thời sự', N'en')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Tags], [Language]) VALUES (7, N'Tin quảng cáo', N'Tin-quang-cao', N'Không có gì', N'abc.jpg', 123, N'Không có', 12, CAST(N'2018-05-05 21:25:33.743' AS DateTime), N'Nguy?n Ðang T?nh', NULL, NULL, N'Từ khóa', N'không dấu                                                                                                                                                                                                                                                 ', 1, NULL, 0, N'2', N'vn')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Tags], [Language]) VALUES (8, N'44', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-05-05 21:42:31.727' AS DateTime), N'Nguyen Dang Tinh', CAST(N'2018-05-05 21:44:31.283' AS DateTime), NULL, NULL, NULL, 1, NULL, 0, NULL, N'vn')
SET IDENTITY_INSERT [dbo].[Content] OFF
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (1, N'thoi-su')
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (1, N'tin-tuc')
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (7, N'2')
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (4, N'Nguyen Dang Tinh', N'01263659419', N'nguyendangtinhdx@gmail.com', N'Quảng Nam', N'123                        ', CAST(N'2018-05-04 10:03:53.840' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'footer', N'<div class="wrap">	
	     <div class="section group">
				<div class="col_1_of_4 span_1_of_4">
						<h4>Information</h4>
						<ul>
						<li><a href="about.html">About Us</a></li>
						<li><a href="contact.html">Customer Service</a></li>
						<li><a href="#">Advanced Search</a></li>
						<li><a href="delivery.html">Orders and Returns</a></li>
						<li><a href="contact.html">Contact Us</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Why buy from us</h4>
						<ul>
						<li><a href="about.html">About Us</a></li>
						<li><a href="contact.html">Customer Service</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="contact.html">Site Map</a></li>
						<li><a href="#">Search Terms</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>My account</h4>
						<ul>
							<li><a href="contact.html">Sign In</a></li>
							<li><a href="index.html">View Cart</a></li>
							<li><a href="#">My Wishlist</a></li>
							<li><a href="#">Track My Order</a></li>
							<li><a href="contact.html">Help</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Contact</h4>
						<ul>
							<li><span>+91-123-456789</span></li>
							<li><span>+00-123-000000</span></li>
						</ul>
						<div class="social-icons">
							<h4>Follow Us</h4>
					   		  <ul>
							      <li><a href="#" target="_blank"><img src="images/facebook.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/twitter.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/skype.png" alt="" /> </a></li>
							      <li><a href="#" target="_blank"> <img src="images/dribbble.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"> <img src="images/linkedin.png" alt="" /></a></li>
							      <div class="clear"></div>
						     </ul>
   	 					</div>
				</div>
			</div>			
        </div>
        <div class="copy_right">
				<p>Bán hàng Online © | Được thiết kế bởi <a href="https://www.facebook.com/nguyendangtinhdx.BI">Nguyễn Đăng Tỉnh</a> </p>
		   </div>', 1)
INSERT [dbo].[Language] ([ID], [Name], [IsDefault]) VALUES (N'en', N'Tiếng Anh', 0)
INSERT [dbo].[Language] ([ID], [Name], [IsDefault]) VALUES (N'vi', N'Tiếng Việt', 1)
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/', 1, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Giới thiệu', N'/gioi-thieu', 2, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Tin tức', N'/tin-tuc', 3, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Sản phẩm', N'/san-pham', 4, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên hệ', N'/lien-he', 5, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Đăng nhập', N'/dang-nhap', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Đăng ký', N'/dang-ky', 2, N'_self', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu top')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (24, CAST(N'2018-05-03 21:11:49.487' AS DateTime), NULL, N'Tinh', N'1263659419', N'Hue, An Cuu', N'nguyendangtinhdx@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (25, CAST(N'2018-05-03 21:14:40.490' AS DateTime), NULL, N'Nguyễn Đăng Tỉnh', N'01263659419', N'Hue, An Cuu', N'nguyendangtinhdx@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (26, CAST(N'2018-05-03 21:15:17.487' AS DateTime), NULL, N'Nguyễn Đăng Tỉnh', N'1265895117', N'hue, le chi', N'tinhbidx@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (27, CAST(N'2018-05-03 21:17:15.080' AS DateTime), NULL, N'Nguyễn Đăng Tỉnh', N'1265895117', N'hue, le chi', N'tinhbidx@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 24, 0, CAST(5770000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 27, 0, CAST(5770000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (2, 26, 12, CAST(435000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (3, 25, 12, CAST(2535000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (1, N'Tivi Sony 21 inch', N'A01', N'tivi-sony-21', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/Assets/Client/images/feature-pic1.jpg', NULL, CAST(5770000 AS Decimal(18, 0)), NULL, NULL, 0, 2, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', NULL, CAST(N'2015-08-26 19:24:20.953' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (2, N'Bộ loa 2.0 Microlab', N'A02', N'bo-loa-20-microlab', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/Assets/Client/images/feature-pic2.jpg', NULL, CAST(435000 AS Decimal(18, 0)), CAST(235000 AS Decimal(18, 0)), 0, 12, 5, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', 12, CAST(N'2015-08-26 19:30:57.870' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (3, N'Máy ảnh Nikon', N'A03', N'may-anh-nikon', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/Assets/Client/images/feature-pic3.jpg', NULL, CAST(2535000 AS Decimal(18, 0)), CAST(2350000 AS Decimal(18, 0)), 0, 12, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', 12, CAST(N'2015-08-26 19:32:06.437' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (4, N'Tivi plasma siêu phẳng', N'A04', N'tivi-plasma-sieu-phang', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/Assets/Client/images/feature-pic4.jpg', NULL, CAST(12535000 AS Decimal(18, 0)), CAST(12350000 AS Decimal(18, 0)), 0, 12, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', 12, CAST(N'2015-08-26 19:33:18.800' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (5, N'Máy ảnh Sony', N'A05', N'may-anh-sony', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/Assets/Client/images/new-pic1.jpg', NULL, CAST(22535000 AS Decimal(18, 0)), NULL, 0, 23, 3, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', 12, CAST(N'2015-08-26 19:33:18.800' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, CAST(N'2019-08-30 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (6, N'Dàn karaoke 2.0', N'A06', N'dan-karaoke-20', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/Assets/Client/images/images/new-pic2.jpg', NULL, CAST(12535000 AS Decimal(18, 0)), NULL, 0, 44, 6, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', 12, CAST(N'2015-08-26 19:33:18.800' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (7, N'Máy giặt Electrolux', N'A07', N'may-giat-electrolux', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/Assets/Client/images/images/new-pic2.jpg', NULL, CAST(7535000 AS Decimal(18, 0)), NULL, 0, 44, 6, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', 12, CAST(N'2015-08-26 19:33:18.800' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (8, N'Đồng hồ đeo tay thời trang', N'A08', N'dong-ho-deo-tay-thoi-trang', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/Assets/Client/images/new-pic3.jpg', NULL, CAST(4300000 AS Decimal(18, 0)), NULL, NULL, 21, 7, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', NULL, CAST(N'2015-08-26 19:37:06.083' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-08-30 00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (1, N'Đồng hồ', N'dong-ho', NULL, 0, NULL, CAST(N'2015-08-26 19:00:44.567' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (2, N'Điện thoại', N'dien-thoai', NULL, 1, NULL, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'Máy tính để bàn', N'may-tinh-de-ban', NULL, 1, NULL, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (4, N'Máy tính xách tay', N'may-tinh-xach-tay', NULL, 1, NULL, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'Phụ kiện', N'phu-kien', NULL, 1, NULL, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (6, N'Phần mềm', N'phan-mem', NULL, 1, NULL, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (7, N'Thể thao', N'the-thao', NULL, 1, NULL, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (8, N'Thời trang', N'thoi-trang', NULL, 1, NULL, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (9, N'Trang sức', N'trang-suc', NULL, 1, NULL, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (10, N'Đồ nội thất', N'do-noi-that', NULL, 1, NULL, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (11, N'Làm đẹp', N'lam-dep', NULL, 1, NULL, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (12, N'ABC', N'abc', 1, 1, NULL, CAST(N'2015-09-05 00:25:30.690' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_CONTENT', N'Thêm tin tức')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', N'Thêm user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xoá user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_CONTENT', N'Sửa tin tức')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách user')
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'/assets/client/images/slide-2-image.jpg', 1, N'/', NULL, CAST(N'2015-08-26 19:21:44.440' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'/assets/client/images/slide-1-image.jpg', 2, N'/', NULL, CAST(N'2015-08-26 19:22:01.173' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'2', N'2')
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'thoi-su', N'thời sự')
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'tin-tuc', N'tin tức')
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (27, N'tinhnguyendangdx@gmail.com', N'c4ca4238a0b923820dcc509a6f75849b', N'Member', N'Nguyễn Đăng Tỉnh', N'Quảng Nam', N'', N'121', 101, 10153, CAST(N'2015-09-19 08:58:14.070' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [Username], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (44, N't@gmail.com', N'c4ca4238a0b923820dcc509a6f75849b', N'Admin', N'Nguyen Dang Tinh', N'Hue, An Cuu', N'tinhbidx@gmail.com', N'01263659419', NULL, NULL, CAST(N'2018-04-29 09:38:24.450' AS DateTime), N'Nguy?n Ðang T?nh', NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [Username], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10044, N'tinh@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Member', N'tinh bi', N'hue', N'tinhbidx2@gmail.com', NULL, NULL, NULL, CAST(N'2018-05-06 20:33:58.137' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'Admin', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'Member', N'Thành viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'Moderatior', N'Chủ tịch')
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Account_Login]    Script Date: 9/5/2018 9:04:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[Sp_Account_Login] 
	@Username VARCHAR(20), @Password VARCHAR(50)	
AS
BEGIN
	DECLARE @count INT
	DECLARE @res BIT
    SELECT @count = COUNT(*) FROM dbo.Account WHERE Username = @Username AND Password = @Password
	IF @count > 0
		SET @res = 1
	ELSE
		SET @res = 0
	SELECT @res
END

GO
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
