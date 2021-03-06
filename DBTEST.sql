USE [master]
GO
/****** Object:  Database [DBTEST]    Script Date: 5/3/2018 5:13:12 PM ******/
CREATE DATABASE [DBTEST]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBTEST', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS2017\MSSQL\DATA\DBTEST.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBTEST_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS2017\MSSQL\DATA\DBTEST_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBTEST] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBTEST].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBTEST] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBTEST] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBTEST] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBTEST] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBTEST] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBTEST] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBTEST] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBTEST] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBTEST] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBTEST] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBTEST] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBTEST] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBTEST] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBTEST] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBTEST] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBTEST] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBTEST] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBTEST] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBTEST] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBTEST] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBTEST] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBTEST] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBTEST] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBTEST] SET  MULTI_USER 
GO
ALTER DATABASE [DBTEST] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBTEST] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBTEST] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBTEST] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBTEST] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBTEST] SET QUERY_STORE = OFF
GO
USE [DBTEST]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DBTEST]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/3/2018 5:13:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ShipAddress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Customers] UNIQUE NONCLUSTERED 
(
	[FirstName] ASC,
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/3/2018 5:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[UnitPrice] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Products] UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/3/2018 5:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[OrderCount] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Orders]    Script Date: 5/3/2018 5:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Orders]
AS
SELECT        C.CustomerID, C.FirstName + ' ' + C.LastName AS CustomerName, C.ShipAddress, P.ProductName, P.UnitPrice, O.OrderCount, O.OrderCount AS Expr1, P.UnitPrice * O.OrderCount AS TotalPrice, O.OrderID
FROM            dbo.Orders AS O INNER JOIN
                         dbo.Customers AS C ON O.CustomerID = C.CustomerID INNER JOIN
                         dbo.Products AS P ON O.ProductID = P.ProductID
