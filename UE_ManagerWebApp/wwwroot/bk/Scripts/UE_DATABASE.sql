USE [master]
GO
/****** Object:  Database [UE_TICKETS_MANAGER]    Script Date: 7/12/2020 7:51:49 PM ******/
CREATE DATABASE [UE_TICKETS_MANAGER]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UE_TICKETS_MANAGER', FILENAME = N'D:\Program Files\SQL Server 2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\UE_TICKETS_MANAGER.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UE_TICKETS_MANAGER_log', FILENAME = N'D:\Program Files\SQL Server 2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\UE_TICKETS_MANAGER_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UE_TICKETS_MANAGER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET ARITHABORT OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET RECOVERY FULL 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET  MULTI_USER 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UE_TICKETS_MANAGER', N'ON'
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET QUERY_STORE = OFF
GO
USE [UE_TICKETS_MANAGER]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/12/2020 7:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 7/12/2020 7:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [nvarchar](max) NULL,
	[ApplicationType] [int] NOT NULL,
	[DepartmentId] [int] NULL,
	[CreationDate] [datetime2](7) NULL,
	[CreationUser] [nvarchar](max) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[UpdateUser] [nvarchar](max) NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Causes]    Script Date: 7/12/2020 7:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Causes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NULL,
	[CreationUser] [nvarchar](max) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[UpdateUser] [nvarchar](max) NULL,
 CONSTRAINT [PK_Causes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/12/2020 7:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [nvarchar](max) NULL,
	[CustomerName] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[IssuerAdquier] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NULL,
	[CreationUser] [nvarchar](max) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[UpdateUser] [nvarchar](max) NULL,
	[CountryCode] [nvarchar](max) NULL,
	[Wallet] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 7/12/2020 7:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Creation_Date] [datetime2](7) NULL,
	[Create_User] [nvarchar](max) NULL,
	[Update_Date] [datetime2](7) NULL,
	[Update_User] [nvarchar](max) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 7/12/2020 7:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketNumber] [nvarchar](max) NULL,
	[Keyword] [nvarchar](max) NULL,
	[AssignDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreationUser] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NULL,
	[UpdateUser] [nvarchar](max) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[AssignUser] [nvarchar](max) NULL,
	[ApplicationId] [int] NULL,
	[CauseId] [int] NULL,
	[DepartmentId] [int] NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200509020215_firstMigration', N'3.1.3')
