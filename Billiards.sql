USE [master]
GO
/****** Object:  Database [Billiards]    Script Date: 20/3/2018 9:53:44 AM ******/
CREATE DATABASE [Billiards]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Billiards', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Billiards.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Billiards_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Billiards_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Billiards] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Billiards].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Billiards] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Billiards] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Billiards] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Billiards] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Billiards] SET ARITHABORT OFF 
GO
ALTER DATABASE [Billiards] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Billiards] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Billiards] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Billiards] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Billiards] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Billiards] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Billiards] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Billiards] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Billiards] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Billiards] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Billiards] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Billiards] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Billiards] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Billiards] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Billiards] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Billiards] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Billiards] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Billiards] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Billiards] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Billiards] SET  MULTI_USER 
GO
ALTER DATABASE [Billiards] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Billiards] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Billiards] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Billiards] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Billiards]
GO
/****** Object:  StoredProcedure [dbo].[USP_CheckAccount]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_CheckAccount]
@username NVARCHAR(100)
AS
BEGIN
	SELECT Username FROM dbo.Account WHERE Username = @username
END


GO
/****** Object:  StoredProcedure [dbo].[USP_CheckPasswordForChangeMoneyPlayTime]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_CheckPasswordForChangeMoneyPlayTime] -- 7
@password nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE Password = @password
END


GO
/****** Object:  StoredProcedure [dbo].[USP_CheckPasswordForUpdateAccount]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_CheckPasswordForUpdateAccount] 
@password NVARCHAR(100)
AS
BEGIN
	SELECT Username FROM dbo.Account WHERE Password = @password AND Type = 1
END


GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteAccount]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_DeleteAccount]
@username NVARCHAR(100)
AS
BEGIN
	DELETE FROM dbo.Account WHERE Username = @username
END


GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteDebt]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_DeleteDebt]
@idDebt INT
AS
BEGIN
	DELETE FROM dbo.Debt WHERE IDDebt = @idDebt
END


GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUsername]    Script Date: 20/3/2018 9:53:44 AM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetListBillByDate]
@day INT, @month INT, @year INT
AS
BEGIN
	SELECT t.NameTable  , DateCheckIn , DateCheckOut , b.Hour, b.Minute, Discount  ,b.TotalPrice , b.IDBill
	FROM dbo.Bill AS b, dbo.TableFood AS t
	WHERE b.StatusBill = 1 AND t.IDTable = b.IDTable AND 
	DAY(DateCheckOut) = @day AND MONTH(DateCheckOut) = @month AND YEAR(DateCheckOut) = @year
	ORDER BY b.DateCheckOut DESC
END


GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDateAndPage]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetListBillByDateAndPage]
@day INT, @month INT, @year INT, @page int, @rowOfPage int
AS
BEGIN
	DECLARE @pageRows INT = @rowOfPage
	DECLARE @selectRows INT = @pageRows 
	DECLARE @exceptRows INT = (@page - 1) * @pageRows

	;WITH BillShow AS ( SELECT t.NameTable  , DateCheckIn , DateCheckOut , b.Hour, b.Minute, Discount  ,b.TotalPrice , b.IDBill
	FROM dbo.Bill AS b, dbo.TableFood AS t
	WHERE b.StatusBill = 1 AND t.IDTable = b.IDTable AND 
	DAY(DateCheckOut) = @day AND MONTH(DateCheckOut) = @month AND YEAR(DateCheckOut) = @year )  

	SELECT TOP (@selectRows) * FROM BillShow WHERE IDBill NOT IN (SELECT TOP (@exceptRows) IDBill FROM BillShow ORDER BY DateCheckOut DESC ) ORDER BY DateCheckOut DESC
END


GO
/****** Object:  StoredProcedure [dbo].[USP_GetNumBillByDate]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetNumBillByDate]
@day INT, @month INT, @year INT
AS
BEGIN
	SELECT  COUNT(*) 
	FROM dbo.Bill AS b, dbo.TableFood AS t
	WHERE DAY(DateCheckOut) = @day AND MONTH(DateCheckOut) = @month AND YEAR(DateCheckOut) = @year AND b.StatusBill = 1
	AND t.IDTable = b.IDTable
END


GO
/****** Object:  StoredProcedure [dbo].[USP_InsertAccount]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_InsertAccount]
@username NVARCHAR(100), @displayName NVARCHAR(100),
@password NVARCHAR(100), @type INT
AS
BEGIN
	INSERT dbo.Account( Username ,DisplayName ,Password ,Type) VALUES( @username ,@displayName , @password ,@type)
END


GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_InsertBill]     -- 11
@idTable INT
AS
BEGIN
INSERT dbo.Bill
        ( DateCheckIn ,
          DateCheckOut ,
          Hour ,
          Minute ,
          StatusBill ,
          Discount ,
          TotalPrice ,
          IDTable
        )
VALUES  ( GETDATE() , -- DateCheckIn - datetime
          NULL , -- DateCheckOut - datetime
          0 , -- Hour - int
          0 , -- Minute - int
          0 , -- StatusBill - int
          0 , -- Discount - int
          0.0 , -- TotalPrice - float
          @idTable  -- IDTable - int
        )
END


GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 20/3/2018 9:53:44 AM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_InsertCategory]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_InsertCategory]
@nameCategory NVARCHAR(100)
AS
BEGIN
	INSERT dbo.FoodCategory( NameCategory ) VALUES  (@nameCategory)
END


GO
/****** Object:  StoredProcedure [dbo].[USP_InsertDebt]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_InsertDebt]
@nameDebt NVARCHAR(100), @money FLOAT, @idBill INT
AS
BEGIN
	INSERT dbo.Debt( NameDebt, Money, StatusDebt, IDBill )VALUES  ( @nameDebt,@money,N'Chưa trả nợ',@idBill)
END


GO
/****** Object:  StoredProcedure [dbo].[USP_InsertFood]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_InsertFood]
@nameFood NVARCHAR(100),@unit NVARCHAR(100),
@price FLOAT,@idCategory INT
AS
BEGIN
	INSERT dbo.Food( NameFood, Unit, Price, IDCategory )VALUES  ( @nameFood,@unit,@price,@idCategory)
END


GO
/****** Object:  StoredProcedure [dbo].[USP_InsertPlayTime]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_InsertPlayTime]
@moneyPlayTime FLOAT , @statusPlayTime NVARCHAR(100)
AS
BEGIN
	INSERT dbo.PlayTime( MoneyPlayTime, StatusPlayTime )VALUES  ( @moneyPlayTime,@statusPlayTime)
END


GO
/****** Object:  StoredProcedure [dbo].[USP_InsertTable]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_InsertTable]
@nameTable NVARCHAR(100)
AS
BEGIN
	INSERT dbo.TableFood( NameTable, StatusTable ) VALUES  ( @nameTable,N'Trống')
END


GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 20/3/2018 9:53:44 AM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_ResetPassword]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_ResetPassword]
@username NVARCHAR(100),@password NVARCHAR(100)
AS
BEGIN
	UPDATE dbo.Account SET Password = @password WHERE Username = @username
END


GO
/****** Object:  StoredProcedure [dbo].[USP_SearchAccount]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_SearchAccount]
@displayName NVARCHAR(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE dbo.fChuyenCoDauThanhKhongDau(DisplayName) LIKE N'%' + dbo.fChuyenCoDauThanhKhongDau(@displayName) + '%' 
END


GO
/****** Object:  StoredProcedure [dbo].[USP_SearchAccountByDisplayNameOrAdmin]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_SearchAccountByDisplayNameOrAdmin]
@displayName NVARCHAR(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE dbo.fChuyenCoDauThanhKhongDau(DisplayName) LIKE N'%' + dbo.fChuyenCoDauThanhKhongDau(@displayName) + '%' OR Type = 1
END


GO
/****** Object:  StoredProcedure [dbo].[USP_SearchAccountByDisplayNameOrStaff]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_SearchAccountByDisplayNameOrStaff]
@displayName NVARCHAR(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE dbo.fChuyenCoDauThanhKhongDau(DisplayName) LIKE N'%' + dbo.fChuyenCoDauThanhKhongDau(@displayName) + '%' OR Type = 0
END


GO
/****** Object:  StoredProcedure [dbo].[USP_SearchCategory]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[USP_SearchCategory]
@nameCategory NVARCHAR(100)
AS
BEGIN
	SELECT * FROM dbo.FoodCategory WHERE dbo.fChuyenCoDauThanhKhongDau(NameCategory) LIKE N'%' + dbo.fChuyenCoDauThanhKhongDau(@nameCategory) + '%' 
END


GO
/****** Object:  StoredProcedure [dbo].[USP_SearchDebt]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[USP_SearchDebt]
@nameDebt NVARCHAR(100)
AS
BEGIN
	SELECT * FROM dbo.Debt WHERE dbo.fChuyenCoDauThanhKhongDau(NameDebt) LIKE N'%' + dbo.fChuyenCoDauThanhKhongDau(@nameDebt) + '%' 
END


GO
/****** Object:  StoredProcedure [dbo].[USP_SearchDebtByNameDebtOrMoney]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_SearchDebtByNameDebtOrMoney]
@nameDebt NVARCHAR(100), @money FLOAT
AS
BEGIN
	SELECT * FROM dbo.Debt WHERE dbo.fChuyenCoDauThanhKhongDau(NameDebt) LIKE N'%' + dbo.fChuyenCoDauThanhKhongDau(@nameDebt) + '%' OR Money = @money
END


GO
/****** Object:  StoredProcedure [dbo].[USP_SearchFoodByName]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_SearchFoodByName]
@nameFood NVARCHAR(100)
AS
BEGIN
	SELECT * FROM dbo.Food WHERE dbo.fChuyenCoDauThanhKhongDau(NameFood) LIKE N'%' + dbo.fChuyenCoDauThanhKhongDau(@nameFood) + '%' 
END


GO
/****** Object:  StoredProcedure [dbo].[USP_SearchFoodByNameOrPrice]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_SearchFoodByNameOrPrice]
@nameFood NVARCHAR(100), @price FLOAT
AS
BEGIN
	SELECT * FROM dbo.Food WHERE dbo.fChuyenCoDauThanhKhongDau(NameFood) LIKE N'%' + dbo.fChuyenCoDauThanhKhongDau(@nameFood) + '%' OR Price = @price
END


GO
/****** Object:  StoredProcedure [dbo].[USP_SwitchTable]    Script Date: 20/3/2018 9:53:44 AM ******/
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

	SELECT @idSecondBill = IDBill FROM dbo.Bill WHERE IDTable = @idTable2 AND StatusBill = 0
	SELECT @idFirstBill = IDBill FROM dbo.Bill WHERE IDTable = @idTable1 AND StatusBill = 0

	PRINT @idFirstBill
	PRINT @idSecondBill
	PRINT '-------------'

	IF (@idFirstBill IS NULL)  -- nếu null thì tạo ra thằng mới
	BEGIN
		PRINT '0000001'
		INSERT dbo.Bill
		        ( DateCheckIn,
		          DateCheckOut ,
		          Hour,
				  Minute,
				  StatusBill ,
		          Discount,
				  TotalPrice,
				  IDTable 
		        )
		VALUES  ( (SELECT DateCheckIn FROM dbo.Bill WHERE IDTable = @idTable2 AND StatusBill = 0) , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
					0,
					0,
					0 , -- status - int
					0,  -- discount - int
					0,
					@idTable1  -- idTable - int
		        )
		--UPDATE dbo.Bill SET IDTable = @idTable1 WHERE IDTable = @idTable2
		--UPDATE dbo.TableFood SET StatusTable = N'Trống' WHERE IDTable = @idTable2
		--UPDATE dbo.TableFood SET StatusTable = N'Đang đánh' WHERE IDTable = @idTable1
		
		SELECT @idFirstBill =  MAX(IDBill) FROM dbo.Bill WHERE IDTable = @idTable1 AND StatusBill = 0
	END

	SELECT @isFirstTableEmty = COUNT(*) FROM dbo.BillInfo WHERE IDBill = @idFirstBill

	PRINT @idFirstBill
	PRINT @idSecondBill
	PRINT '-------------'

	IF (@idSecondBill IS NULL)  -- nếu null thì tạo ra thằng mới
	BEGIN
		PRINT '0000002'
		INSERT dbo.Bill
		        ( DateCheckIn,
		          DateCheckOut ,
				  Hour,
				  Minute,
				  StatusBill ,
		          Discount,
				  TotalPrice,
				  IDTable 
		        )
		VALUES  ( (SELECT DateCheckIn FROM dbo.Bill WHERE IDTable = @idTable1 AND StatusBill = 0) , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
					0,
					0,
					0 , -- status - int
					0,  -- discount - int
					0,
					@idTable2  -- idTable - int
		        )
		--UPDATE dbo.Bill SET IDTable = @idTable2 WHERE IDTable = @idTable1
		--UPDATE dbo.TableFood SET StatusTable = N'Trống' WHERE IDTable = @idTable1
		--UPDATE dbo.TableFood SET StatusTable = N'Đang đánh' WHERE IDTable = @idTable2
		SELECT @idSecondBill =  MAX(IDBill) FROM dbo.Bill WHERE IDTable = @idTable2 AND StatusBill = 0
		
		
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
		UPDATE dbo.TableFood SET StatusTable = N'Trống' WHERE IDTable = @idTable2

	IF (@isSecondTableEmty = 0)
		UPDATE dbo.TableFood SET StatusTable = N'Trống' WHERE IDTable = @idTable1
