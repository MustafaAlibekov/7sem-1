USE [master]
GO
/****** Object:  Database [BlagodadMD]    Script Date: 26.09.2022 10:24:19 ******/
CREATE DATABASE [BlagodadMD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blagodad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Blagodad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Blagodad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Blagodad_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlagodadMD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlagodadMD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlagodadMD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlagodadMD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlagodadMD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlagodadMD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlagodadMD] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlagodadMD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlagodadMD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlagodadMD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlagodadMD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlagodadMD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlagodadMD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlagodadMD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlagodadMD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlagodadMD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlagodadMD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlagodadMD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlagodadMD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlagodadMD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlagodadMD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlagodadMD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlagodadMD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlagodadMD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlagodadMD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BlagodadMD] SET  MULTI_USER 
GO
ALTER DATABASE [BlagodadMD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlagodadMD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlagodadMD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlagodadMD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BlagodadMD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlagodadMD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BlagodadMD] SET QUERY_STORE = OFF
GO
USE [BlagodadMD]
GO
/****** Object:  Table [dbo].[AutorizationLogs]    Script Date: 26.09.2022 10:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutorizationLogs](
	[UserID] [int] NOT NULL,
	[Time] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 26.09.2022 10:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[FIO] [nvarchar](50) NOT NULL,
	[ClientID] [int] NOT NULL,
	[PassData] [nvarchar](50) NOT NULL,
	[DateBirth] [date] NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Email] [nchar](100) NOT NULL,
	[Password] [nchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[items]    Script Date: 26.09.2022 10:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items](
	[ItemID] [int] NOT NULL,
	[ItemName] [nchar](50) NOT NULL,
	[CostPerHour] [money] NOT NULL,
	[AmountOfItem] [int] NOT NULL,
	[ItemTypeID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemTypes]    Script Date: 26.09.2022 10:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTypes](
	[TypeID] [int] NOT NULL,
	[TypeName] [nchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 26.09.2022 10:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LoginID] [int] NOT NULL,
	[Time] [time](7) NOT NULL,
	[UserName] [nchar](100) NOT NULL,
	[Password] [nchar](100) NOT NULL,
	[CapchaID] [int] NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 26.09.2022 10:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [nvarchar](100) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[ClientID] [int] NOT NULL,
	[Services] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CloseDate] [date] NULL,
	[RentTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTypes]    Script Date: 26.09.2022 10:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTypes](
	[PostID] [int] NOT NULL,
	[Name] [nchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 26.09.2022 10:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] NOT NULL,
	[ServiceName] [nvarchar](50) NOT NULL,
	[ServiceID] [nvarchar](50) NOT NULL,
	[Cost] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26.09.2022 10:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[login] [nchar](50) NOT NULL,
	[password] [nchar](50) NOT NULL,
	[postID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [BlagodadMD] SET  READ_WRITE 
GO
