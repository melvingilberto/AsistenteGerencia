USE [master]
GO
/****** Object:  Database [asistente_de_gerencias]    Script Date: 22/09/2016 09:10:17 p.m. ******/
CREATE DATABASE [asistente_de_gerencias]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'asistente_de_gerencias', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\asistente_de_gerencias.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'asistente_de_gerencias_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\asistente_de_gerencias_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [asistente_de_gerencias] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [asistente_de_gerencias].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [asistente_de_gerencias] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET ARITHABORT OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [asistente_de_gerencias] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [asistente_de_gerencias] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [asistente_de_gerencias] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET  DISABLE_BROKER 
GO
ALTER DATABASE [asistente_de_gerencias] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [asistente_de_gerencias] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [asistente_de_gerencias] SET  MULTI_USER 
GO
ALTER DATABASE [asistente_de_gerencias] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [asistente_de_gerencias] SET DB_CHAINING OFF 
GO
ALTER DATABASE [asistente_de_gerencias] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [asistente_de_gerencias] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [asistente_de_gerencias]
GO
/****** Object:  StoredProcedure [dbo].[crearUsuarios]    Script Date: 22/09/2016 09:10:17 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[crearUsuarios]
@fname varchar(50),
@lname varchar(50),
@password varchar(75),
@user_name varchar(50),
@company varchar(50),
@comp_email varchar(50),
@email varchar(50),
@type int
as
Insert into users(fname,lname,email,password, user_name, company, comp_email,type) values(@fname,@lname,@email,@password,@user_name,@company,@comp_email, 1)
GO
/****** Object:  StoredProcedure [dbo].[createWorkers]    Script Date: 22/09/2016 09:10:17 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createWorkers]
@Name varchar(50),
@Id int,
@Email varchar(50),
@Phone varchar(50)
as
Insert into workers(id_buildings, user_name,email,phone) values(@Id,@Name,@Email,@Phone)
GO
/****** Object:  Table [dbo].[calendars]    Script Date: 22/09/2016 09:10:17 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[calendars](
	[id] [int] NOT NULL,
	[user_id] [int] NULL,
	[date_point] [date] NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_calendars] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[messages]    Script Date: 22/09/2016 09:10:17 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[messages](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[receptor_id] [int] NOT NULL,
	[description] [varchar](max) NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_message] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[posts]    Script Date: 22/09/2016 09:10:17 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[posts](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 22/09/2016 09:10:17 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](255) NOT NULL,
	[lname] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[user_name] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[type] [int] NULL,
	[company] [varchar](255) NULL,
	[comp_email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[workers]    Script Date: 22/09/2016 09:10:17 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[workers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_buildings] [int] NULL,
	[user_name] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [fname], [lname], [password], [email], [user_name], [phone], [type], [company], [comp_email]) VALUES (1, N'Melvin Gilberto', N'Solano Mendoza', N'12345678', N'melvingilbertos@gmail.com', N'Melvin Gilberto Solano Mendoza', NULL, 1, N'Fusion tutoriales', N'fusiontutoriales@gmail.com')
INSERT [dbo].[users] ([id], [fname], [lname], [password], [email], [user_name], [phone], [type], [company], [comp_email]) VALUES (1003, N'User', N'Administrator', N'12345678', N'admin@gmail.com', N'usuario administrador', NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
SET IDENTITY_INSERT [dbo].[workers] ON 

INSERT [dbo].[workers] ([id], [id_buildings], [user_name], [email], [phone]) VALUES (2, 1, N'Bob Esponjas', N'bob@gmail.com', N'9654025')
INSERT [dbo].[workers] ([id], [id_buildings], [user_name], [email], [phone]) VALUES (3, 1, N'Patricio', N'patricio@gmail.com', N'45216879')
INSERT [dbo].[workers] ([id], [id_buildings], [user_name], [email], [phone]) VALUES (4, 1002, N'Superman', N'superman@gmail.com', N'78521456')
INSERT [dbo].[workers] ([id], [id_buildings], [user_name], [email], [phone]) VALUES (5, 1, N'Arenita', N'arenita@gmail.com', N'87545236')
SET IDENTITY_INSERT [dbo].[workers] OFF
USE [master]
GO
ALTER DATABASE [asistente_de_gerencias] SET  READ_WRITE 
GO