GO
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (1, N'Adquirencia Web', 0, 5, CAST(N'2019-08-26T23:39:10.4370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (2, N'ATH Sincronizador (SAETA INT)', 3, 2, CAST(N'2019-08-27T08:03:28.3670000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (3, N'ATH Sincronizador (SAETA)', 3, 2, CAST(N'2019-08-27T08:03:40.6330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (4, N'ATH Sincronizador (saldo Externo)', 3, 2, CAST(N'2019-08-27T08:03:55.3370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (5, N'ATH Sincronizador MX', 3, 2, CAST(N'2019-08-27T08:04:08.9870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (6, N'ATH_ParseaArchivo', 3, 4, CAST(N'2019-08-27T08:04:27.9470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (7, N'ATHCrypto', 3, 4, CAST(N'2019-08-27T08:04:45.1200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (8, N'ATH-FEETX', 0, 4, CAST(N'2019-08-27T08:05:15.9230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (12, N'ATH-Inventario_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.6170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (13, N'ATH-OFAC', 3, 5, CAST(N'2019-09-24T22:26:15.6170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (14, N'ATH-TxVisitInventPOS', 3, 5, CAST(N'2019-09-24T22:26:15.6170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (15, N'ATMSettlement_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.6200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (16, N'Autorizaciones_Adquirentes', 3, 5, CAST(N'2019-09-24T22:26:15.6200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (17, N'Autorizador', 3, 5, CAST(N'2019-09-24T22:26:15.6200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (18, N'AUTORIZADORDEDOSPINOS(com_010)', 3, 5, CAST(N'2019-09-24T22:26:15.6200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (19, N'Basesdedatos', 3, 5, CAST(N'2019-09-24T22:26:15.6200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (20, N'BATCHMOVE', 3, 5, CAST(N'2019-09-24T22:26:15.6200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (21, N'Bin_Validator_WCF', 3, 5, CAST(N'2019-09-24T22:26:15.6230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (22, N'BitacoraAdq', 3, 5, CAST(N'2019-09-24T22:26:15.6230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (23, N'CAAJUSTES02', 3, 5, CAST(N'2019-09-24T22:26:15.6230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (24, N'CACOBROBANC01', 3, 5, CAST(N'2019-09-24T22:26:15.6230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (25, N'CajerosAutomaticos', 3, 5, CAST(N'2019-09-24T22:26:15.6230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (26, N'CALLCENTER', 3, 5, CAST(N'2019-09-24T22:26:15.6270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (27, N'CamarasCompensacion', 3, 5, CAST(N'2019-09-24T22:26:15.6270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (28, N'CardGuardEAR', 3, 5, CAST(N'2019-09-24T22:26:15.6270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (29, N'CARGOSRECURRENTES(SCON)', 3, 5, CAST(N'2019-09-24T22:26:15.6270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (30, N'ChangeCardHistory', 3, 5, CAST(N'2019-09-24T22:26:15.6270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (31, N'Cifrado', 3, 5, CAST(N'2019-09-24T22:26:15.6300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (32, N'CNB', 3, 5, CAST(N'2019-09-24T22:26:15.6300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (33, N'CNBEver-SACreportes', 3, 5, CAST(N'2019-09-24T22:26:15.6300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (34, N'CNBService_WCF', 3, 5, CAST(N'2019-09-24T22:26:15.6300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (35, N'Cobros', 3, 5, CAST(N'2019-09-24T22:26:15.6300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (36, N'ColasMQ', 3, 5, CAST(N'2019-09-24T22:26:15.6300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (37, N'COLiqVisaMaster06', 3, 5, CAST(N'2019-09-24T22:26:15.6330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (38, N'com_010', 3, 5, CAST(N'2019-09-24T22:26:15.6330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (39, N'com_010_NO_HASP', 3, 5, CAST(N'2019-09-24T22:26:15.6330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (40, N'COM_1', 3, 5, CAST(N'2019-09-24T22:26:15.6330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (41, N'COM_10_NO_HASP(AMSMASTERCARD,EXEPTION', 3, 5, CAST(N'2019-09-24T22:26:15.6330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (42, N'COM_10Visa(EXEPTIONFILEBAHAMAS)', 3, 5, CAST(N'2019-09-24T22:26:15.6370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (43, N'COM_2', 3, 5, CAST(N'2019-09-24T22:26:15.6370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (44, N'COM_3', 3, 5, CAST(N'2019-09-24T22:26:15.6370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (45, N'COM_4', 3, 5, CAST(N'2019-09-24T22:26:15.6370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (46, N'COM_5', 3, 5, CAST(N'2019-09-24T22:26:15.6370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (47, N'COM_6', 3, 5, CAST(N'2019-09-24T22:26:15.6370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (48, N'COM_8', 3, 5, CAST(N'2019-09-24T22:26:15.6400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (49, N'COM_9', 3, 5, CAST(N'2019-09-24T22:26:15.6400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (50, N'Com16', 3, 5, CAST(N'2019-09-24T22:26:15.6400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (51, N'ComerciosGessa', 3, 5, CAST(N'2019-09-24T22:26:15.6400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (52, N'COMERCIOS_ATLANTIDA', 3, 5, CAST(N'2019-09-24T22:26:15.6400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (53, N'COMPROBANTEPAGO', 3, 5, CAST(N'2019-09-24T22:26:15.6400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (54, N'COMS', 3, 5, CAST(N'2019-09-24T22:26:15.6400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (55, N'CONSOLA3', 3, 5, CAST(N'2019-09-24T22:26:15.6430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (56, N'ConsolaClientesExternos', 3, 5, CAST(N'2019-09-24T22:26:15.6430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (57, N'ConsolaCR', 3, 5, CAST(N'2019-09-24T22:26:15.6430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (58, N'ConsolaInt', 3, 5, CAST(N'2019-09-24T22:26:15.6430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (59, N'ConsolaWebCR', 3, 5, CAST(N'2019-09-24T22:26:15.6430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (60, N'ConsolaWebInt', 3, 5, CAST(N'2019-09-24T22:26:15.6470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (61, N'ConsolaWebWM', 3, 5, CAST(N'2019-09-24T22:26:15.6470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (62, N'CONSULTAPORCELULAR', 3, 5, CAST(N'2019-09-24T22:26:15.6470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (63, N'CONSULTASINFORMACIONCOMERCIOSADQUIREN', 3, 5, CAST(N'2019-09-24T22:26:15.6470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (64, N'CONSULTASINFORMACIONCOMERCIOSSISCARD', 3, 5, CAST(N'2019-09-24T22:26:15.6500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (65, N'CONTROVERSIAS', 3, 5, CAST(N'2019-09-24T22:26:15.6500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (66, N'CORTESCR', 3, 5, CAST(N'2019-09-24T22:26:15.6500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (67, N'CortesGessa', 3, 5, CAST(N'2019-09-24T22:26:15.6500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (68, N'CORTESINT', 3, 5, CAST(N'2019-09-24T22:26:15.6500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (69, N'CORTESMX', 3, 5, CAST(N'2019-09-24T22:26:15.6500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (70, N'CortesMensualSAP', 3, 5, CAST(N'2019-09-24T22:26:15.6500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (71, N'CredencialesReportingServiceIVR', 3, 5, CAST(N'2019-09-24T22:26:15.6530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (72, N'DataSources', 3, 5, CAST(N'2019-09-24T22:26:15.6530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (73, N'DATATRANSFER', 3, 5, CAST(N'2019-09-24T22:26:15.6530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (74, N'DATATRANSFERCR', 3, 5, CAST(N'2019-09-24T22:26:15.6530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (75, N'DATATRANSFERHN', 3, 5, CAST(N'2019-09-24T22:26:15.6530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (76, N'DATATRANSFERINT', 3, 5, CAST(N'2019-09-24T22:26:15.6530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (77, N'DATATRANSFERMEX', 3, 5, CAST(N'2019-09-24T22:26:15.6530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (78, N'DESENCRIPTAARCHIVOPARAEMBOZADO', 3, 5, CAST(N'2019-09-24T22:26:15.6570000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (79, N'DETAINED-CARDS', 3, 5, CAST(N'2019-09-24T22:26:15.6570000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (80, N'EB24_ATMSettlement', 3, 5, CAST(N'2019-09-24T22:26:15.6570000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (81, N'EB24_ATMSETTLEMENT_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.6570000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (82, N'EB24_Settlement_WIN', 3, 5, CAST(N'2019-09-24T22:26:15.6570000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (83, N'EBCT_ProcBase24CTO_WIN', 3, 5, CAST(N'2019-09-24T22:26:15.6570000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (84, N'E-CLIENT', 3, 5, CAST(N'2019-09-24T22:26:15.6600000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (85, N'EDES_Ever_DWH_ETLService', 3, 5, CAST(N'2019-09-24T22:26:15.6600000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (86, N'EDES_EverDataWareHouse_ETL_Service', 3, 5, CAST(N'2019-09-24T22:26:15.6600000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (87, N'EDTF_EVER_DATATRANSFER', 3, 5, CAST(N'2019-09-24T22:26:15.6600000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (88, N'EDTO_DataTransferOnline_ETL', 3, 5, CAST(N'2019-09-24T22:26:15.6630000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (89, N'EECW_EverClient_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.6630000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (90, N'EECW_EverClient_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.6630000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (91, N'EFCW_FileEncryption_WIN', 3, 5, CAST(N'2019-09-24T22:26:15.6670000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (92, N'EFEW_FileDesencryption_WIN', 3, 5, CAST(N'2019-09-24T22:26:15.6670000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (93, N'EMAP', 3, 5, CAST(N'2019-09-24T22:26:15.6670000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (94, N'ENCRIPTAARCHIVOPARAEMBOZAR', 3, 5, CAST(N'2019-09-24T22:26:15.6670000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (95, N'EnvironmentReport', 3, 5, CAST(N'2019-09-24T22:26:15.6670000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (96, N'EP40Service', 3, 5, CAST(N'2019-09-24T22:26:15.6700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (97, N'EPS', 3, 5, CAST(N'2019-09-24T22:26:15.6700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (98, N'EstadisticasBaseDatosProduccion', 3, 5, CAST(N'2019-09-24T22:26:15.6700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (99, N'ESTADOCUENTAELECTRONICO', 3, 5, CAST(N'2019-09-24T22:26:15.6700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (100, N'ESYN_SYNCHRONIZER', 3, 5, CAST(N'2019-09-24T22:26:15.6700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (101, N'Etas.jar', 3, 5, CAST(N'2019-09-24T22:26:15.6700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (102, N'ETL_ALERT_CNB', 3, 5, CAST(N'2019-09-24T22:26:15.6700000' AS DateTime2), N'gestor', NULL, NULL)
GO
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (103, N'ETL_ATH_CARGA_COMERCIOS_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.6730000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (104, N'ETL_AUTDEN', 3, 5, CAST(N'2019-09-24T22:26:15.6730000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (105, N'ETL_DATATRANSFERCR', 3, 5, CAST(N'2019-09-24T22:26:15.6730000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (106, N'ETL_DATATRANSFERHN', 3, 5, CAST(N'2019-09-24T22:26:15.6730000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (107, N'ETL_DATATRANSFERINT', 3, 5, CAST(N'2019-09-24T22:26:15.6730000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (108, N'ETL_DATATRANSFERMEX', 3, 5, CAST(N'2019-09-24T22:26:15.6770000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (109, N'ETL_DETAIL_FILE', 3, 5, CAST(N'2019-09-24T22:26:15.6770000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (110, N'ETL_DIMENSIONES', 3, 5, CAST(N'2019-09-24T22:26:15.6770000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (111, N'ETL_DWH_ATM_VOLUME_TRANSFORMATION', 3, 5, CAST(N'2019-09-24T22:26:15.6770000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (112, N'ETL_DWH_LIQBASE24_DATA_CUT', 3, 5, CAST(N'2019-09-24T22:26:15.6800000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (113, N'ETL_DWH_LIQBASE24_LATRANS_CUT', 3, 5, CAST(N'2019-09-24T22:26:15.6800000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (114, N'ETL_DWH_LIQBASE24_MAINTAIN_CUT', 3, 5, CAST(N'2019-09-24T22:26:15.6800000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (115, N'ETL_DWH_POS_DATAMART', 3, 5, CAST(N'2019-09-24T22:26:15.6800000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (116, N'ETL_DWH_POS_TRANSFORMATION', 3, 5, CAST(N'2019-09-24T22:26:15.6800000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (117, N'ETL_DWH_SDT_SUMMARY_DAILY_TRANS', 3, 5, CAST(N'2019-09-24T22:26:15.6830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (118, N'ETL_DWH_SENTINEL_DATAMART', 3, 5, CAST(N'2019-09-24T22:26:15.6830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (119, N'ETL_DWH_SENTINEL_TRANSFORMATION', 3, 5, CAST(N'2019-09-24T22:26:15.6830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (120, N'ETL_DWH_SWA_TRANSFORMATION', 3, 5, CAST(N'2019-09-24T22:26:15.6830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (121, N'ETL_DWH_SWE_TRANSFORMATION', 3, 5, CAST(N'2019-09-24T22:26:15.6830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (122, N'ETL_DWH_TS_DATAMART', 3, 5, CAST(N'2019-09-24T22:26:15.6830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (123, N'ETL_DWH_VOLUME_TRANSFORMATION', 3, 5, CAST(N'2019-09-24T22:26:15.6870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (124, N'ETL_FILL_MFE_SAP_RECORDS', 3, 5, CAST(N'2019-09-24T22:26:15.6870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (125, N'ETL_FILL_POS_SAP_RECORDS', 3, 5, CAST(N'2019-09-24T22:26:15.6870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (126, N'ETL_FILL_SWA_SAP_RECORDS', 3, 5, CAST(N'2019-09-24T22:26:15.6870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (127, N'ETL_FILL_SWE_SAP_RECORDS', 3, 5, CAST(N'2019-09-24T22:26:15.6870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (128, N'ETL_FTX_CONTROL_FILES_MAINTENANCE', 3, 5, CAST(N'2019-09-24T22:26:15.6870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (129, N'ETL_GENAS400', 3, 5, CAST(N'2019-09-24T22:26:15.6900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (130, N'ETL_IMPORT_CNB_MCC', 3, 5, CAST(N'2019-09-24T22:26:15.6900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (131, N'ETL_IMPORT_SQL_DATA_II', 3, 5, CAST(N'2019-09-24T22:26:15.6900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (132, N'ETL_INFMOV', 3, 5, CAST(N'2019-09-24T22:26:15.6900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (133, N'ETL_IVR', 3, 5, CAST(N'2019-09-24T22:26:15.6900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (134, N'ETL_LA_FEE_SETTLE_RPT', 3, 5, CAST(N'2019-09-24T22:26:15.6900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (135, N'ETL_LIQB24_TERMINAL_SYNC', 3, 5, CAST(N'2019-09-24T22:26:15.6900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (136, N'ETL_LIQBASE24_CARGATLF', 3, 5, CAST(N'2019-09-24T22:26:15.6900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (137, N'ETL_LOAD_RESUME', 3, 5, CAST(N'2019-09-24T22:26:15.6930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (138, N'ETL_PAYMENTRECEIPT_REMISSION', 3, 5, CAST(N'2019-09-24T22:26:15.6930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (139, N'ETL_POS_CONTROL_VALIDATIONS', 3, 5, CAST(N'2019-09-24T22:26:15.6930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (140, N'ETL_SAETA_SINCHRONIZE_DEB_CRE', 3, 5, CAST(N'2019-09-24T22:26:15.6930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (141, N'ETL_SAETA_SINCRONIZADOR', 3, 5, CAST(N'2019-09-24T22:26:15.6930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (142, N'ETL_SAETA_SYNCHRONIZE_CR', 3, 5, CAST(N'2019-09-24T22:26:15.6930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (143, N'ETL_SAP_BILLING_FILE', 3, 5, CAST(N'2019-09-24T22:26:15.6970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (144, N'ETL_SAP_MFE_CONTROL_VALIDATIONS', 3, 5, CAST(N'2019-09-24T22:26:15.6970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (145, N'ETL_SAP_SWA_CONTROL_VALIDATIONS', 3, 5, CAST(N'2019-09-24T22:26:15.6970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (146, N'ETL_SAP_SWE_CONTROL_VALIDATIONS', 3, 5, CAST(N'2019-09-24T22:26:15.6970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (147, N'ETL_SAP_SYNCHRONIZER', 3, 5, CAST(N'2019-09-24T22:26:15.6970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (148, N'ETL_SINCRONIZADOR', 3, 5, CAST(N'2019-09-24T22:26:15.6970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (149, N'ETL_SINCRONIZADOR_HISTORY_TSATM', 3, 5, CAST(N'2019-09-24T22:26:15.7000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (150, N'ETL_SINCRONIZADOR_INT', 3, 5, CAST(N'2019-09-24T22:26:15.7000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (151, N'ETL_SINCRONIZADOR_TSLOG(CostaRica)', 3, 5, CAST(N'2019-09-24T22:26:15.7000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (152, N'ETL_SYNC_TABLE_T', 3, 5, CAST(N'2019-09-24T22:26:15.7000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (153, N'ETL_SYNCHRONIZER_TSSQL_TO_TSSQLExterna', 3, 5, CAST(N'2019-09-24T22:26:15.7000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (154, N'ETL_TRAN', 3, 5, CAST(N'2019-09-24T22:26:15.7000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (155, N'ETL_TRASATLANTICO_ISSUER', 3, 5, CAST(N'2019-09-24T22:26:15.7000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (156, N'ETL_TS_TSID_TFLMAE_SYNCH', 3, 5, CAST(N'2019-09-24T22:26:15.7000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (157, N'ETL_TsLog_INT(Internacional)', 3, 5, CAST(N'2019-09-24T22:26:15.7030000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (158, N'ETL_UPDATECONFIRMED', 3, 5, CAST(N'2019-09-24T22:26:15.7030000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (159, N'ETL_ZAETA_SINCRONIZE', 3, 5, CAST(N'2019-09-24T22:26:15.7030000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (160, N'ETL-Carga-Inventarios', 3, 5, CAST(N'2019-09-24T22:26:15.7030000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (161, N'ETL-COBRO_FEE', 3, 5, CAST(N'2019-09-24T22:26:15.7030000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (162, N'ETL-COPIAR-TRANS-DOS-PINOS', 3, 5, CAST(N'2019-09-24T22:26:15.7030000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (163, N'ETL-LIQBASE24_CARGATLF', 3, 5, CAST(N'2019-09-24T22:26:15.7070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (164, N'etl-LIQBASE24LA_TRANSLA_POS_TRANS', 3, 5, CAST(N'2019-09-24T22:26:15.7070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (165, N'ETL-UPTIMELIQBASE24aATH-WAP-BD', 3, 5, CAST(N'2019-09-24T22:26:15.7070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (166, N'EVERACCOUNTINGWEB', 3, 5, CAST(N'2019-09-24T22:26:15.7070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (167, N'EVERCONTRACTS', 3, 5, CAST(N'2019-09-24T22:26:15.7070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (168, N'EVERMOVDEB', 3, 5, CAST(N'2019-09-24T22:26:15.7070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (169, N'Ever_ATH_Network_Services_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.7100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (170, N'EVER_Change_Type', 3, 5, CAST(N'2019-09-24T22:26:15.7100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (171, N'EVER_CNBPROCESS', 3, 5, CAST(N'2019-09-24T22:26:15.7100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (172, N'EVER_CONTRACTS', 3, 5, CAST(N'2019-09-24T22:26:15.7100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (173, N'EVER_COOPENAEVIRTUAL', 3, 5, CAST(N'2019-09-24T22:26:15.7100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (174, N'EVER_ERP', 3, 5, CAST(N'2019-09-24T22:26:15.7100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (175, N'EVER_MOVDEB_REP', 3, 5, CAST(N'2019-09-24T22:26:15.7130000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (176, N'EVER_ProcBase24_File_Send', 3, 5, CAST(N'2019-09-24T22:26:15.7130000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (177, N'EVER_SAC_SecurityCode', 3, 5, CAST(N'2019-09-24T22:26:15.7130000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (178, N'EVER_SENTINEL_RISK', 3, 5, CAST(N'2019-09-24T22:26:15.7130000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (179, N'EVER_SETTLEMENT_FILE_SEND', 3, 5, CAST(N'2019-09-24T22:26:15.7130000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (180, N'EVER-ASSETS-INVENTORY', 3, 5, CAST(N'2019-09-24T22:26:15.7170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (181, N'EverClientWalmart', 3, 5, CAST(N'2019-09-24T22:26:15.7170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (182, N'EverClientWalmartWeb', 3, 5, CAST(N'2019-09-24T22:26:15.7170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (183, N'EVER-DETAINED_CARDS', 3, 5, CAST(N'2019-09-24T22:26:15.7170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (184, N'EverFraude', 3, 5, CAST(N'2019-09-24T22:26:15.7170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (185, N'EVERGASPER', 3, 5, CAST(N'2019-09-24T22:26:15.7200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (186, N'EVERMAIL', 3, 5, CAST(N'2019-09-24T22:26:15.7200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (187, N'EVER-PARAM', 3, 5, CAST(N'2019-09-24T22:26:15.7200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (188, N'EVERSAC', 3, 5, CAST(N'2019-09-24T22:26:15.7200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (189, N'EVERSMSCONFIG', 3, 5, CAST(N'2019-09-24T22:26:15.7200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (190, N'EVERSMSSERVER', 3, 5, CAST(N'2019-09-24T22:26:15.7200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (191, N'EVERTECSMSConfig', 3, 5, CAST(N'2019-09-24T22:26:15.7200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (192, N'EVERTECSMSConfig', 3, 5, CAST(N'2019-09-24T22:26:15.7230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (193, N'EVERTECSmsServer', 3, 5, CAST(N'2019-09-24T22:26:15.7230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (194, N'EVERTECSmsServer', 3, 5, CAST(N'2019-09-24T22:26:15.7230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (195, N'EVER-VERSION-GENERATOR', 3, 5, CAST(N'2019-09-24T22:26:15.7230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (196, N'FacturaciónSAP', 3, 5, CAST(N'2019-09-24T22:26:15.7270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (197, N'FILEQP', 3, 5, CAST(N'2019-09-24T22:26:15.7270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (198, N'FileEncryption', 3, 5, CAST(N'2019-09-24T22:26:15.7270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (199, N'FileParse', 3, 5, CAST(N'2019-09-24T22:26:15.7270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (200, N'FileTransfer', 3, 5, CAST(N'2019-09-24T22:26:15.7270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (201, N'FraudMonitorIssuer_WCF', 3, 5, CAST(N'2019-09-24T22:26:15.7300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (202, N'FRFRAUDETQYTRA03', 3, 5, CAST(N'2019-09-24T22:26:15.7300000' AS DateTime2), N'gestor', NULL, NULL)
GO
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (203, N'FTPW-FTP-WIN', 3, 5, CAST(N'2019-09-24T22:26:15.7300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (204, N'FTWE_FeeTx_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.7300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (205, N'FTWE_FeeTx_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.7300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (206, N'FTX_FILE_DECRYPTION_WIN', 3, 5, CAST(N'2019-09-24T22:26:15.7300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (207, N'FWAL_WALService_WCF', 3, 5, CAST(N'2019-09-24T22:26:15.7300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (208, N'GEMS', 3, 5, CAST(N'2019-09-24T22:26:15.7300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (209, N'GEMS(GEMS_General_Maintenance_System_WE', 3, 5, CAST(N'2019-09-24T22:26:15.7330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (210, N'GenerarReportesEAR', 3, 5, CAST(N'2019-09-24T22:26:15.7330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (211, N'GESTIONDECOBROS', 3, 5, CAST(N'2019-09-24T22:26:15.7330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (212, N'gestioncuentas', 3, 5, CAST(N'2019-09-24T22:26:15.7330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (213, N'HPDataProtector', 3, 5, CAST(N'2019-09-24T22:26:15.7330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (214, N'HYPERCOMVIEW', 3, 5, CAST(N'2019-09-24T22:26:15.7370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (215, N'INGELOAD', 3, 5, CAST(N'2019-09-24T22:26:15.7370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (216, N'INSERTCONTROLPROCESS', 3, 5, CAST(N'2019-09-24T22:26:15.7370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (217, N'Inv_Web', 3, 5, CAST(N'2019-09-24T22:26:15.7370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (218, N'InventarioWeb', 3, 5, CAST(N'2019-09-24T22:26:15.7370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (219, N'ISSUER', 3, 5, CAST(N'2019-09-24T22:26:15.7370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (220, N'ISSUEREMBOZADO', 3, 5, CAST(N'2019-09-24T22:26:15.7400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (221, N'ISSUERLEALTAD', 3, 5, CAST(N'2019-09-24T22:26:15.7400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (222, N'IVR_WEB(PAIW_PARSEA_ARCHIVO_IVR_UI)', 3, 5, CAST(N'2019-09-24T22:26:15.7400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (223, N'LIQV_Settlement_LiqVISA_ETL', 3, 5, CAST(N'2019-09-24T22:26:15.7400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (224, N'LiqVISA', 3, 5, CAST(N'2019-09-24T22:26:15.7400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (225, N'LiqVISA', 3, 5, CAST(N'2019-09-24T22:26:15.7400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (226, N'LIQV-LIQVISA-WIN', 3, 5, CAST(N'2019-09-24T22:26:15.7400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (227, N'LIVR-LIQVISA-RPT', 3, 5, CAST(N'2019-09-24T22:26:15.7430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (228, N'LIVW_LiqVISA_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.7430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (229, N'LIVW-LIQVISA-WEB', 3, 5, CAST(N'2019-09-24T22:26:15.7430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (230, N'LOGARITM', 3, 5, CAST(N'2019-09-24T22:26:15.7430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (231, N'Mastercard', 3, 5, CAST(N'2019-09-24T22:26:15.7430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (232, N'MASTERDATABV', 3, 5, CAST(N'2019-09-24T22:26:15.7470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (233, N'MASTERDATABY', 3, 5, CAST(N'2019-09-24T22:26:15.7470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (234, N'MASTERDATADB', 3, 5, CAST(N'2019-09-24T22:26:15.7470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (235, N'MASTERDATAFA', 3, 5, CAST(N'2019-09-24T22:26:15.7470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (236, N'MASTERDATAGB', 3, 5, CAST(N'2019-09-24T22:26:15.7470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (237, N'MASTERDATAKA', 3, 5, CAST(N'2019-09-24T22:26:15.7500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (238, N'MASTERDATAMB', 3, 5, CAST(N'2019-09-24T22:26:15.7500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (239, N'MASTERDATAUB', 3, 5, CAST(N'2019-09-24T22:26:15.7500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (240, N'MCEnvio', 3, 5, CAST(N'2019-09-24T22:26:15.7500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (241, N'MCPARSER', 3, 5, CAST(N'2019-09-24T22:26:15.7500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (242, N'MCWF_MessageCommunicator_WF', 3, 5, CAST(N'2019-09-24T22:26:15.7500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (243, N'ModulodeWebservices', 3, 5, CAST(N'2019-09-24T22:26:15.7500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (244, N'MonitoreoAdquierenteES', 3, 5, CAST(N'2019-09-24T22:26:15.7530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (245, N'MonitoreoAdquirente', 3, 5, CAST(N'2019-09-24T22:26:15.7530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (246, N'MSExchangeforEVERTECCostaRica', 3, 5, CAST(N'2019-09-24T22:26:15.7530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (247, N'OBST_Online_Balances_Sync_TS', 3, 5, CAST(N'2019-09-24T22:26:15.7530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (248, N'ON_Balance_Coopemep', 3, 5, CAST(N'2019-09-24T22:26:15.7530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (249, N'OPADMESPDISCO09', 3, 5, CAST(N'2019-09-24T22:26:15.7530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (250, N'OPINCOMINGATH07', 3, 5, CAST(N'2019-09-24T22:26:15.7570000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (251, N'OPIncomingMC', 3, 5, CAST(N'2019-09-24T22:26:15.7570000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (252, N'OPINCVISA10', 3, 5, CAST(N'2019-09-24T22:26:15.7570000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (253, N'OPMonitAnalisis', 3, 5, CAST(N'2019-09-24T22:26:15.7570000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (254, N'OPMonitAnalisis(MonitoreoAdquirente)', 3, 5, CAST(N'2019-09-24T22:26:15.7600000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (255, N'OPMS', 3, 5, CAST(N'2019-09-24T22:26:15.7600000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (256, N'OPMS', 3, 5, CAST(N'2019-09-24T22:26:15.7600000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (257, N'OPProcBase2413', 3, 5, CAST(N'2019-09-24T22:26:15.7600000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (258, N'OPPROCOPERACIONES12', 3, 5, CAST(N'2019-09-24T22:26:15.7600000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (259, N'OpServicesMonitor', 3, 5, CAST(N'2019-09-24T22:26:15.7600000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (260, N'OPVALORES03', 3, 5, CAST(N'2019-09-24T22:26:15.7600000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (261, N'OPVisualizarTransacciones.exe', 3, 5, CAST(N'2019-09-24T22:26:15.7630000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (262, N'OutSideView', 3, 5, CAST(N'2019-09-24T22:26:15.7630000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (263, N'PAGODESERVICIOSPUBLICOSCLIENTESSISC', 3, 5, CAST(N'2019-09-24T22:26:15.7630000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (264, N'PAIV_PARSEA_ARCHIVO_IVR_WIN', 3, 5, CAST(N'2019-09-24T22:26:15.7630000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (265, N'PAIW_PARSEA_ARCHIVO_IVR_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.7630000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (266, N'Panaderia', 3, 5, CAST(N'2019-09-24T22:26:15.7630000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (267, N'PARAMETROSGENERALES', 3, 5, CAST(N'2019-09-24T22:26:15.7670000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (268, N'PAYGATE', 3, 5, CAST(N'2019-09-24T22:26:15.7670000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (269, N'PayGateInter.war(Panamá)', 3, 5, CAST(N'2019-09-24T22:26:15.7670000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (270, N'PCNB_Ports_CNB', 3, 5, CAST(N'2019-09-24T22:26:15.7670000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (271, N'PortsMonitor_Transerver_CostaRicaservic', 3, 5, CAST(N'2019-09-24T22:26:15.7670000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (272, N'POSInventory_WCF', 3, 5, CAST(N'2019-09-24T22:26:15.7700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (273, N'ProcBase24_Change_Type', 3, 5, CAST(N'2019-09-24T22:26:15.7700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (274, N'ProcBase24_VisaOutgoing', 3, 5, CAST(N'2019-09-24T22:26:15.7700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (275, N'ProcBase24Admin', 3, 5, CAST(N'2019-09-24T22:26:15.7700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (276, N'ProcBase24CTO', 3, 5, CAST(N'2019-09-24T22:26:15.7700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (277, N'ProcBase24Liq', 3, 5, CAST(N'2019-09-24T22:26:15.7700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (278, N'ProcBase24POSTLF', 3, 5, CAST(N'2019-09-24T22:26:15.7700000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (279, N'ProcBase24RepLiq', 3, 5, CAST(N'2019-09-24T22:26:15.7730000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (280, N'ProcBase24Setl', 3, 5, CAST(N'2019-09-24T22:26:15.7730000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (281, N'ProcBase24TLF', 3, 5, CAST(N'2019-09-24T22:26:15.7730000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (282, N'ProcBase24Tran', 3, 5, CAST(N'2019-09-24T22:26:15.7730000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (283, N'ProcBase24Transfer', 3, 5, CAST(N'2019-09-24T22:26:15.7730000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (284, N'ProcBase24TRN', 3, 5, CAST(N'2019-09-24T22:26:15.7770000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (285, N'ProcBase24Uptame', 3, 5, CAST(N'2019-09-24T22:26:15.7770000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (286, N'Procesamiento', 3, 5, CAST(N'2019-09-24T22:26:15.7770000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (287, N'ProcesamientoWebsiteEar', 3, 5, CAST(N'2019-09-24T22:26:15.7770000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (288, N'PROGNOSISCostaRica', 3, 5, CAST(N'2019-09-24T22:26:15.7770000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (289, N'PVVLoader', 3, 5, CAST(N'2019-09-24T22:26:15.7770000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (290, N'QuickPass', 3, 5, CAST(N'2019-09-24T22:26:15.7800000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (291, N'Rechazos', 3, 5, CAST(N'2019-09-24T22:26:15.7800000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (292, N'RightFax10.6SR3', 3, 5, CAST(N'2019-09-24T22:26:15.7800000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (293, N'RPChart', 3, 5, CAST(N'2019-09-24T22:26:15.7800000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (294, N'RPT_CNB', 3, 5, CAST(N'2019-09-24T22:26:15.7800000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (295, N'RPT_IVR', 3, 5, CAST(N'2019-09-24T22:26:15.7800000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (296, N'SAETA', 3, 5, CAST(N'2019-09-24T22:26:15.7830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (297, N'SCAWEBService', 3, 5, CAST(N'2019-09-24T22:26:15.7830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (298, N'SEAD_SecurityAdmin_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.7830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (299, N'SEATH', 3, 5, CAST(N'2019-09-24T22:26:15.7830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (300, N'SEATHAplicativo', 3, 5, CAST(N'2019-09-24T22:26:15.7830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (301, N'SEATHWebService', 3, 5, CAST(N'2019-09-24T22:26:15.7830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (302, N'SecurityAdmin', 3, 5, CAST(N'2019-09-24T22:26:15.7870000' AS DateTime2), N'gestor', NULL, NULL)
GO
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (303, N'SECURITYCR', 3, 5, CAST(N'2019-09-24T22:26:15.7870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (304, N'SECURITYINT', 3, 5, CAST(N'2019-09-24T22:26:15.7870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (305, N'SecurityManager', 3, 5, CAST(N'2019-09-24T22:26:15.7870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (306, N'SecurityManagerServices', 3, 5, CAST(N'2019-09-24T22:26:15.7870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (307, N'Sense', 3, 5, CAST(N'2019-09-24T22:26:15.7870000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (308, N'SentinelServiceManager', 3, 5, CAST(N'2019-09-24T22:26:15.7900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (309, N'SentinelBI', 3, 5, CAST(N'2019-09-24T22:26:15.7900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (310, N'SentinelPrevention', 3, 5, CAST(N'2019-09-24T22:26:15.7900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (311, N'SERED', 3, 5, CAST(N'2019-09-24T22:26:15.7900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (312, N'Serfinsa-ATM', 3, 5, CAST(N'2019-09-24T22:26:15.7900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (313, N'ServiceSecurity3.0', 3, 5, CAST(N'2019-09-24T22:26:15.7900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (314, N'SFTS_Sychronizer_File_TS', 3, 5, CAST(N'2019-09-24T22:26:15.7900000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (315, N'SIAUTORIZA02', 3, 5, CAST(N'2019-09-24T22:26:15.7930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (316, N'SIBITACORATS12', 3, 5, CAST(N'2019-09-24T22:26:15.7930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (317, N'SICBITACORASTS12', 3, 5, CAST(N'2019-09-24T22:26:15.7930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (318, N'Sicepj(Bitacoras)', 3, 5, CAST(N'2019-09-24T22:26:15.7930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (319, N'SIGA', 3, 5, CAST(N'2019-09-24T22:26:15.7930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (320, N'SigaSite_WCF', 3, 5, CAST(N'2019-09-24T22:26:15.7930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (321, N'SIMO_SAP_Interfaces_Monitor_WIN', 3, 5, CAST(N'2019-09-24T22:26:15.7970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (322, N'SIMW_SAP_Interfaces_Monitor_WEB', 3, 5, CAST(N'2019-09-24T22:26:15.7970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (323, N'SINCRONIZADOR', 3, 5, CAST(N'2019-09-24T22:26:15.7970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (324, N'SincronizadorETAS', 3, 5, CAST(N'2019-09-24T22:26:15.7970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (325, N'SIPARAMETROS07', 3, 5, CAST(N'2019-09-24T22:26:15.7970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (326, N'SISCARDPROCESSINGCARD', 3, 5, CAST(N'2019-09-24T22:26:15.7970000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (327, N'SistemadeCargosAutomaticos', 3, 5, CAST(N'2019-09-24T22:26:15.8000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (328, N'SiteSecurity3.0', 3, 5, CAST(N'2019-09-24T22:26:15.8000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (329, N'SitioATH', 3, 5, CAST(N'2019-09-24T22:26:15.8000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (330, N'SLA', 3, 5, CAST(N'2019-09-24T22:26:15.8000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (331, N'SLA', 3, 5, CAST(N'2019-09-24T22:26:15.8000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (332, N'SLAS', 3, 5, CAST(N'2019-09-24T22:26:15.8000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (333, N'SLTS_Sychronizer_Log_TS', 3, 5, CAST(N'2019-09-24T22:26:15.8000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (334, N'SMARTSWITCH', 3, 5, CAST(N'2019-09-24T22:26:15.8030000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (335, N'SOLARWINDS', 3, 5, CAST(N'2019-09-24T22:26:15.8030000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (336, N'SPST_Sychronizer_Parameters_TS', 3, 5, CAST(N'2019-09-24T22:26:15.8030000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (337, N'SSTT_Syncronizer_Trans_TS_Credicorp', 3, 5, CAST(N'2019-09-24T22:26:15.8030000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (338, N'SSTT_Syncronizer_Trans_TS_Multibank', 3, 5, CAST(N'2019-09-24T22:26:15.8030000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (339, N'SSTT_SYSTEM_VERIFICATION_WINDOWS_WIN', 3, 5, CAST(N'2019-09-24T22:26:15.8070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (340, N'ST24_SynchronizerT24_WS', 3, 5, CAST(N'2019-09-24T22:26:15.8070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (341, N'SwitchAcquirerWeb_WCF', 3, 5, CAST(N'2019-09-24T22:26:15.8070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (342, N'SwitchingAcquirer_WCF', 3, 5, CAST(N'2019-09-24T22:26:15.8070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (343, N'SwitchingIssuer_WCF', 3, 5, CAST(N'2019-09-24T22:26:15.8070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (344, N'SYMANTEC', 3, 5, CAST(N'2019-09-24T22:26:15.8070000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (345, N'SYNCTRANSERVERCR(ATHSincronizador)', 3, 5, CAST(N'2019-09-24T22:26:15.8100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (346, N'Syncronizer_Trans_Coopemep', 3, 5, CAST(N'2019-09-24T22:26:15.8100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (347, N'Syncronizer_Trans_Coopenae', 3, 5, CAST(N'2019-09-24T22:26:15.8100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (348, N'TAIssuerSecurityFieldsClient', 3, 5, CAST(N'2019-09-24T22:26:15.8100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (349, N'TivoliStorageManagerSystem', 3, 5, CAST(N'2019-09-24T22:26:15.8100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (350, N'TNMS', 3, 5, CAST(N'2019-09-24T22:26:15.8100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (351, N'TRANSACCIONAL_PARAMETROS', 3, 5, CAST(N'2019-09-24T22:26:15.8100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (352, N'TRANSACTIONS', 3, 5, CAST(N'2019-09-24T22:26:15.8100000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (353, N'TRANSACTIONSEOD', 3, 5, CAST(N'2019-09-24T22:26:15.8130000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (354, N'TRANSACTIONSEODPEAJE', 3, 5, CAST(N'2019-09-24T22:26:15.8130000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (355, N'TRANSACTIONSVERSION3', 3, 5, CAST(N'2019-09-24T22:26:15.8130000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (356, N'TRANSACTIONSWEB', 3, 5, CAST(N'2019-09-24T22:26:15.8130000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (357, N'TransacVolume', 3, 5, CAST(N'2019-09-24T22:26:15.8130000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (358, N'transerver', 3, 5, CAST(N'2019-09-24T22:26:15.8130000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (359, N'TranserverBancoAtlantida', 3, 5, CAST(N'2019-09-24T22:26:15.8170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (360, N'TRANSERVERCOSTARICA', 3, 5, CAST(N'2019-09-24T22:26:15.8170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (361, N'TranserverdeInternacional(Contingenc', 3, 5, CAST(N'2019-09-24T22:26:15.8170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (362, N'TranserverdeCostaRica(Contingencia)', 3, 5, CAST(N'2019-09-24T22:26:15.8170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (363, N'TranserverdeCostaRicaAdquirencia', 3, 5, CAST(N'2019-09-24T22:26:15.8170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (364, N'TranserverdeMéxico(Contingencia)', 3, 5, CAST(N'2019-09-24T22:26:15.8170000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (365, N'TranserverdeTelered', 3, 5, CAST(N'2019-09-24T22:26:15.8200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (366, N'TRANSERVERDrivingCajerosBP', 3, 5, CAST(N'2019-09-24T22:26:15.8200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (367, N'TranserverEPA', 3, 5, CAST(N'2019-09-24T22:26:15.8200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (368, N'TRANSERVERExeption', 3, 5, CAST(N'2019-09-24T22:26:15.8200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (369, N'TranserverGESA', 3, 5, CAST(N'2019-09-24T22:26:15.8200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (370, N'TRANSERVERINTERNACIONAL', 3, 5, CAST(N'2019-09-24T22:26:15.8200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (371, N'TRANSERVERIssuer', 3, 5, CAST(N'2019-09-24T22:26:15.8200000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (372, N'TRANSERVERMEXICO', 3, 5, CAST(N'2019-09-24T22:26:15.8230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (373, N'TRANSERVERSTANDIN', 3, 5, CAST(N'2019-09-24T22:26:15.8230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (374, N'TranserverWalmartCR(Contingencia)', 3, 5, CAST(N'2019-09-24T22:26:15.8230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (375, N'TranserverWalmartGuatemala', 3, 5, CAST(N'2019-09-24T22:26:15.8230000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (376, N'TranserverWalmartGuatemala(Contingenc', 3, 5, CAST(N'2019-09-24T22:26:15.8270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (377, N'TRANSLOADWEB', 3, 5, CAST(N'2019-09-24T22:26:15.8270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (378, N'TransLoad_Mejoras', 3, 5, CAST(N'2019-09-24T22:26:15.8270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (379, N'TransLoad_Mutual', 3, 5, CAST(N'2019-09-24T22:26:15.8270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (380, N'TransMonitor_Walmart', 3, 5, CAST(N'2019-09-24T22:26:15.8270000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (381, N'Transrvr(Embozado)', 3, 5, CAST(N'2019-09-24T22:26:15.8300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (382, N'transrvr(Walmart)', 3, 5, CAST(N'2019-09-24T22:26:15.8300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (383, N'TRANSX', 3, 5, CAST(N'2019-09-24T22:26:15.8300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (384, N'TRANSY', 3, 5, CAST(N'2019-09-24T22:26:15.8300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (385, N'Transy2', 3, 5, CAST(N'2019-09-24T22:26:15.8300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (386, N'Transy2', 3, 5, CAST(N'2019-09-24T22:26:15.8300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (387, N'Transy2(Walmart)', 3, 5, CAST(N'2019-09-24T22:26:15.8300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (388, N'Trasiego', 3, 5, CAST(N'2019-09-24T22:26:15.8300000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (389, N'TSC_AV_PORTRPT', 3, 5, CAST(N'2019-09-24T22:26:15.8330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (390, N'TSC_AVIABILITY_ATM', 3, 5, CAST(N'2019-09-24T22:26:15.8330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (391, N'TSC_AVIABILITY_ATMRPT', 3, 5, CAST(N'2019-09-24T22:26:15.8330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (392, N'TSC_AVIABILITY_TSRPT', 3, 5, CAST(N'2019-09-24T22:26:15.8330000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (393, N'TSC_IMPORT_AVIABILITY_DATA', 3, 5, CAST(N'2019-09-24T22:26:15.8370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (394, N'TSConsolaCR', 3, 5, CAST(N'2019-09-24T22:26:15.8370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (395, N'TSConsolaINT', 3, 5, CAST(N'2019-09-24T22:26:15.8370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (396, N'TSConsolaMX', 3, 5, CAST(N'2019-09-24T22:26:15.8370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (397, N'TSDATACAPV', 3, 5, CAST(N'2019-09-24T22:26:15.8370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (398, N'TS-Monitor', 3, 5, CAST(N'2019-09-24T22:26:15.8370000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (399, N'TS-REWARD', 3, 5, CAST(N'2019-09-24T22:26:15.8400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (400, N'TS-Security', 3, 5, CAST(N'2019-09-24T22:26:15.8400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (401, N'Vericenter', 3, 5, CAST(N'2019-09-24T22:26:15.8400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (402, N'VolumenTransaccionalATM', 3, 5, CAST(N'2019-09-24T22:26:15.8400000' AS DateTime2), N'gestor', NULL, NULL)
GO
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (403, N'WebServiceTransaccionesdePayGate', 3, 5, CAST(N'2019-09-24T22:26:15.8400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (404, N'WebServices', 3, 5, CAST(N'2019-09-24T22:26:15.8400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (405, N'Web2Admin', 3, 5, CAST(N'2019-09-24T22:26:15.8400000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (406, N'WebServiceIVR', 3, 5, CAST(N'2019-09-24T22:26:15.8430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (407, N'WebServiceSitioWeb(toka)', 3, 5, CAST(N'2019-09-24T22:26:15.8430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (408, N'WebServiceTSSecurityCR', 3, 5, CAST(N'2019-09-24T22:26:15.8430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (409, N'WebServiceTSSecurityInt', 3, 5, CAST(N'2019-09-24T22:26:15.8430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (410, N'WebServiceTSSecurityWM', 3, 5, CAST(N'2019-09-24T22:26:15.8430000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (411, N'WebSite_WCF', 3, 5, CAST(N'2019-09-24T22:26:15.8470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (412, N'WebSiteSecurityCR', 3, 5, CAST(N'2019-09-24T22:26:15.8470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (413, N'WebSiteSecurityInt', 3, 5, CAST(N'2019-09-24T22:26:15.8470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (414, N'WebSiteSecurityWM', 3, 5, CAST(N'2019-09-24T22:26:15.8470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (415, N'WHAT´SUP', 3, 5, CAST(N'2019-09-24T22:26:15.8470000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (416, N'WinServiceRenderReport', 3, 5, CAST(N'2019-09-24T22:26:15.8500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (417, N'WSActivarVipEAR', 3, 5, CAST(N'2019-09-24T22:26:15.8500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (418, N'WsChangePass', 3, 5, CAST(N'2019-09-24T22:26:15.8500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (419, N'WSGestionAfiliacionEAR.ear(Panamá)', 3, 5, CAST(N'2019-09-24T22:26:15.8500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (420, N'WSGestionAfiliacionEARInter', 3, 5, CAST(N'2019-09-24T22:26:15.8500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (421, N'WSMG_SecurityManager', 3, 5, CAST(N'2019-09-24T22:26:15.8500000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (422, N'WSNotificacionesEAR', 3, 5, CAST(N'2019-09-24T22:26:15.8530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (423, N'WSProspectacion', 3, 5, CAST(N'2019-09-24T22:26:15.8530000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Applications] ([Id], [ApplicationName], [ApplicationType], [DepartmentId], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (424, N'WSTrasiegoEAR', 3, 5, CAST(N'2019-09-24T22:26:15.8530000' AS DateTime2), N'gestor', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Applications] OFF
GO
SET IDENTITY_INSERT [dbo].[Causes] ON 

INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (2, N'En Analisis', CAST(N'2019-08-26T23:36:22.2830000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (3, N'CUSTOMER.Customer Third Party', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (4, N'CUSTOMER.Staff Support Error', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (5, N'EVERTEC Third Party.Communication Line Error', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (6, N'EVERTEC Third Party.Power Failure / Environment
', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (7, N'EVERTEC.Data Error
', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (8, N'EVERTEC.Hardware
', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (9, N'EVERTEC.Network
', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (10, N'EVERTEC.Operational
', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (11, N'EVERTEC.Programming
', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (12, N'EVERTEC.Software
', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (13, N'EVERTEC.Solution Design
', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (14, N'EVERTEC.Staff Support Error
', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Causes] ([Id], [Description], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser]) VALUES (15, N'Evertec.third Party.Communication Line Error
', CAST(N'2019-08-26T23:36:47.1930000' AS DateTime2), N'gestor', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Causes] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (1, N'AB', N'Atlantic Bank', N'A', N'A', CAST(N'2019-08-27T00:16:04.4430000' AS DateTime2), N'gestor', NULL, NULL, N'BLZ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (2, N'AC  ', N'COOPEAMISTAD', N'A', N'I', CAST(N'2019-09-25T08:15:27.0200000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (3, N'AL  ', N'ALLBANK PANAMA', N'A', N'I', CAST(N'2019-09-25T08:16:07.1800000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (4, N'AU  ', N'AUSTROBANK (PANAMA) S.A.', N'A', N'I', CAST(N'2019-09-25T08:16:07.1830000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (5, N'AV  ', N'ACCOVI DE RL', N'A', N'I', CAST(N'2019-09-25T08:16:07.1830000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (6, N'B3  ', N'BCT BANK INTERNATIONAL PANAMA', N'A', N'I', CAST(N'2019-09-25T08:16:07.1830000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (7, N'B7  ', N'BANCO FOMENTO AGROPECUARIO', N'A', N'I', CAST(N'2019-09-25T08:16:07.1830000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (8, N'BB  ', N'TARJETAS BCT', N'A', N'A', CAST(N'2019-09-25T08:16:07.1870000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (9, N'BC  ', N'BANCO CUSCATLAN', N'A', N'A', CAST(N'2019-09-25T08:16:07.1870000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (10, N'BF  ', N'BANCO DE FINANZAS NICARAGUA', N'A', N'I', CAST(N'2019-09-25T08:16:07.1870000' AS DateTime2), N'gestor', NULL, NULL, N'NIO ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (11, N'BK  ', N'BOI BANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.1870000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (12, N'BL  ', N'BANESCO BANCO MULTIPLE S.A.', N'A', N'I', CAST(N'2019-09-25T08:16:07.1870000' AS DateTime2), N'gestor', NULL, NULL, N'DOM ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (13, N'BM  ', N'BANCO INMOBILIARIO - GUATEMALA', N'A', N'I', CAST(N'2019-09-25T08:16:07.1900000' AS DateTime2), N'gestor', NULL, NULL, N'GTM ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (14, N'BN  ', N'BANCO NACIONAL DE COSTA RICA', N'A', N'A', CAST(N'2019-09-25T08:16:07.1900000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (15, N'BO  ', N'BANCO LAFISE', N'A', N'A', CAST(N'2019-09-25T08:16:07.1900000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (16, N'BO  ', N'BANCO LAFISE', N'A', N'I', CAST(N'2019-09-25T08:16:07.1900000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (17, N'BP  ', N'BANCO POPULAR', N'A', N'A', CAST(N'2019-09-25T08:16:07.1900000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (18, N'BP  ', N'BANCO POPULAR', N'A', N'I', CAST(N'2019-09-25T08:16:07.1900000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (19, N'BQ  ', N'BANHCAFE', N'A', N'I', CAST(N'2019-09-25T08:16:07.1930000' AS DateTime2), N'gestor', NULL, NULL, N'HNL ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (20, N'BR  ', N'BANCO REFORMADOR - GUATEMALA', N'A', N'I', CAST(N'2019-09-25T08:16:07.1930000' AS DateTime2), N'gestor', NULL, NULL, N'GTM ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (21, N'BS  ', N'BICSA CARD', N'A', N'A', CAST(N'2019-09-25T08:16:07.1930000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (22, N'BT  ', N'BANCO BANTEC', N'A', N'I', CAST(N'2019-09-25T08:16:07.1930000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (23, N'BU  ', N'BANESCO PANAMA', N'A', N'A', CAST(N'2019-09-25T08:16:07.1930000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (24, N'BU  ', N'BANESCO PANAMA', N'A', N'I', CAST(N'2019-09-25T08:16:07.1970000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (25, N'BV  ', N'BBVA PANAMÁ', N'A', N'A', CAST(N'2019-09-25T08:16:07.1970000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (26, N'BV  ', N'BBVA PANAMÁ', N'A', N'I', CAST(N'2019-09-25T08:16:07.1970000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (27, N'BX  ', N'DAVIVIENDA COSTA RICA', N'A', N'A', CAST(N'2019-09-25T08:16:07.1970000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (28, N'BX  ', N'DAVIVIENDA COSTA RICA', N'A', N'I', CAST(N'2019-09-25T08:16:07.1970000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (29, N'BY  ', N'COOPEVE', N'A', N'I', CAST(N'2019-09-25T08:16:07.1970000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (30, N'BZ  ', N'BANCOLOMBIA CAYMAN', N'A', N'I', CAST(N'2019-09-25T08:16:07.2000000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (31, N'C1  ', N'COOPEANDE NO. 1', N'A', N'I', CAST(N'2019-09-25T08:16:07.2000000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (32, N'C2  ', N'COOPESERVIDORES RL', N'A', N'I', CAST(N'2019-09-25T08:16:07.2000000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (33, N'C3  ', N'COOPEMEP', N'A', N'I', CAST(N'2019-09-25T08:16:07.2000000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (34, N'CA  ', N'COOPEALIANZA', N'A', N'A', CAST(N'2019-09-25T08:16:07.2000000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (35, N'CA  ', N'COOPEALIANZA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2000000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (36, N'CB  ', N'COOPECAR R.L.', N'A', N'I', CAST(N'2019-09-25T08:16:07.2030000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (37, N'CC  ', N'COOPECOLON', N'A', N'I', CAST(N'2019-09-25T08:16:07.2030000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (38, N'CD  ', N'CREDECOOP', N'A', N'I', CAST(N'2019-09-25T08:16:07.2030000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (39, N'CE  ', N'COOPESPARTA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2030000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (40, N'CF  ', N'COOPEOROTINA R.L.', N'A', N'I', CAST(N'2019-09-25T08:16:07.2030000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (41, N'CG  ', N'COOPEGRECIA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2030000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (42, N'CI  ', N'COOPETACARES R.L.', N'A', N'I', CAST(N'2019-09-25T08:16:07.2070000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (43, N'CK  ', N'COOPECAJA R.L.', N'A', N'I', CAST(N'2019-09-25T08:16:07.2070000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (44, N'CL  ', N'CENTRAL BANCO UNIVERSAL (VEN)', N'A', N'I', CAST(N'2019-09-25T08:16:07.2070000' AS DateTime2), N'gestor', NULL, NULL, N'VEN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (45, N'CM  ', N'COOPEMEX', N'A', N'I', CAST(N'2019-09-25T08:16:07.2070000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (46, N'CN  ', N'COOPENAE', N'A', N'A', CAST(N'2019-09-25T08:16:07.2070000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (47, N'CN  ', N'COOPENAE', N'A', N'I', CAST(N'2019-09-25T08:16:07.2070000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (48, N'CO  ', N'BANCO DE COSTA RICA', N'A', N'A', CAST(N'2019-09-25T08:16:07.2100000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (49, N'CP  ', N'CONAPROSAL', N'A', N'I', CAST(N'2019-09-25T08:16:07.2100000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (50, N'CQ  ', N'COOCIQUE', N'A', N'A', CAST(N'2019-09-25T08:16:07.2100000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (51, N'CQ  ', N'COOCIQUE', N'A', N'I', CAST(N'2019-09-25T08:16:07.2100000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (52, N'CR  ', N'CREST S.A.', N'A', N'A', CAST(N'2019-09-25T08:16:07.2100000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (53, N'CS  ', N'COOPESANRAMON', N'A', N'I', CAST(N'2019-09-25T08:16:07.2100000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (54, N'CY  ', N'CATHAY CARD', N'A', N'I', CAST(N'2019-09-25T08:16:07.2130000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (55, N'DB  ', N'CREDICORP BANK', N'A', N'A', CAST(N'2019-09-25T08:16:07.2130000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (56, N'DB  ', N'CREDICORP BANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.2130000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (57, N'DP  ', N'DOS PINOS', N'A', N'A', CAST(N'2019-09-25T08:16:07.2130000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (58, N'DP  ', N'DOS PINOS', N'A', N'I', CAST(N'2019-09-25T08:16:07.2170000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (59, N'DV  ', N'DAVIVIENDA - HONDURAS', N'A', N'I', CAST(N'2019-09-25T08:16:07.2170000' AS DateTime2), N'gestor', NULL, NULL, N'HNL ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (60, N'EM  ', N'ATH PANAMA', N'A', N'A', CAST(N'2019-09-25T08:16:07.2170000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (61, N'F2  ', N'ACACESPSA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2170000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (62, N'F3  ', N'ACACU', N'A', N'I', CAST(N'2019-09-25T08:16:07.2170000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (63, N'F4  ', N'ACACYPAC', N'A', N'I', CAST(N'2019-09-25T08:16:07.2170000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (64, N'F5  ', N'ACECENTA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2200000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (65, N'F6  ', N'ACOCOMET', N'A', N'I', CAST(N'2019-09-25T08:16:07.2200000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (66, N'F7  ', N'ACODJAR', N'A', N'I', CAST(N'2019-09-25T08:16:07.2200000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (67, N'FP  ', N'FPB BANK INC.', N'A', N'I', CAST(N'2019-09-25T08:16:07.2200000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (68, N'GB  ', N'GLOBAL BANK', N'A', N'A', CAST(N'2019-09-25T08:16:07.2200000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (69, N'GB  ', N'GLOBAL BANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.2200000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (70, N'GN  ', N'BANCO GENERAL COSTA RICA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2230000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (71, N'GV  ', N'CAJA GONZALO VEGA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2230000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (72, N'HD  ', N'CAJA HIPODROMO', N'A', N'I', CAST(N'2019-09-25T08:16:07.2230000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (73, N'HL  ', N'CAJA CIHUALPILLI', N'A', N'I', CAST(N'2019-09-25T08:16:07.2230000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (74, N'HS  ', N'HSBC EL SALVADOR', N'A', N'A', CAST(N'2019-09-25T08:16:07.2230000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (75, N'IB  ', N'INTERBOLSA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2270000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (76, N'IM  ', N'GRUPO FINANCIERO IMPROSA', N'A', N'A', CAST(N'2019-09-25T08:16:07.2270000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (77, N'IM  ', N'GRUPO FINANCIERO IMPROSA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2270000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (78, N'IN  ', N'SCOTIABANK COSTA RICA', N'A', N'A', CAST(N'2019-09-25T08:16:07.2270000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (79, N'IN  ', N'SCOTIABANK COSTA RICA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2270000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (80, N'IP  ', N'INFINITE PAYMENTS', N'A', N'I', CAST(N'2019-09-25T08:16:07.2300000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (81, N'IS  ', N'BANCO DEL ISTMO (C.R.)', N'A', N'A', CAST(N'2019-09-25T08:16:07.2300000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (82, N'IS  ', N'BANCO DEL ISTMO (C.R.)', N'A', N'I', CAST(N'2019-09-25T08:16:07.2300000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (83, N'IU  ', N'INTERNATIONAL UNION BANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.2300000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (84, N'JM  ', N'CAJA JOSE MARIA MERCADO', N'A', N'I', CAST(N'2019-09-25T08:16:07.2300000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (85, N'KA  ', N'CAJA DE AHORRO', N'A', N'A', CAST(N'2019-09-25T08:16:07.2330000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (86, N'KA  ', N'CAJA DE AHORRO', N'A', N'I', CAST(N'2019-09-25T08:16:07.2330000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (87, N'KC  ', N'CAPITAL BANK', N'A', N'A', CAST(N'2019-09-25T08:16:07.2330000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (88, N'KC  ', N'CAPITAL BANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.2330000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (89, N'LA  ', N'BANCO LAFISE PANAMA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2330000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (90, N'LE  ', N'LAFISE EUROS', N'A', N'I', CAST(N'2019-09-25T08:16:07.2330000' AS DateTime2), N'gestor', NULL, NULL, N'EUR ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (91, N'LH  ', N'BANCO LAFISE HONDURAS', N'A', N'I', CAST(N'2019-09-25T08:16:07.2370000' AS DateTime2), N'gestor', NULL, NULL, N'HNL ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (92, N'LY  ', N'LYSTO CARD', N'A', N'I', CAST(N'2019-09-25T08:16:07.2370000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (93, N'MA  ', N'GRUPO MUTUAL', N'A', N'I', CAST(N'2019-09-25T08:16:07.2370000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (94, N'MB  ', N'MULTIBANK', N'A', N'A', CAST(N'2019-09-25T08:16:07.2370000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (95, N'MB  ', N'MULTIBANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.2370000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (96, N'MC  ', N'MUTUAL CARTAGO', N'A', N'I', CAST(N'2019-09-25T08:16:07.2400000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (97, N'ME  ', N'COMEDICA R.L.', N'A', N'I', CAST(N'2019-09-25T08:16:07.2400000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (98, N'MF  ', N'BANCO MONEX', N'A', N'I', CAST(N'2019-09-25T08:16:07.2400000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (99, N'MG  ', N'M GO RED SA DE CV', N'A', N'I', CAST(N'2019-09-25T08:16:07.2400000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
GO
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (100, N'ML  ', N'MUTUAL LA VIVIENDA', N'A', N'A', CAST(N'2019-09-25T08:16:07.2400000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (101, N'ML  ', N'MUTUAL LA VIVIENDA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2400000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (102, N'MM  ', N'CORPORACION SERVIVALORES', N'A', N'A', CAST(N'2019-09-25T08:16:07.2400000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (103, N'MM  ', N'CORPORACION SERVIVALORES', N'A', N'I', CAST(N'2019-09-25T08:16:07.2430000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (104, N'MO  ', N'IMPESA(MONIBYTE)', N'A', N'I', CAST(N'2019-09-25T08:16:07.2430000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (105, N'MR  ', N'CAJA MARAVATIO', N'A', N'I', CAST(N'2019-09-25T08:16:07.2430000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (106, N'MT  ', N'MERCANTIL BANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.2430000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (107, N'MY  ', N'CAJA 15 DE MAYO', N'A', N'I', CAST(N'2019-09-25T08:16:07.2470000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (108, N'NC  ', N'DAVIVIENDA (PANAMA)S.A.', N'A', N'I', CAST(N'2019-09-25T08:16:07.2470000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (109, N'NI  ', N'BANCO LAFISE NICARAGUA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2470000' AS DateTime2), N'gestor', NULL, NULL, N'NIO ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (110, N'NT  ', N'CARNET - REPUBLICA DOMINICANA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2470000' AS DateTime2), N'gestor', NULL, NULL, N'DOM ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (111, N'OA  ', N'COOPEACOSTA DEBITO MASTERCARD', N'A', N'I', CAST(N'2019-09-25T08:16:07.2470000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (112, N'OB  ', N'CAJA POPULAR OBLATOS', N'A', N'I', CAST(N'2019-09-25T08:16:07.2500000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (113, N'OC  ', N'BANCO DE OCCIDENTE', N'A', N'I', CAST(N'2019-09-25T08:16:07.2500000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (114, N'ON  ', N'ONE CARD', N'A', N'I', CAST(N'2019-09-25T08:16:07.2500000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (115, N'OP  ', N'COOPEBANPO DEBITO MASTERCARD', N'A', N'I', CAST(N'2019-09-25T08:16:07.2500000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (116, N'OR  ', N'OPERADORA DE RECURSOS REFORMA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2500000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (117, N'OU  ', N'COOPEUNA DEBITO MASTERCARD', N'A', N'I', CAST(N'2019-09-25T08:16:07.2500000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (118, N'PA  ', N'BANCO DEL PAIS', N'A', N'A', CAST(N'2019-09-25T08:16:07.2530000' AS DateTime2), N'gestor', NULL, NULL, N'HNL ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (119, N'PA  ', N'BANCO DEL PAIS', N'A', N'I', CAST(N'2019-09-25T08:16:07.2530000' AS DateTime2), N'gestor', NULL, NULL, N'HNL ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (120, N'PB  ', N'PRIMER BANCO DE LOS TRABAJ.', N'A', N'I', CAST(N'2019-09-25T08:16:07.2530000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (121, N'PC  ', N'FINANCIERA PRONTO CASH', N'A', N'I', CAST(N'2019-09-25T08:16:07.2530000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (122, N'PK  ', N'PRODUBANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.2530000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (123, N'PN  ', N'BANCO PANAMA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2530000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (124, N'PRET', N'PRUEBA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2570000' AS DateTime2), N'gestor', NULL, NULL, N'BLZ ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (125, N'PV  ', N'PRIVAL BANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.2570000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (126, N'PY  ', N'COSMOPAY', N'A', N'I', CAST(N'2019-09-25T08:16:07.2570000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (127, N'RL  ', N'AMC DE R.L. DE C.V.', N'A', N'I', CAST(N'2019-09-25T08:16:07.2570000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (128, N'RP  ', N'BANCO LAFISE REP. DOMINICANA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2570000' AS DateTime2), N'gestor', NULL, NULL, N'DOM ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (129, N'S4  ', N'SMB RURAL S.A. DE CV', N'A', N'I', CAST(N'2019-09-25T08:16:07.2600000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (130, N'SB  ', N'SCOTIABANK EL SALVADOR', N'A', N'A', CAST(N'2019-09-25T08:16:07.2600000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (131, N'SB  ', N'SCOTIABANK EL SALVADOR', N'A', N'I', CAST(N'2019-09-25T08:16:07.2600000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (132, N'SC  ', N'SCOTIABANK DE COSTA RICA', N'A', N'A', CAST(N'2019-09-25T08:16:07.2600000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (133, N'SC  ', N'SCOTIABANK DE COSTA RICA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2600000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (134, N'SF  ', N'SERVICIOS FINANCIEROS S.A.C.V.', N'A', N'A', CAST(N'2019-09-25T08:16:07.2600000' AS DateTime2), N'gestor', NULL, NULL, N'SLV ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (135, N'SH  ', N'CSL CHASE', N'A', N'I', CAST(N'2019-09-25T08:16:07.2630000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (136, N'SL  ', N'PRIVAL BANK COSTA RICA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2630000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (137, N'SM  ', N'COOPESANMARCOS', N'A', N'I', CAST(N'2019-09-25T08:16:07.2630000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (138, N'SP  ', N'SCOTIABANK PANAMA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2630000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (139, N'SV  ', N'SERVICOOP', N'A', N'I', CAST(N'2019-09-25T08:16:07.2630000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (140, N'TA  ', N'TRANSAMERICA BANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.2670000' AS DateTime2), N'gestor', NULL, NULL, N'BSD ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (141, N'TE  ', N'CAJA DE AHORRO TELEFONISTAS ME', N'A', N'I', CAST(N'2019-09-25T08:16:07.2670000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (142, N'TK  ', N'TOKA INVESTMENT, S.A. DE C.V.', N'A', N'I', CAST(N'2019-09-25T08:16:07.2670000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (143, N'TR  ', N'BANCO LOS TRABAJADORES', N'A', N'I', CAST(N'2019-09-25T08:16:07.2670000' AS DateTime2), N'gestor', NULL, NULL, N'GTM ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (144, N'TT  ', N'BANCO TRASATLANTICO', N'A', N'I', CAST(N'2019-09-25T08:16:07.2670000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (145, N'TW  ', N'TOWERBANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.2670000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (146, N'UB  ', N'UNICORP BANK', N'A', N'I', CAST(N'2019-09-25T08:16:07.2700000' AS DateTime2), N'gestor', NULL, NULL, N'PAN ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (147, N'UG  ', N'UNAGRA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2700000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (148, N'UN  ', N'UNISAP', N'A', N'I', CAST(N'2019-09-25T08:16:07.2700000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (149, N'VM  ', N'BANCO VE POR MAS-MEXICO', N'A', N'I', CAST(N'2019-09-25T08:16:07.2700000' AS DateTime2), N'gestor', NULL, NULL, N'MEX ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (150, N'VT  ', N'COOPEVICTORIA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2700000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (151, N'WR  ', N'WALMART COSTA RICA', N'A', N'I', CAST(N'2019-09-25T08:16:07.2700000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
INSERT [dbo].[Customers] ([Id], [CustomerCode], [CustomerName], [Status], [IssuerAdquier], [CreationDate], [CreationUser], [UpdateDate], [UpdateUser], [CountryCode], [Wallet]) VALUES (152, N'XS  ', N'ASECCSS', N'A', N'I', CAST(N'2019-09-25T08:16:07.2700000' AS DateTime2), N'gestor', NULL, NULL, N'CRC ', 0)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Name], [Creation_Date], [Create_User], [Update_Date], [Update_User]) VALUES (1, N'Unidad de Enlace', CAST(N'2020-01-27T12:00:00.0000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [Creation_Date], [Create_User], [Update_Date], [Update_User]) VALUES (2, N'Transerver', CAST(N'2020-01-27T12:00:00.0000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [Creation_Date], [Create_User], [Update_Date], [Update_User]) VALUES (3, N'Siscard', CAST(N'2020-01-27T12:00:00.0000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [Creation_Date], [Create_User], [Update_Date], [Update_User]) VALUES (4, N'Open System (Java)', CAST(N'2020-01-27T12:00:00.0000000' AS DateTime2), N'gestor', NULL, NULL)
INSERT [dbo].[Departments] ([Id], [Name], [Creation_Date], [Create_User], [Update_Date], [Update_User]) VALUES (5, N'Open System (Microsoft)', CAST(N'2020-01-27T12:00:00.0000000' AS DateTime2), N'gestor', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [TicketNumber], [Keyword], [AssignDate], [EndDate], [Comment], [CreationUser], [CreationDate], [UpdateUser], [UpdateDate], [AssignUser], [ApplicationId], [CauseId], [DepartmentId], [CustomerId]) VALUES (1, N'4328342', N'Incoming MC', CAST(N'2020-05-01T00:01:00.0000000' AS DateTime2), CAST(N'2020-05-02T00:00:00.0000000' AS DateTime2), N'Se encuentra en Hold en consulta a MC', N'jcervantes', CAST(N'2020-05-08T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-05-08T00:00:00.0000000' AS DateTime2), N'jcervantes', 251, 2, 5, 2)
INSERT [dbo].[Tickets] ([Id], [TicketNumber], [Keyword], [AssignDate], [EndDate], [Comment], [CreationUser], [CreationDate], [UpdateUser], [UpdateDate], [AssignUser], [ApplicationId], [CauseId], [DepartmentId], [CustomerId]) VALUES (2, N'453235', N'Datatransfer', CAST(N'2020-05-08T00:00:00.0000000' AS DateTime2), CAST(N'2020-05-09T00:00:00.0000000' AS DateTime2), N'Error a las 3 pm', N'jcervantes', CAST(N'2020-05-08T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-05-08T03:04:00.0000000' AS DateTime2), N'jcervantes', 74, 10, 5, 33)
INSERT [dbo].[Tickets] ([Id], [TicketNumber], [Keyword], [AssignDate], [EndDate], [Comment], [CreationUser], [CreationDate], [UpdateUser], [UpdateDate], [AssignUser], [ApplicationId], [CauseId], [DepartmentId], [CustomerId]) VALUES (3, N'4567903', N'Transacciones duplicadas Reporte T112', CAST(N'2020-06-16T18:30:00.0000000' AS DateTime2), NULL, N'Favor validar el motivo por el cual se encuentran duplicadas.', N'jcervantes', CAST(N'2020-06-23T11:26:24.8906273' AS DateTime2), NULL, NULL, N'jcervantes', 251, 2, 1, 34)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
/****** Object:  Index [IX_Applications_DepartmentId]    Script Date: 7/12/2020 7:51:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Applications_DepartmentId] ON [dbo].[Applications]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_ApplicationId]    Script Date: 7/12/2020 7:51:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_ApplicationId] ON [dbo].[Tickets]
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_CauseId]    Script Date: 7/12/2020 7:51:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_CauseId] ON [dbo].[Tickets]
(
	[CauseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_CustomerId]    Script Date: 7/12/2020 7:51:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_CustomerId] ON [dbo].[Tickets]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_DepartmentId]    Script Date: 7/12/2020 7:51:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_DepartmentId] ON [dbo].[Tickets]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_Departments_DepartmentId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Applications_ApplicationId] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Applications_ApplicationId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Causes_CauseId] FOREIGN KEY([CauseId])
REFERENCES [dbo].[Causes] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Causes_CauseId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Departments_DepartmentId]
GO
USE [master]
GO
ALTER DATABASE [UE_TICKETS_MANAGER] SET  READ_WRITE 
GO
