USE [master]
GO
/****** Object:  Database [InventoryManagementSystem]    Script Date: 12/30/2024 8:13:43 AM ******/
CREATE DATABASE [InventoryManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryManagementSystem', FILENAME = N'D:\New folder\sfml\MSSQL16.SQLEXPRESS01\MSSQL\DATA\InventoryManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventoryManagementSystem_log', FILENAME = N'D:\New folder\sfml\MSSQL16.SQLEXPRESS01\MSSQL\DATA\InventoryManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [InventoryManagementSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventoryManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventoryManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [InventoryManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventoryManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InventoryManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventoryManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InventoryManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [InventoryManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventoryManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventoryManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InventoryManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InventoryManagementSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InventoryManagementSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [InventoryManagementSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [InventoryManagementSystem]
GO
/****** Object:  Table [dbo].[Alerts]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alerts](
	[AlertID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[CurrentStock] [int] NOT NULL,
	[MinimumStock] [int] NOT NULL,
	[ReorderQuantity] [int] NOT NULL,
	[SupplierName] [nvarchar](100) NOT NULL,
	[SupplierEmail] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AlertID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLogs]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLogs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Action] [nvarchar](100) NOT NULL,
	[TableAffected] [nvarchar](50) NULL,
	[ActionTime] [datetime] NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[ContactPerson] [nvarchar](100) NULL,
	[ContactNumber] [nvarchar](15) NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[OrderHistory] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SKU] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[Barcode] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[MinimumStock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderDetails]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetails](
	[PODetailID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PODetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[PurchaseOrderID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrderDetails]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderDetails](
	[SODetailID] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SODetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrders]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrders](
	[SalesOrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NULL,
	[OrderDate] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockMovements]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockMovements](
	[MovementID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[MovementType] [nvarchar](20) NULL,
	[Quantity] [int] NOT NULL,
	[MovementDate] [datetime] NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NOT NULL,
	[ContactName] [nvarchar](100) NULL,
	[Phone] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/30/2024 8:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](20) NULL,
	[CreatedAt] [datetime] NULL,
	[UserEmail] [nvarchar](100) NULL,
	[UserPhone] [nvarchar](15) NULL,
	[UserAddress] [nvarchar](255) NULL,
	[UserStatus] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alerts] ON 

INSERT [dbo].[Alerts] ([AlertID], [ProductID], [ProductName], [CurrentStock], [MinimumStock], [ReorderQuantity], [SupplierName], [SupplierEmail]) VALUES (3, 10, N'Drill Machine', 1, 3, 6, N'Tools Supplier Inc.', N'tools@example.com')
INSERT [dbo].[Alerts] ([AlertID], [ProductID], [ProductName], [CurrentStock], [MinimumStock], [ReorderQuantity], [SupplierName], [SupplierEmail]) VALUES (4, 9, N'Car Battery', 1, 2, 4, N'Automotive Supply Co.', N'automotive@example.com')
INSERT [dbo].[Alerts] ([AlertID], [ProductID], [ProductName], [CurrentStock], [MinimumStock], [ReorderQuantity], [SupplierName], [SupplierEmail]) VALUES (6, 2, N'Office Chair', 8, 10, 20, N'Office Furniture Ltd.', N'furniture@example.com')
INSERT [dbo].[Alerts] ([AlertID], [ProductID], [ProductName], [CurrentStock], [MinimumStock], [ReorderQuantity], [SupplierName], [SupplierEmail]) VALUES (8, 5, N'Novel', 8, 10, 20, N'Book World Inc.', N'books@example.com')
INSERT [dbo].[Alerts] ([AlertID], [ProductID], [ProductName], [CurrentStock], [MinimumStock], [ReorderQuantity], [SupplierName], [SupplierEmail]) VALUES (9, 8, N'Face Cream', 5, 10, 20, N'Beauty Supplies Ltd.', N'beauty@example.com')
SET IDENTITY_INSERT [dbo].[Alerts] OFF
GO
SET IDENTITY_INSERT [dbo].[AuditLogs] ON 

INSERT [dbo].[AuditLogs] ([LogID], [UserID], [Action], [TableAffected], [ActionTime], [Description]) VALUES (1, 1, N'INSERT', N'Products', CAST(N'2024-12-16T04:48:04.260' AS DateTime), N'Added initial product list')
INSERT [dbo].[AuditLogs] ([LogID], [UserID], [Action], [TableAffected], [ActionTime], [Description]) VALUES (2, 2, N'UPDATE', N'Suppliers', CAST(N'2024-12-16T04:48:04.260' AS DateTime), N'Updated supplier contact info')
INSERT [dbo].[AuditLogs] ([LogID], [UserID], [Action], [TableAffected], [ActionTime], [Description]) VALUES (3, 3, N'INSERT', N'PurchaseOrders', CAST(N'2024-12-16T04:48:04.260' AS DateTime), N'Added new purchase order')
INSERT [dbo].[AuditLogs] ([LogID], [UserID], [Action], [TableAffected], [ActionTime], [Description]) VALUES (4, 4, N'DELETE', N'SalesOrders', CAST(N'2024-12-16T04:48:04.260' AS DateTime), N'Cancelled a sales order')
INSERT [dbo].[AuditLogs] ([LogID], [UserID], [Action], [TableAffected], [ActionTime], [Description]) VALUES (5, 5, N'INSERT', N'StockMovements', CAST(N'2024-12-16T04:48:04.260' AS DateTime), N'Restocked inventory')
SET IDENTITY_INSERT [dbo].[AuditLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Electronics', N'Electronic gadgets and devices')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Furniture', N'Home and office furniture')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Clothing', N'Apparel and accessories')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Food', N'Groceries and perishables')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Books', N'Educational and fictional books')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (6, N'Toys', N'Kids and adult toys')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (7, N'Sports', N'Sports equipment')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (8, N'Beauty', N'Cosmetics and skincare')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (9, N'Automotive', N'Car parts and accessories')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (10, N'Tools', N'Hardware and tools')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactPerson], [ContactNumber], [EmailAddress], [OrderHistory]) VALUES (1, N'John Doe', N'Jane Doe', N'123-456-7890', N'john.doe@example.com', N'Order #101, Order #102')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactPerson], [ContactNumber], [EmailAddress], [OrderHistory]) VALUES (2, N'Alice Smith', N'Bob Smith', N'234-567-8901', N'alice.smith@example.com', N'Order #103')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactPerson], [ContactNumber], [EmailAddress], [OrderHistory]) VALUES (3, N'Eve Johnson', N'Charlie Johnson', N'345-678-9012', N'eve.johnson@example.com', N'Order #104, Order #105')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactPerson], [ContactNumber], [EmailAddress], [OrderHistory]) VALUES (4, N'Michael Brown', N'Sara Brown', N'456-789-0123', N'michael.brown@example.com', N'Order #106')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactPerson], [ContactNumber], [EmailAddress], [OrderHistory]) VALUES (5, N'Linda Davis', N'Tom Davis', N'567-890-1234', N'linda.davis@example.com', N'Order #107, Order #108')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactPerson], [ContactNumber], [EmailAddress], [OrderHistory]) VALUES (6, N'David Wilson', N'Laura Wilson', N'678-901-2345', N'david.wilson@example.com', N'Order #100')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactPerson], [ContactNumber], [EmailAddress], [OrderHistory]) VALUES (7, N'Sophia Miller', N'Daniel Miller', N'789-012-3456', N'sophia.miller@example.com', N'Order #110, Order #111')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactPerson], [ContactNumber], [EmailAddress], [OrderHistory]) VALUES (8, N'James Moore', N'Rebecca Moore', N'890-123-4567', N'james.moore@example.com', N'Order #112')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactPerson], [ContactNumber], [EmailAddress], [OrderHistory]) VALUES (9, N'Olivia Taylor', N'Ethan Taylor', N'901-234-5678', N'olivia.taylor@example.com', N'Order #113, Order #114')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactPerson], [ContactNumber], [EmailAddress], [OrderHistory]) VALUES (10, N'Daniel Martinez', N'Carmen Martinez', N'012-345-6789', N'daniel.martinez@example.com', N'Order #115')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactPerson], [ContactNumber], [EmailAddress], [OrderHistory]) VALUES (11, N'amna', N'komal', N'0987-86541-87', N'amna@gmail.com', N'order#400')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Category], [Quantity], [UnitPrice], [Barcode], [CreatedAt], [UpdatedAt], [MinimumStock]) VALUES (2, N'Office Chai', N'SKU002', N'Furniture', 15, CAST(85.00 AS Decimal(10, 2)), N'1234567891', CAST(N'2024-12-16T04:44:10.757' AS DateTime), CAST(N'2024-12-16T04:44:10.757' AS DateTime), 10)
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Category], [Quantity], [UnitPrice], [Barcode], [CreatedAt], [UpdatedAt], [MinimumStock]) VALUES (5, N'Novel', N'SKU005', N'Books', 30, CAST(15.00 AS Decimal(10, 2)), N'1234567894', CAST(N'2024-12-16T04:44:10.757' AS DateTime), CAST(N'2024-12-16T04:44:10.757' AS DateTime), 10)
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Category], [Quantity], [UnitPrice], [Barcode], [CreatedAt], [UpdatedAt], [MinimumStock]) VALUES (6, N'Action Figure', N'SKU006', N'Toys', 25, CAST(30.00 AS Decimal(10, 2)), N'1234567895', CAST(N'2024-12-16T04:44:10.757' AS DateTime), CAST(N'2024-12-16T04:44:10.757' AS DateTime), 5)
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Category], [Quantity], [UnitPrice], [Barcode], [CreatedAt], [UpdatedAt], [MinimumStock]) VALUES (7, N'Tennis Racket', N'SKU007', N'Sports', 10, CAST(60.00 AS Decimal(10, 2)), N'1234567896', CAST(N'2024-12-16T04:44:10.757' AS DateTime), CAST(N'2024-12-16T04:44:10.757' AS DateTime), 5)
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Category], [Quantity], [UnitPrice], [Barcode], [CreatedAt], [UpdatedAt], [MinimumStock]) VALUES (8, N'Face Cream', N'SKU008', N'Beauty', 40, CAST(25.00 AS Decimal(10, 2)), N'1234567897', CAST(N'2024-12-16T04:44:10.757' AS DateTime), CAST(N'2024-12-16T04:44:10.757' AS DateTime), 10)
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Category], [Quantity], [UnitPrice], [Barcode], [CreatedAt], [UpdatedAt], [MinimumStock]) VALUES (9, N'Car Battery', N'SKU009', N'Automotive', 5, CAST(150.00 AS Decimal(10, 2)), N'1234567898', CAST(N'2024-12-16T04:44:10.757' AS DateTime), CAST(N'2024-12-16T04:44:10.757' AS DateTime), 2)
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Category], [Quantity], [UnitPrice], [Barcode], [CreatedAt], [UpdatedAt], [MinimumStock]) VALUES (10, N'Drill Machine', N'SKU010', N'Tools', 8, CAST(80.00 AS Decimal(10, 2)), N'1234567899', CAST(N'2024-12-16T04:44:10.757' AS DateTime), CAST(N'2024-12-16T04:44:10.757' AS DateTime), 3)
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Category], [Quantity], [UnitPrice], [Barcode], [CreatedAt], [UpdatedAt], [MinimumStock]) VALUES (11, N'chair ', N'sk001', N'home', 3, CAST(40.00 AS Decimal(10, 2)), N'1234568234', CAST(N'2024-12-23T05:21:57.130' AS DateTime), CAST(N'2024-12-23T05:21:57.130' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetails] ON 

INSERT [dbo].[PurchaseOrderDetails] ([PODetailID], [PurchaseOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (2, 1, 2, 15, CAST(85.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrderDetails] ([PODetailID], [PurchaseOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (5, 4, 5, 10, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrderDetails] ([PODetailID], [PurchaseOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (6, 5, 6, 10, CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrderDetails] ([PODetailID], [PurchaseOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (7, 1, 7, 3, CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrderDetails] ([PODetailID], [PurchaseOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (8, 2, 8, 20, CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrderDetails] ([PODetailID], [PurchaseOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (9, 3, 9, 2, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrderDetails] ([PODetailID], [PurchaseOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (10, 5, 10, 5, CAST(80.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrderDetails] ([PODetailID], [PurchaseOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (11, 1, 7, 4, CAST(60.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrders] ON 

INSERT [dbo].[PurchaseOrders] ([PurchaseOrderID], [SupplierID], [OrderDate], [Status], [TotalAmount]) VALUES (1, 1, CAST(N'2024-12-16T04:45:12.287' AS DateTime), N'Pending', CAST(6000.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrders] ([PurchaseOrderID], [SupplierID], [OrderDate], [Status], [TotalAmount]) VALUES (2, 2, CAST(N'2024-12-16T04:45:12.287' AS DateTime), N'Completed', CAST(1275.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrders] ([PurchaseOrderID], [SupplierID], [OrderDate], [Status], [TotalAmount]) VALUES (3, 3, CAST(N'2024-12-16T04:45:12.287' AS DateTime), N'Pending', CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrders] ([PurchaseOrderID], [SupplierID], [OrderDate], [Status], [TotalAmount]) VALUES (4, 4, CAST(N'2024-12-16T04:45:12.287' AS DateTime), N'Cancelled', CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrders] ([PurchaseOrderID], [SupplierID], [OrderDate], [Status], [TotalAmount]) VALUES (5, 5, CAST(N'2024-12-16T04:45:12.287' AS DateTime), N'Completed', CAST(750.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrders] ([PurchaseOrderID], [SupplierID], [OrderDate], [Status], [TotalAmount]) VALUES (6, 3, CAST(N'2024-12-24T04:43:32.290' AS DateTime), N'Pending', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrders] ([PurchaseOrderID], [SupplierID], [OrderDate], [Status], [TotalAmount]) VALUES (7, 4, CAST(N'2024-12-24T04:52:02.243' AS DateTime), N'Pending', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrders] ([PurchaseOrderID], [SupplierID], [OrderDate], [Status], [TotalAmount]) VALUES (8, 2, CAST(N'2024-12-25T07:16:24.547' AS DateTime), N'Pending', CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[PurchaseOrders] ([PurchaseOrderID], [SupplierID], [OrderDate], [Status], [TotalAmount]) VALUES (9, 2, CAST(N'2024-12-25T07:22:24.770' AS DateTime), N'Completed', CAST(180.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[PurchaseOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesOrderDetails] ON 

INSERT [dbo].[SalesOrderDetails] ([SODetailID], [SalesOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (2, 1, 2, 5, CAST(85.00 AS Decimal(10, 2)))
INSERT [dbo].[SalesOrderDetails] ([SODetailID], [SalesOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (5, 3, 5, 5, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[SalesOrderDetails] ([SODetailID], [SalesOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (6, 4, 6, 3, CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[SalesOrderDetails] ([SODetailID], [SalesOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (7, 4, 7, 1, CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[SalesOrderDetails] ([SODetailID], [SalesOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (8, 5, 8, 10, CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[SalesOrderDetails] ([SODetailID], [SalesOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (9, 5, 9, 1, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[SalesOrderDetails] ([SODetailID], [SalesOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (10, 5, 10, 3, CAST(80.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[SalesOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesOrders] ON 

INSERT [dbo].[SalesOrders] ([SalesOrderID], [CustomerName], [OrderDate], [Status], [TotalAmount]) VALUES (1, N'Alice Johnson', CAST(N'2024-12-16T04:46:47.060' AS DateTime), N'Pending', CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[SalesOrders] ([SalesOrderID], [CustomerName], [OrderDate], [Status], [TotalAmount]) VALUES (2, N'Bob Smith', CAST(N'2024-12-16T04:46:47.060' AS DateTime), N'Shipped', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[SalesOrders] ([SalesOrderID], [CustomerName], [OrderDate], [Status], [TotalAmount]) VALUES (3, N'Charlie Brown', CAST(N'2024-12-16T04:46:47.060' AS DateTime), N'Cancelled', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[SalesOrders] ([SalesOrderID], [CustomerName], [OrderDate], [Status], [TotalAmount]) VALUES (4, N'David Clark', CAST(N'2024-12-16T04:46:47.060' AS DateTime), N'Pending', CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[SalesOrders] ([SalesOrderID], [CustomerName], [OrderDate], [Status], [TotalAmount]) VALUES (5, N'Eva Williams', CAST(N'2024-12-16T04:46:47.060' AS DateTime), N'Shipped', CAST(750.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[SalesOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[StockMovements] ON 

INSERT [dbo].[StockMovements] ([MovementID], [ProductID], [MovementType], [Quantity], [MovementDate], [Description]) VALUES (2, 2, N'IN', 20, CAST(N'2024-12-16T04:47:28.520' AS DateTime), N'Initial stock')
INSERT [dbo].[StockMovements] ([MovementID], [ProductID], [MovementType], [Quantity], [MovementDate], [Description]) VALUES (5, 5, N'IN', 15, CAST(N'2024-12-16T04:47:28.520' AS DateTime), N'Restock')
INSERT [dbo].[StockMovements] ([MovementID], [ProductID], [MovementType], [Quantity], [MovementDate], [Description]) VALUES (6, 6, N'OUT', 3, CAST(N'2024-12-16T04:47:28.520' AS DateTime), N'Customer order')
INSERT [dbo].[StockMovements] ([MovementID], [ProductID], [MovementType], [Quantity], [MovementDate], [Description]) VALUES (7, 7, N'IN', 5, CAST(N'2024-12-16T04:47:28.520' AS DateTime), N'Restock')
INSERT [dbo].[StockMovements] ([MovementID], [ProductID], [MovementType], [Quantity], [MovementDate], [Description]) VALUES (8, 8, N'OUT', 2, CAST(N'2024-12-16T04:47:28.520' AS DateTime), N'Customer order')
INSERT [dbo].[StockMovements] ([MovementID], [ProductID], [MovementType], [Quantity], [MovementDate], [Description]) VALUES (9, 9, N'ADJUSTMENT', 1, CAST(N'2024-12-16T04:47:28.520' AS DateTime), N'Inventory correction')
INSERT [dbo].[StockMovements] ([MovementID], [ProductID], [MovementType], [Quantity], [MovementDate], [Description]) VALUES (10, 10, N'IN', 10, CAST(N'2024-12-16T04:47:28.520' AS DateTime), N'Initial stock')
INSERT [dbo].[StockMovements] ([MovementID], [ProductID], [MovementType], [Quantity], [MovementDate], [Description]) VALUES (11, 6, N'OUT', 5, CAST(N'2024-12-25T04:58:01.590' AS DateTime), N'Stock removed')
SET IDENTITY_INSERT [dbo].[StockMovements] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [Phone], [Email], [Address]) VALUES (1, N'Tech Supplies Co.', N'John Doe', N'1234567890', N'techsupplies@example.com', N'123 Tech Street')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [Phone], [Email], [Address]) VALUES (2, N'Office Furniture Ltd.', N'Jane Smith', N'0987654322', N'furniture@example.com', N'456 Office Lane')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [Phone], [Email], [Address]) VALUES (3, N'Clothing Distributors', N'Mary Johnson', N'1122334455', N'clothing@example.com', N'789 Apparel Ave')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [Phone], [Email], [Address]) VALUES (4, N'Food Mart Supplies', N'James Brown', N'6677889900', N'foodmart@example.com', N'321 Grocery Rd')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [Phone], [Email], [Address]) VALUES (5, N'Book World Inc.', N'Patricia Miller', N'3344556677', N'books@example.com', N'654 Knowledge Blvd')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt], [UserEmail], [UserPhone], [UserAddress], [UserStatus]) VALUES (1, N'admin', N'adminpasswordhash', N'Admin', CAST(N'2024-12-16T04:47:44.023' AS DateTime), N'admin@gmail.com', N'12345-56', N'123 Admin St, City, Country', N'active')
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt], [UserEmail], [UserPhone], [UserAddress], [UserStatus]) VALUES (2, N'manager1', N'managerpasswordhash', N'Manager', CAST(N'2024-12-16T04:47:44.023' AS DateTime), N'manager1@gmail.com', N'3456-097', N'456 Manager Ln, City, Country', N'active')
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt], [UserEmail], [UserPhone], [UserAddress], [UserStatus]) VALUES (3, N'staff1', N'staffpasswordhash', N'Staff', CAST(N'2024-12-16T04:47:44.023' AS DateTime), N'staff1@gmail.com', N'2345-874', N'789 Staff Blvd, City, Country', N'active')
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt], [UserEmail], [UserPhone], [UserAddress], [UserStatus]) VALUES (4, N'staff2', N'staffpasswordhash', N'Staff', CAST(N'2024-12-16T04:47:44.023' AS DateTime), N'staff2@gmail.com', N'3678-4976', N'123 Staff Ave, City, Country', N'inactive')
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt], [UserEmail], [UserPhone], [UserAddress], [UserStatus]) VALUES (5, N'manager2', N'managerpasswordhash', N'Manager', CAST(N'2024-12-16T04:47:44.023' AS DateTime), N'mnager2@gmail.com', N'456-9867', N'987 Manager Rd, City, Country', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__8517B2E0FD8B1F0E]    Script Date: 12/30/2024 8:13:43 AM ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Products__CA1ECF0D5B35E0EE]    Script Date: 12/30/2024 8:13:43 AM ******/
ALTER TABLE [dbo].[Products] ADD UNIQUE NONCLUSTERED 
(
	[SKU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4C4D3A74A]    Script Date: 12/30/2024 8:13:43 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditLogs] ADD  DEFAULT (getdate()) FOR [ActionTime]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [MinimumStock]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[SalesOrders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[StockMovements] ADD  DEFAULT (getdate()) FOR [MovementDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Alerts]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[AuditLogs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderID])
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[SalesOrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[SalesOrderDetails]  WITH CHECK ADD FOREIGN KEY([SalesOrderID])
REFERENCES [dbo].[SalesOrders] ([SalesOrderID])
GO
ALTER TABLE [dbo].[StockMovements]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD CHECK  (([Status]='Cancelled' OR [Status]='Completed' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD CHECK  (([Status]='Cancelled' OR [Status]='Shipped' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[StockMovements]  WITH CHECK ADD CHECK  (([MovementType]='ADJUSTMENT' OR [MovementType]='OUT' OR [MovementType]='IN'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='Staff' OR [Role]='Manager' OR [Role]='Admin'))
GO
USE [master]
GO
ALTER DATABASE [InventoryManagementSystem] SET  READ_WRITE 
GO