END


GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_UpdateAccount]
@username NVARCHAR(100), @displayName NVARCHAR(100), @type INT
AS
BEGIN
	UPDATE dbo.Account SET DisplayName = @displayName, Type = @type WHERE Username = @username
END


GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccountProfile]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_UpdateAccountProfile]
@userName NVARCHAR(100), @passwordNew NVARCHAR(100)
AS
BEGIN
	UPDATE dbo.Account SET Password = @passwordNew WHERE Username = @userName
END

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateCategory]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_UpdateCategory]
@idCategory INT, @nameCategory NVARCHAR(100)
AS
BEGIN
	UPDATE dbo.FoodCategory SET NameCategory = @nameCategory WHERE IDCategory = @idCategory
END


GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateDebt]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_UpdateDebt]
@idDebt INT, @nameDebt NVARCHAR(100), @money FLOAT, @idBill INT
AS
BEGIN
	UPDATE dbo.Debt SET NameDebt = @nameDebt, Money = @money,IDBill = @idBill WHERE IDDebt = @idDebt
END


GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateFood]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_UpdateFood]
@idFood INT, @nameFood NVARCHAR(100),@unit NVARCHAR(100),
@price FLOAT,@idCategory INT
AS
BEGIN
	UPDATE dbo.Food SET NameFood = @nameFood, Unit = @unit, Price = @price, IDCategory = @idCategory WHERE IDFood = @idFood
