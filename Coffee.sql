USE [master]
GO
/****** Object:  Database [Coffee]    Script Date: 20/3/2018 9:54:36 AM ******/
CREATE DATABASE [Coffee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Coffee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Coffee.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Coffee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Coffee_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Coffee] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Coffee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Coffee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Coffee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Coffee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Coffee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Coffee] SET ARITHABORT OFF 
GO
ALTER DATABASE [Coffee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Coffee] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Coffee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Coffee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Coffee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Coffee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Coffee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Coffee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Coffee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Coffee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Coffee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Coffee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Coffee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Coffee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Coffee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Coffee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Coffee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Coffee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Coffee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Coffee] SET  MULTI_USER 
GO
ALTER DATABASE [Coffee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Coffee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Coffee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Coffee] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Coffee]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUsername]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetAccountByUsername] --4
@userName nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE Username = @userName
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetListBillByDate]
@checkIn date, @checkOut date
AS
BEGIN
	SELECT  t.Name  , DateCheckIn , DateCheckOut , Discount  ,b.TotalPrice , b.IDBill
	FROM dbo.Bill AS b, dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.Status = 1
	AND t.IDTableFood = b.IDTableFood ORDER BY b.DateCheckOut DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDateAndPage]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetListBillByDateAndPage]
@checkIn date, @checkOut date, @page int, @rowOfPage int
AS
BEGIN
	DECLARE @pageRows INT = @rowOfPage
	DECLARE @selectRows INT = @pageRows 
	DECLARE @exceptRows INT = (@page - 1) * @pageRows

	;WITH BillShow AS ( SELECT t.Name , DateCheckIn , DateCheckOut , Discount  ,b.TotalPrice , b.IDBill
	FROM dbo.Bill AS b, dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.Status = 1 
	AND t.IDTableFood = b.IDTableFood )  

	SELECT TOP (@selectRows) * FROM BillShow WHERE IDBill NOT IN (SELECT TOP (@exceptRows) IDBill FROM BillShow ORDER BY DateCheckOut DESC ) ORDER BY DateCheckOut DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetNumBillByDate]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetNumBillByDate]
@checkIn date, @checkOut date
AS
BEGIN
	SELECT  COUNT(*) 
	FROM dbo.Bill AS b, dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.Status = 1
	AND t.IDTableFood = b.IDTableFood
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetTableList] -- 8
AS 
	SELECT * FROM dbo.TableFood

GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBill]     -- 11
@idTableFood INT
AS
BEGIN
	INSERT dbo.Bill
	        ( DateCheckIn ,
	          DateCheckOut ,
	          IDTableFood ,
	          Status,
			  Discount
	        )
	VALUES  ( GETDATE() , -- DateCheckIn - date
	          NULL , -- DateCheckOut - date
	          @idTableFood , -- idTableFood - int
	          0,  -- status - int
			  0
	        )
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBillInfo]
@idBill INT, @idFood INT, @count INT
AS
BEGIN

	DECLARE @idExitBillInfo INT
	DECLARE @foodCount INT = 1
	SELECT @idExitBillInfo = b.IDBillInfo,@foodCount = b.Count 
	FROM dbo.BillInfo AS b 
	WHERE IDBill = @idBill AND IDFood = @idFood
	
	IF(@idExitBillInfo > 0) -- thức ăn có tồn tại
	BEGIN
		DECLARE @newCount INT = @foodCount + @count
		IF(@newCount > 0)
			UPDATE dbo.BillInfo SET Count = @foodCount + @count WHERE IDFood = @idFood
		ELSE
			DELETE dbo.BillInfo WHERE IDBill = @idBill AND IDFood = @idFood
	END

	ELSE	
	BEGIN
		INSERT dbo.BillInfo
	        ( IDBill, IDFood, Count )
		VALUES  ( @idBill, -- idBill - int
	          @idFood, -- idFood - int
	          @count  -- count - int
	          )
	END
END

GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Login] -- 7
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE Username = @userName AND Password = @passWord
END

