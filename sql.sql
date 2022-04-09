USE [master]
GO
/****** Object:  Database [ShoesStore]    Script Date: 7/7/2021 12:44:14 AM ******/
CREATE DATABASE [ShoesStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoesStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ShoesStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoesStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ShoesStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShoesStore] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoesStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoesStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoesStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoesStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoesStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoesStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoesStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoesStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoesStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoesStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoesStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoesStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoesStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoesStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoesStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoesStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoesStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoesStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoesStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoesStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoesStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoesStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoesStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoesStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoesStore] SET  MULTI_USER 
GO
ALTER DATABASE [ShoesStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoesStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoesStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoesStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoesStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoesStore] SET QUERY_STORE = OFF
GO
USE [ShoesStore]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ShoesStore]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/7/2021 12:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [nvarchar](20) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 7/7/2021 12:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[OrderID] [int] NULL,
	[shoesID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/7/2021 12:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [date] NULL,
	[total] [float] NULL,
	[userName] [nvarchar](50) NULL,
	[phone] [varchar](20) NULL,
	[address] [nvarchar](200) NULL,
	[userID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shoes]    Script Date: 7/7/2021 12:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoes](
	[shoesID] [nvarchar](20) NOT NULL,
	[shoesName] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[status] [nvarchar](10) NULL,
	[image] [nvarchar](200) NULL,
	[categoryID] [nvarchar](20) NULL,
 CONSTRAINT [PK_Shoes] PRIMARY KEY CLUSTERED 
(
	[shoesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/7/2021 12:44:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [nvarchar](10) NULL,
	[phone] [varchar](12) NULL,
	[address] [nvarchar](200) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (N'1', N'Sneaker')
GO
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (N'2', N'Sport')
GO
SET IDENTITY_INSERT [dbo].[Details] ON 
GO
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [shoesID]) VALUES (1, 50, 2, 3, N'1')
GO
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [shoesID]) VALUES (2, 100, 1, 4, N'10')
GO
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [shoesID]) VALUES (3, 50, 1, 5, N'1')
GO
SET IDENTITY_INSERT [dbo].[Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userName], [phone], [address], [userID]) VALUES (2, CAST(N'2021-07-04' AS Date), 214, N'Hoang', N'0356449764', N'Chung Cu Sky 9', N'user1')
GO
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userName], [phone], [address], [userID]) VALUES (3, CAST(N'2021-07-04' AS Date), 100, N'Hoang', N'0356449764', N'Chung Cu Sky 9', N'user1')
GO
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userName], [phone], [address], [userID]) VALUES (4, CAST(N'2021-07-04' AS Date), 100, N'hoang', N'0356449764', N'Chung Cu Sky 9', N'user2')
GO
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userName], [phone], [address], [userID]) VALUES (5, CAST(N'2021-07-04' AS Date), 50, N'Hoang', N'0356449764', N'Chung Cu Sky 9', N'user1')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'1', N'Vans', N'Vans is an American manufacturer of skateboarding shoes and related apparel, started in Anaheim, California, and owned by VF Corporation. The company also sponsors surf, snowboarding, BMX, and motocross teams.', 50, 2, N'Inactive', N'vans.jpg', N'1')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'10', N'NIKE PHANTOM GT PRO', N'The Hypervenom Phantom features a NikeSkin upper, combining mesh webbing and thin layers of polyurethane to create a material that is soft and flexible, All-Conditions Control (ACC) for the same control for any condition, whether wet or dry. The upper of the Hypervenoms is honeycomed-like in design.', 100, 6, N'Active', N'NIKEPHANTOMGTPRO.jpg', N'2')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'11', N'ADIDAS X GHOSTED', N'Pull on X Ghosted and discover next-level speed. The stretchy tongue on these adidas football boots means you''ll get into them in record time. Lightweight and semi-translucent, the foot-hugging Speedskin upper doesn''t just look fast, it feels fast. The low-cut silhouette with signature Clawcollar shape locks your foot into the boot for match-long stability and support', 64, 6, N'Active', N'ADIDASXGHOSTED2.jpg', N'2')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'12', N'Nike Force 1 LE', N'The Air Force 1 was created by designer Bruce Kilgore and was the first basketball shoe to use the Nike Air technology. The shoe is offered in low, mid and high-top.', 62, 8, N'Active', N'NikeForce1LE.jpg', N'1')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'2', N'Converse', N'Converse is an American shoe company that designs, distributes, and licenses sneakers, skating shoes, lifestyle brand footwear, apparel, and accessories. Founded in 1908, it has been a subsidiary of Nike, Inc. ... During World War II, Converse shifted its manufacturing to make footwear for the military.', 50, 7, N'Active', N'converse.png', N'1')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'3', N'Jordan Dior', N'For the Men’s Fall 2020 Runway show in Miami, Dior and Kim Jones partnered with Jordan Brand to unveil the limited-edition Air Jordan 1 High OG Dior sneaker. A collection of ready-to-wear and accessories completes the collaboration, and a low version of the Air Jordan 1 OG Dior rounds out the range.', 100, 4, N'Active', N'jordandior.jpg', N'1')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'3123', N'aaaaa', N'aaaaa', 100, 300, N'Active', N'NIKEPHANTOMGTPRO.jpg', N'1')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'31232', N'aaaa', N'123123', 200, 5, N'Active', N'', N'1')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'4', N'ADIDAS X GHOSTED', N'Pull on X Ghosted and discover next-level speed. The stretchy tongue on these adidas football boots means you''ll get into them in record time. Lightweight and semi-translucent, the foot-hugging Speedskin upper doesn''t just look fast, it feels fast. The low-cut silhouette with signature Clawcollar shape locks your foot into the boot for match-long stability and support', 120, 7, N'Active', N'ADIDASXGHOSTED.jpg', N'2')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'5', N'NIKE MERCURIAL VAPOR 14', N'The Mercurial Vapor is a football boot manufactured by Nike. The boot is known for being lightweight. Because of this, the boot is endorsed by many players for whom speed is part of their game, notably wingers or strikers, such as Cristiano Ronaldo, Kylian Mbappé, Eden Hazard, Raheem Sterling, Zlatan Ibrahimović, Didier Drogba, Luka Modrić, Arturo Vidal, Douglas Costa, Xherdan Shaqiri, Stephan El Shaarawy, Alexis Sánchez, Philippe Coutinho and many more.', 95, 8, N'Active', N'NIKEMERCURIAVAPOR14.jpg', N'2')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'6', N'Converse Chuck Taylor', N'Converse is an American shoe company that designs, distributes, and licenses sneakers, skating shoes, lifestyle brand footwear, apparel, and accessories. Founded in 1908, it has been a subsidiary of Nike, Inc. ... During World War II, Converse shifted its manufacturing to make footwear for the military.', 100, 8, N'Active', N'ConverseChuckTaylor.jpg', N'1')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'7', N'Vans UA Old Skool', N'Vans is an American manufacturer of skateboarding shoes and related apparel, started in Anaheim, California, and owned by VF Corporation. The company also sponsors surf, snowboarding, BMX, and motocross teams.', 130, 9, N'Active', N'VansUAOldSkool.jpg', N'1')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'8', N'ADIDAS X GHOSTED .3 LACELESS TF SUPERLATIVE', N'Pull on X Ghosted and discover next-level speed. The stretchy tongue on these adidas football boots means you''ll get into them in record time. Lightweight and semi-translucent, the foot-hugging Speedskin upper doesn''t just look fast, it feels fast. The low-cut silhouette with signature Clawcollar shape locks your foot into the boot for match-long stability and support', 110, 10, N'Active', N'adidas.jpg', N'2')
GO
INSERT [dbo].[Shoes] ([shoesID], [shoesName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'9', N'ADIDAS NEMEZIZ 19.3 TF ', N'Adidas Nemeziz are a range of football boots created by German sportswear manufacturers Adidas. It was launched in 2017 as the ''agility'' boots, replacing the signature Messi silo in the process. ... Adidas themselves also produce special variation for Argentine Footballer Lionel Messi.', 70, 7, N'Active', N'ADIDASNEMEZIZ.jpg', N'2')
GO
INSERT [dbo].[Users] ([userID], [fullName], [password], [roleID], [status], [phone], [address]) VALUES (N'admin', N'Minh Hoang', N'admin', N'1', N'Active', N'0356449764', NULL)
GO
INSERT [dbo].[Users] ([userID], [fullName], [password], [roleID], [status], [phone], [address]) VALUES (N'user', N'Minh Hoang', N'user', N'2', N'Active', N'0356449764', NULL)
GO
INSERT [dbo].[Users] ([userID], [fullName], [password], [roleID], [status], [phone], [address]) VALUES (N'user1', N'Hoang', N'123456', N'2', N'Active', N'0356449764', NULL)
GO
INSERT [dbo].[Users] ([userID], [fullName], [password], [roleID], [status], [phone], [address]) VALUES (N'user2', N'hoang', N'123456', N'2', N'Active', N'0356449764', NULL)
GO
USE [master]
GO
ALTER DATABASE [ShoesStore] SET  READ_WRITE 
GO
