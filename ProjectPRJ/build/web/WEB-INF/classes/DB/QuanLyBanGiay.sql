USE [master]
GO
/****** Object:  Database [QuanLyBanGiay1]    Script Date: 10/3/2023 11:12:19 AM ******/
CREATE DATABASE [QuanLyBanGiay1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyBanGiay1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HUNGPHAM\MSSQL\DATA\QuanLyBanGiay1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyBanGiay1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HUNGPHAM\MSSQL\DATA\QuanLyBanGiay1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyBanGiay1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyBanGiay1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyBanGiay1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBanGiay1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyBanGiay1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyBanGiay1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyBanGiay1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyBanGiay1] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyBanGiay1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyBanGiay1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyBanGiay1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyBanGiay1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyBanGiay1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyBanGiay1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyBanGiay1', N'ON'
GO
ALTER DATABASE [QuanLyBanGiay1] SET QUERY_STORE = OFF
GO
USE [QuanLyBanGiay1]
GO
/****** Object:  User [demo4]    Script Date: 10/3/2023 11:12:19 AM ******/
CREATE USER [demo4] FOR LOGIN [demo4] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [demo4]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [nchar](10) NULL,
	[pass] [nchar](10) NULL,
	[isSell] [bit] NULL,
	[isAdmin] [bit] NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[accountID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[amount] [int] NULL,
	[maCart] [int] IDENTITY(1,1) NOT NULL,
	[size] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[maCart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[maHD] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NULL,
	[tongGia] [float] NULL,
	[ngayXuat] [datetime] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[image] [nvarchar](500) NULL,
	[price] [float] NULL,
	[title] [nvarchar](500) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NOT NULL,
	[sell_ID] [int] NOT NULL,
	[model] [nvarchar](50) NULL,
	[color] [nvarchar](50) NULL,
	[delivery] [nvarchar](50) NULL,
	[image2] [nvarchar](500) NULL,
	[image3] [nvarchar](500) NULL,
	[image4] [nvarchar](500) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[accountID] [int] NULL,
	[productID] [int] NULL,
	[contentReview] [nvarchar](500) NULL,
	[dateReview] [date] NULL,
	[maReview] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[maReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoLuongDaBan]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoLuongDaBan](
	[productID] [int] NULL,
	[soLuongDaBan] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[idSupplier] [int] IDENTITY(1,1) NOT NULL,
	[nameSupplier] [nvarchar](100) NULL,
	[phoneSupplier] [nvarchar](50) NULL,
	[emailSupplier] [nvarchar](200) NULL,
	[addressSupplier] [nvarchar](200) NULL,
	[cateID] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[idSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TongChiTieuBanHang]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TongChiTieuBanHang](
	[userID] [int] NULL,
	[TongChiTieu] [float] NULL,
	[TongBanHang] [float] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email]) VALUES (1, N'duchm     ', N'123456    ', 1, 1, N'snowhead2003@gmail.com')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email]) VALUES (2, N'mra       ', N'123456    ', 0, 0, N'mra01@gmail.com')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email]) VALUES (3, N'mrb       ', N'123456    ', 1, 0, N'mrb02@gmail.com')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'GIAY ADIDAS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'GIAY NIKE')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'GIAY BITIS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'GIAY CONVERSE')
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (1, 1, 999, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (2, 1, 800, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (3, 1, 400, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (4, 1, 511.2, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (5, 1, 241.20000000000002, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (6, 1, 392.40000000000003, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (7, 1, 482.40000000000003, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (8, 2, 300, CAST(N'2021-11-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (9, 2, 400, CAST(N'2021-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (10, 1, 180, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (11, 1, 1079.1000000000001, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (12, 1, 122.4, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (13, 1, 1394.1000000000001, CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (14, 2, 256, CAST(N'2021-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (15, 3, 450, CAST(N'2021-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (16, 2, 200, CAST(N'2021-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (17, 2, 100, CAST(N'2021-08-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (18, 3, 156, CAST(N'2021-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (19, 3, 256, CAST(N'2021-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (20, 3, 158, CAST(N'2021-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (21, 2, 800, CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (22, 3, 750, CAST(N'2021-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (23, 2, 657, CAST(N'2021-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (24, 1, 800, CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (25, 1, 1491.6, CAST(N'2021-11-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (26, 1, 396, CAST(N'2021-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (27, 1, 761.2, CAST(N'2021-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (28, 1, 1687.4, CAST(N'2021-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (29, 1, 1760, CAST(N'2021-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (30, 1, 2175.8, CAST(N'2021-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (31, 1, 396, CAST(N'2021-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (32, 1, 739.2, CAST(N'2021-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (33, 1, 567.6, CAST(N'2021-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (34, 1, 803, CAST(N'2021-12-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (35, 1, 880, CAST(N'2023-07-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (36, 1, 198, CAST(N'2023-07-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat]) VALUES (37, 3, 880, CAST(N'2023-07-19T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (11, N'GIÀY NIKE AIR MAX AP NAM - XÁM XANH _ Baocao', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_A_PREM-550x550.jpg', 180, N'GIÀY NIKE AIR MAX AP NAM - XÁM XANH', N'Giày Nike Air Max AP là mẫu giày với thiết kế vô cùng thời trang của Nike với sự kết hợp hài hòa giữa quá khứ và hiện đại.

Phần đế giữa của Nike Air Max AP được thiết kế rất hợp lý mềm mại với công nghệ tiên tiến nhất của Nike. Chắc chắn đây là mẫu giày mà bất cứ fan Sneaker không thể bỏ qua', 2, 1, N'G87', N'Gray', N'Hải Phòng', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_C_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_D_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_F_PREM-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (15, N'Adidas Ultraboost 4.0 -2', N'https://product.hstatic.net/1000282067/product/giay_ultraboost_mau_xanh_da_troi_g54002_e902370c1de04294ad2602df86bc7c7c_1024x1024.jpg', 156, N'Adidas Ultraboost 4.0', N'KIỂM SOÁT LỰC KHI CHẠM ĐẤT, THOẢI MÁI TRONG TỪNG BƯỚC CHẠY.

Giày Sneaker Nam Nữ Adidas Ultraboost 4.0 FU9993 – Hàng Chính Hãng

', 2, 1, N'G87', N'Blue', N'Long An', N'https://images.solecollector.com/complex/images/fl_lossy,q_auto/c_scale,w_690,dpr_2.0/v1/dq2zuhqxoufskbl1ycjd/adidas-ultra-boost-4-navy', N'https://product.hstatic.net/1000282067/product/529360_01.jpg_37102ca9b517400d8159d0dd501ac79e_1024x1024.jpeg', N'https://product.hstatic.net/1000282067/product/ultraboost_shoes_blue_g54002_05_standard_bc063c8c6fa5466f868a6765dd896386_1024x1024.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (19, N'Giày Nike Air Max SC Nam- Đen Trắng', N'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-01-550x550.jpg', 190, N'Giày Nike Air Max SC Nam- Đen Trắng', N'mang nét huyền thoại của Nike, với bộ đệm Air Max trứ danh đây là mẫu giày có thể kết hợp với bất cứ trang phục nào mà bạn vẫn hoàn toàn tự tin trong mọi hoàn cảnh.', 2, 3, N'G68', N'Black', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/24.10/giay-nike-air-max-sc-nam-den-trang-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (20, N'Giày Nike Court Royale 2 Nam - Đen', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-01-550x550.jpg', 490, N'Giày Nike Court Royale 2 Nam - Đen', N'', 2, 1, N'G68', N'Black', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-den-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (21, N'Giày Nike Air Max AP Nam - Đen', N'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-01-550x550.jpg', 690, N'Giày Nike Air Max AP Nam - Đen', N'', 2, 3, N'G68', N'Black', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/giay-Nike-Air-Max-AP-nam-den-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (22, N'Giày Nike Renew Retaliation TR 3 Nam - Đen Trắng ', N'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-01-550x550.jpg', 890, N'Giày Nike Renew Retaliation TR 3 Nam - Đen Trắng', N'', 2, 1, N'G68', N'Black', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-03-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-02-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/giay-Nike-Renew-Retaliation-TR-3-05-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (24, N'Giày Nike Air Zoom Structure 24 Nam - Trắng', N'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-01-550x550.jpg', 390, N'Giày Nike Air Zoom Structure 24 Nam - Trắng', N'Ở phiên bản này được các chuyên gia đánh giá cao phần bởi sự ổn định nhưng vẫn có cảm giác êm chân trong suốt quá trình sử dụng. Bạn yêu thích thể thao và đang tìm kiếm cho mình một đôi giày để tập luyện thì Nike Air Zoom Structure 24 sẽ là một lựa chọn hoàn toàn chính xác. Bởi một đôi giày tốt sẽ là một người đồng hành quan trọng trong cả 1 quá trình.', 2, 1, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-02-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-03-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/10.11/giay-nike-air-zoom-structure-24-nam-trang-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (25, N'Giày Nike Court Royale 2 Nam Nữ - Trắng', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-01-550x550.jpg', 490, N'Giày Nike Court Royale 2 Nam Nữ - Trắng', N'Mua Hàng Ngay', 2, 1, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/22.10/Nike-Court-Royale-2-Nam-trang-02-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (26, N'Giày Nike Revolution 5 Nữ - Trắng Full', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-01-550x550.jpg', 590, N'Giày Nike Revolution 5 Nữ - Trắng Full', N'', 2, 3, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/nike%202021/giay-nike-revolution-5-nu-trang-full-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (27, N'Giày Nike Air Max Zero Essential Nam Trắng Full', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-01-550x550.jpg', 690, N'Giày Nike Air Max Zero Essential Nam Trắng Full', N'', 2, 1, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-air-max-zero-essential-nam-trang-full-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (28, N'Giày Nike Court Majestic Leather Nam Trắng Đen 2', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-01-550x550.jpg', 890, N'Giày Nike Court Majestic Leather Nam Trắng Đen', N'- Giày Nike Court Royale SL chính hãng 100%. Phát hiện hàng Fake đền tiền gấp 2 lần giá sản phẩm.', 1, 1, N'G68', N'White', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/3.5.19/giay-nike-court-majestic-leather-nam-trang-den-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (29, N'Giày Puma Smash V2 L Nam Xám', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-01-550x550.jpg', 590, N'Giày Puma Smash V2 L Nam Xám', N'', 2, 3, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-07-550x550.jpg', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/PUMA%202019/thang7/giay-puma-smash-v2-l-nam-xam-01-80x80.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (30, N'Giày Lacoste Europa 120 Nam - Xám Trắng', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-01-550x550.jpg', 590, N'Giày Lacoste Europa 120 Nam - Xám Trắng', N'', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-04-550x550.jpg', N'https://myshoes.vn/image/cache/data/lacoste%202019/thang%206/lc/giay-lacoste-europa-120-nam-xam-trang-03-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (31, N'Giày Nike Air Zoom Structure 23 Nam - Xám', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-01-550x550.jpg', 90, N'Giày Nike Air Zoom Structure 23 Nam - Xám', N'', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-06-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-05-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike/25.10/giay-nike-structure-23-nam-xam-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (32, N'Giày Nike Air Max AP Nam - Xám Xanh', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_A_PREM-550x550.jpg', 690, N'Giày Nike Air Max AP Nam - Xám Xanh', N'', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_C_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_D_PREM-550x550.jpg', N'https://myshoes.vn/image/cache/catalog/nike1/NIKE-CU4826_003_E_PREM-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (33, N'Giày adidas Edge Lux Nữ - Xám', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-01-550x550.jpg', 90, N'Giày adidas Edge Lux Nữ - Xám', N'* Myshoes.vn cam kết:', 2, 3, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-edge-lux-nu-xam-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (34, N'Giày adidas Super Nova Nữ Xám', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-01-550x550.jpg', 390, N'Giày adidas Super Nova Nữ Xám', N'', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-nova-nu-xam-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (35, N'Giày Nike Epic React Flyknit 2 Nam - Xám Xanh', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-01-550x550.jpg', 790, N'Giày Nike Epic React Flyknit 2 Nam - Xám Xanh', N'* Myshoes.vn cam kết:', 2, 1, N'G68', N'Gray', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/7.6.19/giay-nike-epic-react-2%20flyknit-nam-xam-xanh-04-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (36, N'Giày Nike Air Zoom Pegasus 37 Nam - Đen Vàng', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-01-550x550.jpg', 790, N'Giày Nike Air Zoom Pegasus 37 Nam - Đen Vàng', N'Tiếp theo, phần Upper đã được cải tiến, thay thế bằng một lớp Mesh khác hoàn toàn trước kia. Lớp lưới này nhẹ hơn, dày hơn nhưng tuyệt đối vẫn giữ được sự thông thoáng, thoải mái trong từng mọi hoạt động của bàn chân. Lưỡi gà, cũng được Cut Out tinh tế để fit vừa vặn với các kiểu cổ chân khác nhau đồng thời tăng khả năng điều chỉnh đến một cách linh hoạt nhất.', 2, 1, N'G68', N'Black', N'Long An', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-04-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-06-550x550.jpg', N'https://myshoes.vn/image/cache/data/nike%202019/nike/giay-nike-air-zoom-pegasus-37-nam-den-vang-05-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (37, N'Giày Thể Thao Asics GEL-Nimbus® 19 Nam - Xanh vàng', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-0-550x550.jpg', 490, N'Giày Thể Thao Asics GEL-Nimbus® 19 Nam - Xanh vàng', N'Giày Thể Thao Asics GEL-Nimbus® 19 là đôi giày được ứng dụng công nghệ FlyteFoam™ sau khi được thay đổi hoàn toàn, mang lại sự thoải mái tối ưu nhất và một bộ đệm đàn hồi cho bàn chân người sử dụng. Upper lưới dệt 3D độc đáo, không đường may, có thể linh hoạt theo từng chuyển động chân một cách tự nhiên nhất.', 2, 3, N'G68', N'Blue
', N'Long An', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-04-550x550.jpg', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-02-550x550.jpg', N'https://myshoes.vn/image/cache/data/product10/8.8.17/giay-asics-gel-nimbus-19-nam-xanh-vang-06-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (38, N'Giày Bóng Đá Nam Bitis Hunter Football', N'https://product.hstatic.net/1000230642/product/02400vag__1__5d559f914caf4864ad99a37c18cc1a1b_1024x1024.jpg', 535, N'Giày Bóng Đá Nam Biti Hunter Football', N'Với thiết kế năng động, Giày bóng đá Biti’s Hunter được tung ra với 5 màu sắc nổi bật tạo điểm nhấn trên sân đấu.', 3, 1, N'G39', N'Yellow', N'Ho Chi Minh', N'https://product.hstatic.net/1000230642/product/02400vag__3__3a83e45335054285a27fba37cafb23c1_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/02400vag__4__d3693ef3babe4fc3a2908d8eb2df6e3b_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/02400vag__4__d3693ef3babe4fc3a2908d8eb2df6e3b_1024x1024.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (39, N'Converse Chuck Taylor 1970s Sunflower', N'https://drake.vn/image/catalog/H%C3%ACnh%20content/B%E1%BA%AFt%20trend%20v%E1%BB%9Bi%20converse%20v%C3%A0ng/battrendmuahe3.jpg', 399, N'Converse Chuck Taylor 1970s Sunflower', N'Thiết kế 1970s Sunflower vẫn giữ nguyên bản của dòng Chuck 70. Đôi giày Converse vàng Sunflower là sự kết hợp giữa hai yếu tố cổ điển và hiện đại, mang màu sắc rất riêng biệt . Phần vải ở thân giày được làm bằng chất liệu vải nặng và dày hơn một chút, phần logo được may thẳng vào thân giày với lớp da cực mướt, tạo vẻ tinh tế và cổ điển cho đôi giày. Bên trong giày sử dụng lớp đệm xốp đặc biệt thoải mái, trong khi bên ngoài đế giày có lớp cao su bóng, vừa dễ vệ sinh lại mang vẻ đẹp vintage cực đẹp.

', 4, 1, N'G89', N'Yellow', N'Hà Nội', N'https://drake.vn/image/catalog/H%C3%ACnh%20content/giay-converse-vang/giay-converse-vang-5.jpg', N'https://drake.vn/image/catalog/H%C3%ACnh%20content/giay-converse-vang/giay-converse-vang-12.jpg', N'https://drake.vn/image/catalog/H%C3%ACnh%20content/B%E1%BA%AFt%20trend%20v%E1%BB%9Bi%20converse%20v%C3%A0ng/battrendmuahe3.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (40, N'GIÀY ADIDAS ADVANTAGE BASE NAM - TRẮNG XANH', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-01.html-550x550.jpg', 140, N'GIÀY ADIDAS ADVANTAGE BASE NAM - TRẮNG XANH', N'Được thừa hưởng lối thiết kế của đàn anh Giày adidas VS Advantage CL song vẫn có thêm nhiều điểm mới cải thiện.Với thiết kế đơn giản nhưng lại vô cùng thanh lịch. Phần Upper của giày được các nhà thiết kế của Adidas sử dụng bằng da bạn tăng thêm độ lịch lãm khi mang. Với các đường kim mũi chỉ hoàn hảo đến từng chi tiết giúp bạn tự tin sải bước. Đây quả thật là một lựa chọn mà các phải mạnh không nên bỏ lỡ. ', 1, 3, N'G76', N'White', N'Nha Trang', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-02.html-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-04.html-550x550.jpg', N'https://myshoes.vn/image/cache/data/adidas/giay-adidas-advantage-base-nam-trang-xanh-03.html-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (41, N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-court-nu-trang-full-01-550x550.jpg', 189, N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'Bạn đang tìm kiếm cho mình một đôi giày sẽ có thể trường tồn với thời gian, không bị lỗi mốt theo năm tháng. Adidas Super Court là 1 lựa chọn không nên bỏ lỡ . Kiểu dáng thiết kế trẻ trung, màu sắc tươi sắc nên Adidas Super Court sẽ là kiểu giày giúp bạn dễ dàng chuyển từ ''bánh bèo" sang '' cá tính'' trong một nốt nhạc.', 1, 1, N'G89', N'White', N'Nha Trang', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-02-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (42, N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'https://myshoes.vn/image/cache/data/adidas%202019/22.3.19/giay-adidas-super-court-nu-trang-full-01-550x550.jpg', 190, N'GIÀY ADIDAS SUPER COURT NỮ TRẮNG FULL', N'Bạn đang tìm kiếm cho mình một đôi giày sẽ có thể trường tồn với thời gian, không bị lỗi mốt theo năm tháng. Adidas Super Court là 1 lựa chọn không nên bỏ lỡ . Kiểu dáng thiết kế trẻ trung, màu sắc tươi sắc nên Adidas Super Court sẽ là kiểu giày giúp bạn dễ dàng chuyển từ ''bánh bèo" sang '' cá tính'' trong một nốt nhạc.', 1, 3, N'G76', N'White', N'Nha Trang', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-05-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-03-550x550.jpg', N'https://myshoes.vn/image/cache/data/giay-adidas-super-court-nu-trang-full-02-550x550.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (45, N'Hunter Layered Upper', N'https://product.hstatic.net/1000230642/product/dsc_0024_a6274cb2948449c785a7269de5fa6349_1024x1024.jpg', 800, N'Hunter Layered Upper', N'Sản phẩm rất tốt đi thoải mái', 3, 1, N'G68', N'White', N'Nha Trang', N'https://product.hstatic.net/1000230642/product/dsc_0025_703ee09f5db24cd9a0c8604cdd2592aa_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/dsc_0026_60087f45b9394f0682f5126309f5d3f6_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/dsc_0027_647fb72ecf3d455590cddb79c2418458_1024x1024.jpg')
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [model], [color], [delivery], [image2], [image3], [image4]) VALUES (46, N'Hunter Layered Upper', N'https://product.hstatic.net/1000230642/product/02800den__2__f00d5533d44b47ac84212239f93ebac6_1024x1024.jpg', 767, N'Hunter Layered Upper', N'Sản phẩm rất tốt đi rất thoải mái', 3, 3, N'G45', N'Black', N'Nha Trang', N'https://product.hstatic.net/1000230642/product/02800den__3__0f4c2b667bb44347ac302726b71ce9a2_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/02800den__4__ef90bd83d09942fd87d72165e5ce2fc7_1024x1024.jpg', N'https://product.hstatic.net/1000230642/product/02800den__5__fb6f5367106342348f60cd7b9b70dee6_1024x1024.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (1, 15, N'xin chao san pham nay rat tot', CAST(N'2021-11-19' AS Date), 2)
INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (1, 11, N'xin chào', CAST(N'2021-11-24' AS Date), 14)
INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (1, 11, N'sản phẩm này rất tốt', CAST(N'2021-11-25' AS Date), 15)
INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (1, 11, N'xin chao 2', CAST(N'2021-11-26' AS Date), 16)
INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (1, 11, N'fsdf', CAST(N'2021-12-01' AS Date), 17)
INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (1, 11, N'xin chao 3', CAST(N'2021-12-02' AS Date), 18)
INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (1, 11, N'xin chao 4', CAST(N'2021-12-03' AS Date), 19)
INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (1, 11, N'bao cao', CAST(N'2021-12-14' AS Date), 20)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (11, 24)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (15, 13)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (19, 21)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (20, 9)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (21, 7)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (24, 10)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (46, 2)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (45, 6)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (41, 2)
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (1, N'Cty TNHH D.ADDIDAS', N'091121786', N'cty@gmail.com', N'so 1 Vo Van Ngan', 1)
INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (2, N'Cty TNHH D.NIKE', N'091121786', N'cty@gmail.com', N'so 2 Vo Van Ngan', 2)
INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (3, N'Cty TNHH D.BITIS', N'091121786', N'cty@gmail.com', N'so 3 Vo Van Ngan', 3)
INSERT [dbo].[Supplier] ([idSupplier], [nameSupplier], [phoneSupplier], [emailSupplier], [addressSupplier], [cateID]) VALUES (4, N'Cty TNHH D.CONVERSE', N'091121786', N'cty@gmail.com', N'so 4 Vo Van Ngan', 4)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (1, 11418.200000000003, 15862)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (3, 980, 150)
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Account] FOREIGN KEY([sell_ID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Account]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Product]
GO
ALTER TABLE [dbo].[SoLuongDaBan]  WITH CHECK ADD  CONSTRAINT [FK_SoLuongDaBan_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[SoLuongDaBan] CHECK CONSTRAINT [FK_SoLuongDaBan_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Category]
GO
ALTER TABLE [dbo].[TongChiTieuBanHang]  WITH CHECK ADD  CONSTRAINT [FK_TongChiTieuBanHang_Account] FOREIGN KEY([userID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[TongChiTieuBanHang] CHECK CONSTRAINT [FK_TongChiTieuBanHang_Account]
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatSoLuongDaBan]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_CapNhatSoLuongDaBan] @productID int, @soLuongBanThem int
as
begin
	update SoLuongDaBan set [soLuongDaBan]=[soLuongDaBan] + @soLuongBanThem where productID=@productID
end
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatTongBanHang]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_CapNhatTongBanHang] @sell_ID int, @banHangThem float
as
begin
	update TongChiTieuBanHang set TongBanHang= TongBanHang + @banHangThem where [userID]=@sell_ID
end
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatTongChiTieu]    Script Date: 10/3/2023 11:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_CapNhatTongChiTieu] @userID int, @chiTieuThem float
as
begin
	update TongChiTieuBanHang set TongChiTieu= TongChiTieu + @chiTieuThem where [userID]=@userID
end
GO
USE [master]
GO
ALTER DATABASE [QuanLyBanGiay11] SET  READ_WRITE 
GO