GO
/****** Object:  View [dbo].[View_NotPurchased]    Script Date: 5/3/2018 5:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_NotPurchased]
AS
SELECT        ProductID, ProductName, UnitPrice
FROM            dbo.Products AS P
WHERE        (ProductID NOT IN
                             (SELECT        ProductID
                               FROM            dbo.Orders))
GO
/****** Object:  UserDefinedFunction [dbo].[HitungTotalHarga]    Script Date: 5/3/2018 5:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[HitungTotalHarga] (@Order_Count NUMERIC(18,2), @UnitPrice NUMERIC(18,2))
RETURNS NUMERIC (18,2)
WITH SCHEMABINDING AS
BEGIN
	DECLARE @TotalPrice NUMERIC(18,2)
	SET @TotalPrice=@Order_Count*@UnitPrice
	RETURN @TotalPrice;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[HitungTotalSallary]    Script Date: 5/3/2018 5:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[HitungTotalSallary] (@MonthlySallary NUMERIC(18,2))
RETURNS NUMERIC (18,2)
WITH SCHEMABINDING AS
BEGIN
	DECLARE @YearlySallary NUMERIC(18,2)
	SET @YearlySallary=@MonthlySallary*12
	RETURN @YearlySallary;
END;
GO
/****** Object:  Table [dbo].[ALAMAT]    Script Date: 5/3/2018 5:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALAMAT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ALAMAT] [varchar](50) NULL,
	[ID_KECAMATAN_FK] [int] NULL,
 CONSTRAINT [PK__ALAMAT__3214EC27B1814D40] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BUNGA_FLAT]    Script Date: 5/3/2018 5:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUNGA_FLAT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[ShipAddress] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/3/2018 5:13:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Sallary] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Employees] UNIQUE NONCLUSTERED 
(
	[FullName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees_BAK]    Script Date: 5/3/2018 5:13:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees_BAK](
	[EmployeeID] [int] NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Sallary] [numeric](18, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KECAMATAN]    Script Date: 5/3/2018 5:13:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KECAMATAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KECAMATAN] [varchar](50) NULL,
 CONSTRAINT [PK__KECAMATA__3214EC278ACCDE47] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_ALAMAT]    Script Date: 5/3/2018 5:13:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_ALAMAT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JALAN] [varchar](255) NULL,
	[KODE_POS] [varchar](5) NULL,
	[KOTA] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_PERSON]    Script Date: 5/3/2018 5:13:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_PERSON](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LAST_NAME] [varchar](15) NULL,
	[FIRST_NAME] [varchar](15) NULL,
	[AGE] [int] NULL,
	[ID_ALAMAT_FK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENT]    Script Date: 5/3/2018 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAMA] [varchar](50) NULL,
	[ID_ALAMAT_FK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALAMAT]  WITH CHECK ADD  CONSTRAINT [FK2bh5thj0b1yg34tvtdc4q3j54] FOREIGN KEY([ID_KECAMATAN_FK])
REFERENCES [dbo].[KECAMATAN] ([ID])
GO
ALTER TABLE [dbo].[ALAMAT] CHECK CONSTRAINT [FK2bh5thj0b1yg34tvtdc4q3j54]
GO
ALTER TABLE [dbo].[M_PERSON]  WITH CHECK ADD  CONSTRAINT [FKclv71pjc3c99avfayy5248kot] FOREIGN KEY([ID_ALAMAT_FK])
REFERENCES [dbo].[M_ALAMAT] ([ID])
GO
ALTER TABLE [dbo].[M_PERSON] CHECK CONSTRAINT [FKclv71pjc3c99avfayy5248kot]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[STUDENT]  WITH CHECK ADD  CONSTRAINT [FKrm5swhlht39sbrbencxjycunm] FOREIGN KEY([ID_ALAMAT_FK])
REFERENCES [dbo].[ALAMAT] ([ID])
GO
ALTER TABLE [dbo].[STUDENT] CHECK CONSTRAINT [FKrm5swhlht39sbrbencxjycunm]
GO
/****** Object:  StoredProcedure [dbo].[spGetNew]    Script Date: 5/3/2018 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetNew] --nama bebas
		@CustomerID_New int,
		@FirstName_New NVARCHAR(50),
		@LastName_New NVARCHAR(50),
		@ShipAddress_New NVARCHAR(50),
		@ProductID_New int,
		@ProductName_New NVARCHAR(50),
		@UnitPrice_New NUMERIC(18,2),
		@OrderID_New int,
		@CustomerID_O_New int,
		@PoductID_O_New int,
		@OrderCount_New int,
		@OrderDate_New date
AS
BEGIN
	INSERT INTO
		Customers
	VALUES 
		(@CustomerID_New, @FirstName_New, @LastName_New, @ShipAddress_New )
	INSERT INTO
		Products
	VALUES 
		(@ProductID_New, @ProductName_New,  @UnitPrice_New )
	INSERT INTO
		Orders
	VALUES 
		(@OrderID_New, @CustomerID_O_New, @PoductID_O_New, @OrderCount_New, @OrderDate_New )		
		
END
GO
/****** Object:  StoredProcedure [dbo].[spGetOrders]    Script Date: 5/3/2018 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[spGetOrders] --nama bebas
	@Current_OrderID INT = 1 --ngasih variabel, bisa ditambah nilai default seperti 1
AS
BEGIN
	DECLARE @CustomerNameX NVARCHAR(255) --Mendeklarasi variabel baru
	
	IF (@Current_OrderID=1) --ngasih kondisi
		SET @CustomerNameX = 'Bla.. Bla..' --Proses yang dilakukan variabel baru, bisa perhitungan dll.
	
	IF (@Current_OrderID=2) --ngasih kondisi2
		SET @CustomerNameX = 'zzz zzz'
/*
		 
--content
	SELECT
		C.CustomerID,
		CustomerName=C.FirstName+' '+C.LastName,
		C.ShipAddress,
		p.ProductName,
		P.UnitPrice,
		O.OrderCount,
		O.OrderCount,
		TotalPrice=UnitPrice*OrderCount,
		@CustomerNameX AS Ket -- Pemanggilan Variabel Baru
	FROM
		Orders O
		INNER JOIN Customers C ON O.CustomerID = C.CustomerID
		INNER JOIN Products P ON O.ProductID = P.ProductID
	WHERE
		O.OrderID = @Current_OrderID */
		
SELECT * , @CustomerNameX AS Ket FROM View_Orders
WHERE OrderID = @Current_OrderID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetProducts]    Script Date: 5/3/2018 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetProducts] --nama bebas
	@Current_ProductID INT
AS
BEGIN
	SELECT
		P.*
	FROM
		Products P
	WHERE 
		P.ProductID NOT IN (SELECT ProductID FROM Orders)
		AND
		P.ProductID = @Current_ProductID
END
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
         Begin Table = "P"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_NotPurchased'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_NotPurchased'
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
         Begin Table = "O"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Orders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Orders'
GO
USE [master]
GO
ALTER DATABASE [DBTEST] SET  READ_WRITE 
GO
