USE [master]
GO
/****** Object:  Database [TourAgencyMD]    Script Date: 22.11.2022 9:59:50 ******/
CREATE DATABASE [TourAgencyMD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TourAgencyMD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TourAgencyMD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'TourAgencyMD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TourAgencyMD_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TourAgencyMD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TourAgencyMD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TourAgencyMD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TourAgencyMD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TourAgencyMD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TourAgencyMD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TourAgencyMD] SET ARITHABORT OFF 
GO
ALTER DATABASE [TourAgencyMD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TourAgencyMD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TourAgencyMD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TourAgencyMD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TourAgencyMD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TourAgencyMD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TourAgencyMD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TourAgencyMD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TourAgencyMD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TourAgencyMD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TourAgencyMD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TourAgencyMD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TourAgencyMD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TourAgencyMD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TourAgencyMD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TourAgencyMD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TourAgencyMD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TourAgencyMD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TourAgencyMD] SET  MULTI_USER 
GO
ALTER DATABASE [TourAgencyMD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TourAgencyMD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TourAgencyMD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TourAgencyMD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TourAgencyMD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TourAgencyMD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TourAgencyMD] SET QUERY_STORE = OFF
GO
USE [TourAgencyMD]
GO
/****** Object:  Table [dbo].[Countrys]    Script Date: 22.11.2022 9:59:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countrys](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NULL,
	[CountryCode] [nchar](10) NULL,
 CONSTRAINT [PK_Countrys] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 22.11.2022 9:59:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[HotelID] [int] IDENTITY(1,1) NOT NULL,
	[HotelName] [nvarchar](50) NOT NULL,
	[Stars] [int] NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
	[CountryCode] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Hotels] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 22.11.2022 9:59:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourHotels]    Script Date: 22.11.2022 9:59:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourHotels](
	[HotelID] [int] NOT NULL,
	[TourID] [int] NOT NULL,
 CONSTRAINT [PK_TourHotels] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tours]    Script Date: 22.11.2022 9:59:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tours](
	[TourID] [int] NOT NULL,
	[ImageTour] [nvarchar](max) NOT NULL,
	[TourName] [nvarchar](50) NULL,
	[CountryCode] [nchar](10) NULL,
	[TicketsCount] [int] NULL,
	[Cost] [int] NULL,
	[isActual] [int] NULL,
	[TourType] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tours] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourTypes]    Script Date: 22.11.2022 9:59:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourTypes](
	[TourTypeID] [int] NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22.11.2022 9:59:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[login] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_User] FOREIGN KEY([id])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_User]
GO
USE [master]
GO
ALTER DATABASE [TourAgencyMD] SET  READ_WRITE 
GO