GO
/****** Object:  StoredProcedure [dbo].[USP_SwitchTable]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_SwitchTable] -- chuyển bàn
@idTable1 INT , @idTable2 INT
AS
BEGIN
	DECLARE @idFirstBill INT
	DECLARE  @idSecondBill INT

	DECLARE @isFirstTableEmty INT = 1
	DECLARE @isSecondTableEmty INT = 1 

	SELECT @idSecondBill = IDBill FROM dbo.Bill WHERE IDTableFood = @idTable2 AND Status = 0
	SELECT @idFirstBill = IDBill FROM dbo.Bill WHERE IDTableFood = @idTable1 AND Status = 0

	PRINT @idFirstBill
	PRINT @idSecondBill
	PRINT '-------------'

	IF (@idFirstBill IS NULL)  -- nếu null thì tạo ra thằng mới
	BEGIN
		PRINT '0000001'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          IDTableFood ,
		          Status ,
		          Discount
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable1 , -- idTable - int
		          0 , -- status - int
		          0  -- discount - int
		        )
		SELECT @idFirstBill =  MAX(IDBill) FROM dbo.Bill WHERE IDTableFood = @idTable1 AND Status = 0

	END

	SELECT @isFirstTableEmty = COUNT(*) FROM dbo.BillInfo WHERE IDBill = @idFirstBill

	PRINT @idFirstBill
	PRINT @idSecondBill
	PRINT '-------------'

	IF (@idSecondBill IS NULL)  -- nếu null thì tạo ra thằng mới
	BEGIN
		PRINT '0000002'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          IDTableFood ,
		          Status ,
		          Discount
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable2 , -- idTable - int
		          0 , -- status - int
		          0  -- discount - int
		        )
		SELECT @idSecondBill =  MAX(IDBill) FROM dbo.Bill WHERE IDTableFood = @idTable2 AND Status = 0
		
		
	END

	SELECT @isSecondTableEmty = COUNT(*) FROM dbo.BillInfo WHERE IDBill = @idSecondBill
	
	PRINT @idFirstBill
	PRINT @idSecondBill
	PRINT '-------------'

	SELECT IDBillInfo INTO IDBillInfoTable FROM dbo.BillInfo WHERE IDBill = @idSecondBill

	UPDATE dbo.BillInfo SET IDBill = @idSecondBill WHERE IDBill = @idFirstBill -- chuyển tất cả billInfo của thằng đầu tiên qua thằng thứ 2

	UPDATE dbo.BillInfo SET IDBill = @idFirstBill WHERE IDBillInfo IN (SELECT * FROM IDBillInfoTable) -- chuyển tất cả billInfo của thằng thứ 2  
																								-- qua thằng đầu tiền với điều kiện mặc định từ đầu
	DROP TABLE IDBillInfoTable

	IF (@isFirstTableEmty = 0)
		UPDATE dbo.TableFood SET Status = N'Trống' WHERE IDTableFood = @idTable2

	IF (@isSecondTableEmty = 0)
		UPDATE dbo.TableFood SET Status = N'Trống' WHERE IDTableFood = @idTable1
END

GO
/****** Object:  UserDefinedFunction [dbo].[fChuyenCoDauThanhKhongDau]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fChuyenCoDauThanhKhongDau](@inputVar NVARCHAR(MAX) ) -- chuyển chuỗi thành không dấu
RETURNS NVARCHAR(MAX)
AS
BEGIN    
    IF (@inputVar IS NULL OR @inputVar = '')  RETURN ''
   
    DECLARE @RT NVARCHAR(MAX)
    DECLARE @SIGN_CHARS NCHAR(256)
    DECLARE @UNSIGN_CHARS NCHAR (256)
 
    SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' + NCHAR(272) + NCHAR(208)
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyyAADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD'
 
    DECLARE @COUNTER int
    DECLARE @COUNTER1 int
   
    SET @COUNTER = 1
    WHILE (@COUNTER <= LEN(@inputVar))
    BEGIN  
        SET @COUNTER1 = 1
        WHILE (@COUNTER1 <= LEN(@SIGN_CHARS) + 1)
        BEGIN
            IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@inputVar,@COUNTER ,1))
            BEGIN          
                IF @COUNTER = 1
                    SET @inputVar = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@inputVar, @COUNTER+1,LEN(@inputVar)-1)      
                ELSE
                    SET @inputVar = SUBSTRING(@inputVar, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@inputVar, @COUNTER+1,LEN(@inputVar)- @COUNTER)
                BREAK
            END
            SET @COUNTER1 = @COUNTER1 +1
        END
        SET @COUNTER = @COUNTER +1
    END
    -- SET @inputVar = replace(@inputVar,' ','-')
    RETURN @inputVar
END

GO
/****** Object:  Table [dbo].[Account]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL DEFAULT (N'Chưa xác định'),
	[Password] [nvarchar](1000) NOT NULL DEFAULT ((0)),
	[Type] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[IDBill] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [datetime] NOT NULL CONSTRAINT [DF__Bill__DateCheckI__6D0D32F4]  DEFAULT (getdate()),
	[DateCheckOut] [datetime] NULL,
	[IDTableFood] [int] NOT NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF__Bill__Status__6E01572D]  DEFAULT ((0)),
	[Discount] [int] NULL,
	[TotalPrice] [float] NULL,
 CONSTRAINT [PK__Bill__23BDC1E6D815AD1F] PRIMARY KEY CLUSTERED 
(
	[IDBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[IDBillInfo] [int] IDENTITY(1,1) NOT NULL,
	[IDBill] [int] NOT NULL,
	[IDFood] [int] NOT NULL,
	[Count] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[IDBillInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[IDFood] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL CONSTRAINT [DF__Food__Name__68487DD7]  DEFAULT (N'Chưa đặt tên'),
	[Price] [float] NOT NULL CONSTRAINT [DF__Food__Price__693CA210]  DEFAULT ((0)),
	[IDFoodCategory] [int] NOT NULL,
 CONSTRAINT [PK__Food__274109E444247EA3] PRIMARY KEY CLUSTERED 
(
	[IDFood] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[IDFoodCategory] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL DEFAULT (N'Chưa đặt tên'),
PRIMARY KEY CLUSTERED 
(
	[IDFoodCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 20/3/2018 9:54:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[IDTableFood] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL DEFAULT (N'Chưa có tên'),
	[Status] [nvarchar](100) NOT NULL DEFAULT (N'Trống'),
PRIMARY KEY CLUSTERED 
(
	[IDTableFood] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [DisplayName], [Password], [Type]) VALUES (N'admin', N'Nguyễn Đăng Tỉnh', N'C8qiotBAbGg=', 1)
INSERT [dbo].[Account] ([Username], [DisplayName], [Password], [Type]) VALUES (N'staff', N'staff', N'ei0nosl3xbs=', 0)
INSERT [dbo].[Account] ([Username], [DisplayName], [Password], [Type]) VALUES (N'staff2', N'staff2', N'nJWttVYrEbw=', 1)
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (80, CAST(N'2018-01-02 16:17:18.593' AS DateTime), CAST(N'2018-01-02 23:01:43.043' AS DateTime), 1, 1, 0, 120000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (81, CAST(N'2018-01-02 23:05:34.237' AS DateTime), CAST(N'2018-01-02 23:05:44.157' AS DateTime), 1, 1, 0, 720000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (82, CAST(N'2018-01-02 23:11:04.580' AS DateTime), CAST(N'2018-01-02 23:11:06.490' AS DateTime), 1, 1, 0, 20000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (83, CAST(N'2018-01-02 23:29:20.807' AS DateTime), CAST(N'2018-01-02 23:35:18.360' AS DateTime), 4, 1, 0, 132000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (84, CAST(N'2018-01-02 23:33:54.743' AS DateTime), CAST(N'2018-01-02 23:35:30.560' AS DateTime), 4, 1, 0, 12000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (85, CAST(N'2018-01-03 00:58:23.193' AS DateTime), CAST(N'2018-01-03 00:58:33.350' AS DateTime), 1, 1, 0, 120000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (86, CAST(N'2018-01-03 00:58:26.993' AS DateTime), CAST(N'2018-01-03 00:58:30.813' AS DateTime), 7, 1, 0, 120000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (87, CAST(N'2018-01-03 00:59:49.973' AS DateTime), CAST(N'2018-01-03 22:43:16.197' AS DateTime), 1, 1, 0, 379800)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (88, CAST(N'2018-01-03 12:17:29.153' AS DateTime), CAST(N'2018-01-03 12:17:34.860' AS DateTime), 7, 1, 0, 120000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (89, CAST(N'2018-01-03 12:17:48.620' AS DateTime), CAST(N'2018-01-03 12:17:56.977' AS DateTime), 4, 1, 0, 70000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (90, CAST(N'2018-01-03 12:18:11.927' AS DateTime), CAST(N'2018-01-03 12:18:26.993' AS DateTime), 7, 1, 10, 657000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (94, CAST(N'2018-01-03 12:18:57.217' AS DateTime), CAST(N'2018-01-03 12:18:59.713' AS DateTime), 6, 1, 10, 121500)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (95, CAST(N'2018-01-03 16:08:19.323' AS DateTime), CAST(N'2018-01-03 16:42:28.387' AS DateTime), 20, 1, 0, 120000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (96, CAST(N'2018-01-03 16:42:07.353' AS DateTime), CAST(N'2018-01-03 21:39:02.683' AS DateTime), 12, 1, 50, 6000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (97, CAST(N'2018-01-03 21:39:08.470' AS DateTime), CAST(N'2018-01-03 21:39:37.510' AS DateTime), 8, 1, 20, 96000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (98, CAST(N'2018-01-03 21:39:46.030' AS DateTime), CAST(N'2018-01-03 21:48:04.620' AS DateTime), 11, 1, 30, 56000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (99, CAST(N'2018-01-03 21:49:35.107' AS DateTime), CAST(N'2018-01-03 21:52:34.030' AS DateTime), 16, 1, 50, 60000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (100, CAST(N'2018-01-03 21:50:07.893' AS DateTime), CAST(N'2018-01-03 22:41:44.727' AS DateTime), 12, 1, 50, 6000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (101, CAST(N'2018-01-03 21:50:35.580' AS DateTime), CAST(N'2018-01-03 21:50:53.170' AS DateTime), 15, 1, 15, 68000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (102, CAST(N'2018-01-03 22:44:35.107' AS DateTime), CAST(N'2018-01-03 22:47:36.787' AS DateTime), 16, 1, 10, 45000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (103, CAST(N'2018-01-03 22:47:43.500' AS DateTime), CAST(N'2018-01-03 22:48:22.717' AS DateTime), 11, 1, 20, 9600)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (104, CAST(N'2018-01-03 22:54:15.213' AS DateTime), CAST(N'2018-01-03 22:57:07.287' AS DateTime), 8, 1, 50, 6000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (105, CAST(N'2018-01-03 23:05:18.117' AS DateTime), CAST(N'2018-01-03 23:06:25.237' AS DateTime), 8, 1, 10, 72000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (106, CAST(N'2018-01-03 23:06:29.000' AS DateTime), CAST(N'2018-01-03 23:07:21.273' AS DateTime), 12, 1, 10, 82800)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (107, CAST(N'2018-01-03 23:07:48.047' AS DateTime), CAST(N'2018-01-03 23:15:57.890' AS DateTime), 12, 1, 10, 180000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (108, CAST(N'2018-01-03 23:20:01.110' AS DateTime), NULL, 12, 0, 0, NULL)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (109, CAST(N'2018-01-04 01:06:33.127' AS DateTime), CAST(N'2018-01-04 01:07:10.057' AS DateTime), 7, 1, 0, 80000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (110, CAST(N'2018-01-04 01:06:36.713' AS DateTime), CAST(N'2018-01-04 01:07:30.427' AS DateTime), 10, 1, 40, 12000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (111, CAST(N'2018-01-04 11:58:22.027' AS DateTime), CAST(N'2018-01-04 11:58:55.197' AS DateTime), 11, 1, 10, 118800)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (112, CAST(N'2018-01-04 17:02:45.060' AS DateTime), CAST(N'2018-01-04 17:25:28.827' AS DateTime), 15, 1, 0, 194000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (113, CAST(N'2018-01-04 17:02:49.553' AS DateTime), CAST(N'2018-01-04 17:25:35.523' AS DateTime), 15, 1, 0, 182000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (114, CAST(N'2018-01-04 17:22:07.547' AS DateTime), CAST(N'2018-01-04 17:25:39.730' AS DateTime), 15, 1, 0, 62000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (115, CAST(N'2018-01-04 17:25:06.727' AS DateTime), CAST(N'2018-01-04 17:25:45.343' AS DateTime), 15, 1, 0, 50000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (116, CAST(N'2018-01-04 17:25:51.000' AS DateTime), CAST(N'2018-01-04 19:32:15.143' AS DateTime), 6, 1, 0, 12000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (117, CAST(N'2018-01-04 17:30:20.860' AS DateTime), CAST(N'2018-01-04 17:34:42.013' AS DateTime), 10, 1, 0, 120000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (118, CAST(N'2018-01-04 17:34:46.710' AS DateTime), CAST(N'2018-01-27 10:45:58.313' AS DateTime), 8, 1, 0, 20000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (119, CAST(N'2018-01-04 19:28:38.780' AS DateTime), CAST(N'2018-01-04 19:28:58.863' AS DateTime), 7, 1, 50, 10000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (120, CAST(N'2018-01-04 19:29:46.770' AS DateTime), CAST(N'2018-01-04 19:29:54.237' AS DateTime), 11, 1, 0, 50000)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (121, CAST(N'2018-01-04 19:32:20.250' AS DateTime), NULL, 9, 0, 0, NULL)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [IDTableFood], [Status], [Discount], [TotalPrice]) VALUES (122, CAST(N'2018-01-08 23:29:00.130' AS DateTime), NULL, 14, 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (265, 80, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (266, 81, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (267, 81, 23, 5)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (268, 82, 7, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (269, 83, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (270, 84, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (271, 85, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (272, 86, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (273, 87, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (274, 87, 7, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (275, 87, 9, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (276, 87, 23, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (277, 87, 25, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (278, 88, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (279, 89, 7, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (280, 89, 9, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (281, 90, 4, 8)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (282, 90, 8, 3)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (286, 94, 6, 9)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (287, 95, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (288, 96, 25, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (289, 97, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (290, 98, 4, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (291, 99, 23, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (292, 100, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (293, 101, 4, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (294, 102, 9, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (295, 103, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (296, 104, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (297, 105, 4, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (298, 106, 4, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (299, 106, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (300, 107, 3, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (301, 107, 9, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (302, 108, 4, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (303, 108, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (304, 109, 4, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (305, 110, 7, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (306, 108, 9, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (307, 111, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (308, 111, 23, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (309, 112, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (310, 113, 23, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (311, 114, 25, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (312, 115, 9, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (313, 116, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (314, 117, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (315, 122, 7, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (316, 119, 7, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (317, 120, 9, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (318, 118, 7, 1)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (1, N'Mực một nắng nước sa tế', 120000, 1)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (2, N'Nghêu hấp xả', 50000, 1)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (3, N'Dú dê nướng sữa', 100000, 2)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (4, N'Heo rừng nướng muối ớt', 80000, 3)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (5, N'Nước giải khác', 12000, 4)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (6, N'Cafe', 15000, 4)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (7, N'Bia tươi', 20000, 5)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (8, N'Bia hơi', 30000, 5)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (9, N'Rượu vodka', 50000, 6)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (10, N'Lẩu hải sản', 20000, 1)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (11, N'Chíp chíp', 48000, 1)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (12, N'Pepse', 8000, 4)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (23, N'Mỳ quảng', 120000, 11)
INSERT [dbo].[Food] ([IDFood], [Name], [Price], [IDFoodCategory]) VALUES (25, N'Chè thái', 15000, 10)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([IDFoodCategory], [Name]) VALUES (1, N'Hải sản')
INSERT [dbo].[FoodCategory] ([IDFoodCategory], [Name]) VALUES (2, N'Nông sản')
INSERT [dbo].[FoodCategory] ([IDFoodCategory], [Name]) VALUES (3, N'Lâm sản')
INSERT [dbo].[FoodCategory] ([IDFoodCategory], [Name]) VALUES (4, N'Nước')
INSERT [dbo].[FoodCategory] ([IDFoodCategory], [Name]) VALUES (5, N'Bia')
INSERT [dbo].[FoodCategory] ([IDFoodCategory], [Name]) VALUES (6, N'Rượu')
INSERT [dbo].[FoodCategory] ([IDFoodCategory], [Name]) VALUES (10, N'Chè')
INSERT [dbo].[FoodCategory] ([IDFoodCategory], [Name]) VALUES (11, N'Mỳ')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (1, N'Bàn 1', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (2, N'Bàn 2', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (3, N'Bàn 3', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (4, N'Bàn 4', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (5, N'Bàn 5', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (6, N'Bàn 6', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (7, N'Bàn 7', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (8, N'Bàn 8', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (9, N'Bàn 9', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (10, N'Bàn 10', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (11, N'Bàn 11', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (12, N'Bàn 12', N'Có người')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (13, N'Bàn 13', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (14, N'Bàn 14', N'Có người')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (15, N'Bàn 15', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (16, N'Bàn 16', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (17, N'Bàn 17', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (18, N'Bàn 18', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (19, N'Bàn 19', N'Trống')
INSERT [dbo].[TableFood] ([IDTableFood], [Name], [Status]) VALUES (20, N'Bàn 20', N'Trống')
SET IDENTITY_INSERT [dbo].[TableFood] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__TotalPrice__6EF57B66] FOREIGN KEY([IDTableFood])
REFERENCES [dbo].[TableFood] ([IDTableFood])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__TotalPrice__6EF57B66]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK__BillInfo__count__72C60C4A] FOREIGN KEY([IDBill])
REFERENCES [dbo].[Bill] ([IDBill])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK__BillInfo__count__72C60C4A]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK__BillInfo__IDFood__73BA3083] FOREIGN KEY([IDFood])
REFERENCES [dbo].[Food] ([IDFood])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK__BillInfo__IDFood__73BA3083]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK__Food__Price__6A30C649] FOREIGN KEY([IDFoodCategory])
REFERENCES [dbo].[FoodCategory] ([IDFoodCategory])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK__Food__Price__6A30C649]
GO
/****** Object:  Trigger [dbo].[UTG_UpdateBill]    Script Date: 20/3/2018 9:54:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UTG_UpdateBill]
ON [dbo].[Bill] FOR UPDATE
AS
BEGIN
	DECLARE @idBill INT

	SELECT @idBill = IDBill FROM Inserted

	DECLARE @idTable INT

	SELECT @idTable = IDTableFood FROM dbo.Bill WHERE IDBill = @idBill

	DECLARE @count INT = 0

	SELECT @count = COUNT(*) FROM dbo.Bill WHERE IDTableFood = @idTable AND Status = 0

	IF (@count = 0)  -- không có bill nào hết
		UPDATE dbo.TableFood SET Status = N'Trống' WHERE IDTableFood = @idTable
END

GO
/****** Object:  Trigger [dbo].[UTG_UpdateBillInfo]    Script Date: 20/3/2018 9:54:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UTG_UpdateBillInfo]
ON [dbo].[BillInfo] FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @idBill INT

	SELECT @idBill = IDBill FROM Inserted

	DECLARE @idTable INT

	SELECT @idTable = IDTableFood FROM dbo.Bill WHERE IDBill = @idBill AND Status = 0

	DECLARE @count INT
	SELECT @count = COUNT(*) FROM dbo.BillInfo WHERE IDBill = @idBill
	IF(@count > 0)
	BEGIN
		PRINT @idTable
		PRINT @idBill
		PRINT @count

		UPDATE dbo.TableFood SET Status = N'Có người' WHERE IDTableFood = @idTable
	END
	
	ELSE

	BEGIN
		PRINT @idTable
		PRINT @idBill
		PRINT @count

		UPDATE dbo.TableFood SET Status = N'Trống' WHERE IDTableFood = @idTable	
	END
		
END

GO
/****** Object:  Trigger [dbo].[UTP_DeleteBillInfo]    Script Date: 20/3/2018 9:54:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[UTP_DeleteBillInfo]
ON [dbo].[BillInfo] FOR DELETE
AS
BEGIN
	DECLARE @idBillInfo INT
	DECLARE @idBill INT
	SELECT @idBillInfo = IDBillInfo, @idBill = IDBill FROM Deleted

	DECLARE @idTable INT
	SELECT @idTable = IDTableFood FROM dbo.Bill WHERE IDBill = @idBill
	
	DECLARE @count INT = 0;
	SELECT @count = COUNT(*) FROM dbo.BillInfo AS bi , dbo.Bill AS b WHERE b.IDBill = bi.idBill AND b.IDBill = @idBill AND b.Status = 0

	IF(@count = 0)
		UPDATE dbo.TableFood SET Status = N'Trống' WHERE IDTableFood = @idTable
END
GO
USE [master]
GO
ALTER DATABASE [Coffee] SET  READ_WRITE 
GO