END


GO
/****** Object:  StoredProcedure [dbo].[USP_UpdatePlayTime]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_UpdatePlayTime]
@idPlayTime INT, @moneyPlayTime FLOAT , @statusPlayTime NVARCHAR(100)
AS
BEGIN
	UPDATE dbo.PlayTime SET MoneyPlayTime = @moneyPlayTime, StatusPlayTime = @statusPlayTime WHERE IDPlayTime = @idPlayTime
END


GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateTable]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_UpdateTable]
@idTable INT, @nameTable NVARCHAR(100)
AS
BEGIN
	UPDATE dbo.TableFood SET NameTable = @nameTable WHERE IDTable = @idTable
END


GO
/****** Object:  UserDefinedFunction [dbo].[fChuyenCoDauThanhKhongDau]    Script Date: 20/3/2018 9:53:44 AM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 20/3/2018 9:53:44 AM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[IDBill] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [datetime] NOT NULL DEFAULT (getdate()),
	[DateCheckOut] [datetime] NULL,
	[Hour] [int] NULL,
	[Minute] [int] NULL,
	[StatusBill] [int] NOT NULL DEFAULT ((0)),
	[Discount] [int] NULL,
	[TotalPrice] [float] NULL,
	[IDTable] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 20/3/2018 9:53:44 AM ******/
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
/****** Object:  Table [dbo].[Debt]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Debt](
	[IDDebt] [int] IDENTITY(1,1) NOT NULL,
	[NameDebt] [nvarchar](100) NOT NULL DEFAULT (N'Chưa có người nợ'),
	[Money] [float] NULL,
	[StatusDebt] [nvarchar](100) NOT NULL DEFAULT (N'Đã trả nợ'),
	[IDBill] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDDebt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[IDFood] [int] IDENTITY(1,1) NOT NULL,
	[NameFood] [nvarchar](100) NOT NULL DEFAULT (N'Chưa đặt tên'),
	[Unit] [nvarchar](100) NOT NULL DEFAULT (N'Chưa có tên'),
	[Price] [float] NOT NULL DEFAULT ((0)),
	[IDCategory] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDFood] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[IDCategory] [int] IDENTITY(1,1) NOT NULL,
	[NameCategory] [nvarchar](100) NOT NULL DEFAULT (N'Chưa đặt tên'),
PRIMARY KEY CLUSTERED 
(
	[IDCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlayTime]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayTime](
	[IDPlayTime] [int] IDENTITY(1,1) NOT NULL,
	[MoneyPlayTime] [int] NOT NULL CONSTRAINT [DF__PlayTime__MoneyP__5FB337D6]  DEFAULT ((1000)),
	[StatusPlayTime] [nvarchar](100) NOT NULL CONSTRAINT [DF__PlayTime__Status__60A75C0F]  DEFAULT (N'Không máy lạnh'),
 CONSTRAINT [PK__PlayTime__25078AAEBF08A62A] PRIMARY KEY CLUSTERED 
(
	[IDPlayTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 20/3/2018 9:53:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[IDTable] [int] IDENTITY(1,1) NOT NULL,
	[NameTable] [nvarchar](100) NOT NULL DEFAULT (N'Chưa có tên'),
	[StatusTable] [nvarchar](100) NOT NULL DEFAULT (N'Trống'),
PRIMARY KEY CLUSTERED 
(
	[IDTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [DisplayName], [Password], [Type]) VALUES (N'admin', N'Nguyễn Đăng Tỉnh', N'C8qiotBAbGg=', 1)
INSERT [dbo].[Account] ([Username], [DisplayName], [Password], [Type]) VALUES (N'staff', N'staff', N'ei0nosl3xbs=', 0)
INSERT [dbo].[Account] ([Username], [DisplayName], [Password], [Type]) VALUES (N'staff2', N'Lê Thành', N'dpwR988bCIk=', 0)
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (101, CAST(N'2018-01-09 22:09:13.580' AS DateTime), CAST(N'2018-01-09 22:09:59.890' AS DateTime), 0, 0, 1, 0, 32000, 4)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (104, CAST(N'2018-01-09 22:10:08.350' AS DateTime), CAST(N'2018-01-09 22:12:21.173' AS DateTime), 0, 2, 1, 0, 666, 4)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (106, CAST(N'2018-01-09 22:12:40.747' AS DateTime), CAST(N'2018-01-09 22:13:27.907' AS DateTime), 0, 0, 1, 0, 12000, 4)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (115, CAST(N'2018-01-09 22:13:43.927' AS DateTime), CAST(N'2018-01-09 22:19:17.573' AS DateTime), 0, 5, 1, 0, 1666, 3)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (121, CAST(N'2018-01-09 22:19:25.653' AS DateTime), CAST(N'2018-01-09 22:20:30.307' AS DateTime), 0, 1, 1, 0, 12333, 4)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (122, CAST(N'2018-01-09 22:27:33.330' AS DateTime), CAST(N'2018-01-11 21:21:34.933' AS DateTime), 46, 53, 1, 20, 757332.8, 3)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (123, CAST(N'2018-01-09 22:27:36.997' AS DateTime), CAST(N'2018-01-09 22:27:57.093' AS DateTime), 0, 0, 1, 0, 0, 4)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (124, CAST(N'2018-01-09 22:28:02.443' AS DateTime), CAST(N'2018-01-11 21:56:52.100' AS DateTime), 47, 28, 1, 50, 474666.5, 5)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (126, CAST(N'2018-01-11 21:56:55.060' AS DateTime), CAST(N'2018-01-11 22:37:38.377' AS DateTime), 0, 40, 1, 0, 20333, 1)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (127, CAST(N'2018-01-11 21:57:08.933' AS DateTime), CAST(N'2018-01-12 00:03:11.513' AS DateTime), 2, 6, 1, 0, 62000, 5)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (128, CAST(N'2018-01-12 00:13:16.920' AS DateTime), CAST(N'2018-01-14 09:31:46.320' AS DateTime), 57, 18, 1, 10, 1039500, 6)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (129, CAST(N'2018-01-14 09:31:38.647' AS DateTime), CAST(N'2018-01-26 13:42:05.597' AS DateTime), 292, 10, 1, 0, 5855333, 2)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (130, CAST(N'2018-01-14 11:45:47.307' AS DateTime), CAST(N'2018-01-14 11:55:21.247' AS DateTime), 0, 9, 1, 0, 15000, 1)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (136, CAST(N'2018-01-26 14:39:02.113' AS DateTime), CAST(N'2018-01-27 20:33:52.420' AS DateTime), 29, 54, 1, 0, 682000, 1)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (137, CAST(N'2018-01-26 14:39:08.050' AS DateTime), CAST(N'2018-01-26 14:39:27.410' AS DateTime), 0, 0, 1, 0, 20000, 5)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (138, CAST(N'2018-01-27 10:47:25.430' AS DateTime), CAST(N'2018-01-27 20:23:42.450' AS DateTime), 9, 35, 1, 0, 199666, 6)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (139, CAST(N'2018-01-27 20:23:07.130' AS DateTime), CAST(N'2018-01-27 21:49:35.727' AS DateTime), 1, 26, 1, 0, 46666, 4)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (140, CAST(N'2018-01-27 20:34:54.610' AS DateTime), CAST(N'2018-01-27 23:10:28.130' AS DateTime), 2, 35, 1, 0, 80333, 2)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (141, CAST(N'2018-01-27 21:37:35.610' AS DateTime), CAST(N'2018-01-27 21:44:18.680' AS DateTime), 0, 6, 1, 0, 19500, 6)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (142, CAST(N'2018-01-27 21:49:21.097' AS DateTime), CAST(N'2018-01-27 22:44:10.133' AS DateTime), 0, 54, 1, 0, 33000, 6)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (143, CAST(N'2018-01-27 22:44:14.737' AS DateTime), CAST(N'2018-01-27 23:04:36.027' AS DateTime), 0, 20, 1, 0, 13666, 4)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (144, CAST(N'2018-01-27 23:03:10.417' AS DateTime), CAST(N'2018-01-27 23:03:20.050' AS DateTime), 0, 0, 1, 0, 0, 3)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (145, CAST(N'2018-01-27 23:05:17.303' AS DateTime), CAST(N'2018-01-27 23:09:17.597' AS DateTime), 0, 3, 1, 0, 16000, 5)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (147, CAST(N'2018-01-27 23:10:34.220' AS DateTime), CAST(N'2018-01-30 22:53:30.753' AS DateTime), 71, 42, 1, 0, 1457000, 6)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (148, CAST(N'2018-01-27 23:10:36.113' AS DateTime), CAST(N'2018-02-08 12:20:50.633' AS DateTime), 277, 9, 1, 0, 5558000, 6)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (155, CAST(N'2018-01-27 23:35:20.130' AS DateTime), CAST(N'2018-01-29 08:27:00.087' AS DateTime), 32, 50, 1, 0, 668666, 5)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (158, CAST(N'2018-01-27 23:10:30.213' AS DateTime), NULL, 0, 0, 0, 0, 0, 1)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (1156, CAST(N'2018-02-08 12:19:31.100' AS DateTime), CAST(N'2018-03-08 08:27:16.983' AS DateTime), 668, 7, 1, 0, 13376000, 3)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (1157, CAST(N'2018-03-08 08:27:19.420' AS DateTime), NULL, 0, 0, 0, 0, 0, 6)
INSERT [dbo].[Bill] ([IDBill], [DateCheckIn], [DateCheckOut], [Hour], [Minute], [StatusBill], [Discount], [TotalPrice], [IDTable]) VALUES (1158, CAST(N'2018-03-11 12:14:56.210' AS DateTime), NULL, 0, 0, 0, 0, 0, 4)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (65, 101, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (66, 101, 9, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (67, 101, 10, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (68, 106, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (69, 121, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (70, 122, 9, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (71, 127, 2, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (72, 127, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (73, 126, 7, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (74, 128, 9, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (75, 129, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (78, 130, 3, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (85, 136, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (86, 137, 11, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (87, 136, 3, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (88, 136, 17, 3)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (89, 138, 8, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (90, 139, 8, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (91, 139, 5, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (92, 140, 11, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (93, 141, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (94, 141, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (95, 142, 2, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (96, 140, 9, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (97, 143, 7, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (98, 145, 2, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (99, 158, 9, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (100, 147, 10, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (101, 147, 3, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (102, 155, 1, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (103, 148, 2, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (104, 158, 6, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (1102, 1156, 7, 2)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (1103, 1157, 5, 1)
INSERT [dbo].[BillInfo] ([IDBillInfo], [IDBill], [IDFood], [Count]) VALUES (1104, 1157, 1, 1)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
SET IDENTITY_INSERT [dbo].[Debt] ON 

INSERT [dbo].[Debt] ([IDDebt], [NameDebt], [Money], [StatusDebt], [IDBill]) VALUES (11, N'Bùi Văn Hùng', 50000, N'Chưa trả nợ', 147)
INSERT [dbo].[Debt] ([IDDebt], [NameDebt], [Money], [StatusDebt], [IDBill]) VALUES (14, N'Lê Thanh Nam', 50000, N'Chưa trả nợ', 128)
INSERT [dbo].[Debt] ([IDDebt], [NameDebt], [Money], [StatusDebt], [IDBill]) VALUES (17, N'Bùi Văn Hùng', 50000, N'Chưa trả nợ', 101)
INSERT [dbo].[Debt] ([IDDebt], [NameDebt], [Money], [StatusDebt], [IDBill]) VALUES (18, N'Văn Công Khánh', 15000, N'Chưa trả nợ', 137)
INSERT [dbo].[Debt] ([IDDebt], [NameDebt], [Money], [StatusDebt], [IDBill]) VALUES (19, N'Nguyễn Liêm', 11000, N'Chưa trả nợ', 137)
SET IDENTITY_INSERT [dbo].[Debt] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (1, N'Prince', N'Gói', 12000, 1)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (2, N'Con ngựa', N'Gói', 15000, 1)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (3, N'Mực nướng', N'Con', 12000, 4)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (4, N'Cá bò nướng', N'Con', 3000, 4)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (5, N'Singum', N'Tép', 5000, 5)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (6, N'Cool air', N'Gói', 1000, 5)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (7, N'Pepsi', N'Chai', 7000, 2)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (8, N'Sting', N'Chai', 8000, 2)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (9, N'Larue', N'Chai', 9000, 3)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (10, N'Tiger', N'Lon', 11000, 3)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (11, N'Dunhill', N'Gói', 20000, 1)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (16, N'Sài gòn', N'Lon', 16000, 3)
INSERT [dbo].[Food] ([IDFood], [NameFood], [Unit], [Price], [IDCategory]) VALUES (17, N'Henniken', N'Lon', 20000, 3)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([IDCategory], [NameCategory]) VALUES (1, N'Thuốc')
INSERT [dbo].[FoodCategory] ([IDCategory], [NameCategory]) VALUES (2, N'Nước giải khác')
INSERT [dbo].[FoodCategory] ([IDCategory], [NameCategory]) VALUES (3, N'Bia')
INSERT [dbo].[FoodCategory] ([IDCategory], [NameCategory]) VALUES (4, N'Nướng')
INSERT [dbo].[FoodCategory] ([IDCategory], [NameCategory]) VALUES (5, N'Kẹo')
INSERT [dbo].[FoodCategory] ([IDCategory], [NameCategory]) VALUES (6, N'Lẩu')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
SET IDENTITY_INSERT [dbo].[PlayTime] ON 

INSERT [dbo].[PlayTime] ([IDPlayTime], [MoneyPlayTime], [StatusPlayTime]) VALUES (1, 20000, N'Không máy lạnh')
INSERT [dbo].[PlayTime] ([IDPlayTime], [MoneyPlayTime], [StatusPlayTime]) VALUES (2, 25000, N'Có máy lạnh')
SET IDENTITY_INSERT [dbo].[PlayTime] OFF
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([IDTable], [NameTable], [StatusTable]) VALUES (1, N'Bàn số 1', N'Đang đánh')
INSERT [dbo].[TableFood] ([IDTable], [NameTable], [StatusTable]) VALUES (2, N'Bàn số 2', N'Trống')
INSERT [dbo].[TableFood] ([IDTable], [NameTable], [StatusTable]) VALUES (3, N'Bàn số 3', N'Trống')
INSERT [dbo].[TableFood] ([IDTable], [NameTable], [StatusTable]) VALUES (4, N'Bàn số 4', N'Đang đánh')
INSERT [dbo].[TableFood] ([IDTable], [NameTable], [StatusTable]) VALUES (5, N'Bàn số 5', N'Trống')
INSERT [dbo].[TableFood] ([IDTable], [NameTable], [StatusTable]) VALUES (6, N'Bàn số 6', N'Đang đánh')
SET IDENTITY_INSERT [dbo].[TableFood] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_TableFood] FOREIGN KEY([IDTable])
REFERENCES [dbo].[TableFood] ([IDTable])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_TableFood]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK_BillInfo_Bill] FOREIGN KEY([IDBill])
REFERENCES [dbo].[Bill] ([IDBill])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK_BillInfo_Bill]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK_BillInfo_Food] FOREIGN KEY([IDFood])
REFERENCES [dbo].[Food] ([IDFood])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK_BillInfo_Food]
GO
ALTER TABLE [dbo].[Debt]  WITH CHECK ADD  CONSTRAINT [FK_Debt_Bill] FOREIGN KEY([IDBill])
REFERENCES [dbo].[Bill] ([IDBill])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Debt] CHECK CONSTRAINT [FK_Debt_Bill]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_FoodCategory] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[FoodCategory] ([IDCategory])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_FoodCategory]
GO
/****** Object:  Trigger [dbo].[UTG_UpdateBill]    Script Date: 20/3/2018 9:53:44 AM ******/
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

	SELECT @idTable = IDTable FROM dbo.Bill WHERE IDBill = @idBill

	DECLARE @count INT = 0

	SELECT @count = COUNT(*) FROM dbo.Bill WHERE IDTable = @idTable AND StatusBill = 0

	IF (@count = 0)  -- không có bill nào hết
		UPDATE dbo.TableFood SET StatusTable = N'Trống' WHERE IDTable = @idTable
END


GO
/****** Object:  Trigger [dbo].[UTG_UpdateBillInfo]    Script Date: 20/3/2018 9:53:44 AM ******/
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

	SELECT @idTable = IDTable FROM dbo.Bill WHERE IDBill = @idBill AND StatusBill = 0

	DECLARE @count INT
	SELECT @count = COUNT(*) FROM dbo.BillInfo WHERE IDBill = @idBill
	IF(@count > 0)
	BEGIN
		PRINT @idTable
		PRINT @idBill
		PRINT @count

		UPDATE dbo.TableFood SET StatusTable = N'Đang đánh' WHERE IDTable = @idTable
	END
	
	ELSE

	BEGIN
		PRINT @idTable
		PRINT @idBill
		PRINT @count

		UPDATE dbo.TableFood SET StatusTable = N'Trống' WHERE IDTable = @idTable	
	END
		
END


GO
/****** Object:  Trigger [dbo].[UTP_DeleteBillInfo]    Script Date: 20/3/2018 9:53:44 AM ******/
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
	SELECT @idBillInfo = Deleted.IDBillInfo, @idBill = IDBill FROM Deleted

	DECLARE @idTable INT
	SELECT @idTable = IDTable FROM dbo.Bill WHERE IDBill = @idBill
	
	DECLARE @count INT = 0;
	SELECT @count = COUNT(*) FROM dbo.BillInfo AS bi , dbo.Bill AS b WHERE b.IDBill = bi.idBill AND b.IDBill = @idBill AND b.StatusBill = 0

	IF(@count = 0)
		UPDATE dbo.TableFood SET StatusTable = N'Trống' WHERE IDTable = @idTable
END


GO
USE [master]
GO
ALTER DATABASE [Billiards] SET  READ_WRITE 
GO
