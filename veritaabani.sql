USE [master]
GO
/****** Object:  Database [Proje]    Script Date: 17.01.2022 15:44:41 ******/
CREATE DATABASE [Proje]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proje', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Proje.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proje_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Proje_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Proje] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proje].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proje] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proje] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proje] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proje] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proje] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proje] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proje] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proje] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proje] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proje] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proje] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proje] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proje] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proje] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proje] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proje] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proje] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proje] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proje] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proje] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proje] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proje] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proje] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proje] SET  MULTI_USER 
GO
ALTER DATABASE [Proje] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proje] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proje] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proje] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proje] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proje] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Proje] SET QUERY_STORE = OFF
GO
USE [Proje]
GO
/****** Object:  Table [dbo].[Araclar]    Script Date: 17.01.2022 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Araclar](
	[AracID] [uniqueidentifier] NULL,
	[Marka] [nvarchar](max) NULL,
	[Model] [nvarchar](max) NULL,
	[Yil] [int] NULL,
	[Fiyat] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PanelMenu]    Script Date: 17.01.2022 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PanelMenu](
	[Kimlik] [int] IDENTITY(1,1) NOT NULL,
	[Menu_Seviyesi] [varchar](30) NULL,
	[Siralama] [int] NULL,
	[Acacagi_Sayfa] [varchar](150) NULL,
	[Acilis_Sekli] [varchar](30) NULL,
	[Menu_Adi] [varchar](100) NULL,
	[Ait_Oldugu_Ana_Menu] [int] NULL,
	[AuthLevel] [int] NULL,
	[Icon] [nvarchar](max) NULL,
	[Modul] [nvarchar](max) NULL,
	[Menu_Adi_En] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 17.01.2022 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[PersonelID] [uniqueidentifier] NULL,
	[PartID] [uniqueidentifier] NULL,
	[AdSoyad] [nvarchar](max) NULL,
	[EPosta] [nvarchar](max) NULL,
	[PersonelPositionID] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [text] NULL,
	[AuthLevel] [int] NULL,
	[NTUsername] [nvarchar](max) NULL,
	[IsPartResponsible] [bit] NULL,
	[SegmentID] [uniqueidentifier] NULL,
	[IsEditor] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PanelMenu] ON 
GO
INSERT [dbo].[PanelMenu] ([Kimlik], [Menu_Seviyesi], [Siralama], [Acacagi_Sayfa], [Acilis_Sekli], [Menu_Adi], [Ait_Oldugu_Ana_Menu], [AuthLevel], [Icon], [Modul], [Menu_Adi_En]) VALUES (37, N'Ana', 0, N'arackayit.aspx', NULL, N'Araç Kayıt', NULL, 0, N'save', NULL, NULL)
GO
INSERT [dbo].[PanelMenu] ([Kimlik], [Menu_Seviyesi], [Siralama], [Acacagi_Sayfa], [Acilis_Sekli], [Menu_Adi], [Ait_Oldugu_Ana_Menu], [AuthLevel], [Icon], [Modul], [Menu_Adi_En]) VALUES (1038, N'Ana', 1, N'aracduzenle.aspx', NULL, N'Araç Düzenle', NULL, 0, N'edit', NULL, NULL)
GO
INSERT [dbo].[PanelMenu] ([Kimlik], [Menu_Seviyesi], [Siralama], [Acacagi_Sayfa], [Acilis_Sekli], [Menu_Adi], [Ait_Oldugu_Ana_Menu], [AuthLevel], [Icon], [Modul], [Menu_Adi_En]) VALUES (1039, N'Ana', 2, N'aracsil.aspx', NULL, N'Araç Sil', NULL, 0, N'eraser', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PanelMenu] OFF
GO
INSERT [dbo].[Personel] ([PersonelID], [PartID], [AdSoyad], [EPosta], [PersonelPositionID], [IsDeleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [UserName], [Password], [AuthLevel], [NTUsername], [IsPartResponsible], [SegmentID], [IsEditor]) VALUES (N'5e5c2881-1091-46cf-9ceb-0963bdae9b73', N'da0c83f5-ad34-47a6-93c7-949bb7f64511', N'admin', N'', N'86bc60b9-c1d8-4235-9b2f-685364f1262d', 0, CAST(N'2021-06-04T13:39:21.000' AS DateTime), N'sedat bıyık', CAST(N'2021-09-21T16:12:27.000' AS DateTime), N'eskalasyon ', N'admin', N'A1-F6-1D-36-2F-91-6E-90-13-4C-30-21-0F-EA-FF-38-D1-48-E9-A6-51-1B-16-E2-DA-98-E3-E8-EC-92-CF-D8', 10, N'admin', 0, NULL, 1)
GO
ALTER TABLE [dbo].[Araclar] ADD  CONSTRAINT [DF_Araclar_AracID]  DEFAULT (newid()) FOR [AracID]
GO
ALTER TABLE [dbo].[Personel] ADD  DEFAULT (newid()) FOR [PersonelID]
GO
ALTER TABLE [dbo].[Personel] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Personel] ADD  CONSTRAINT [DF_Personel_IsPartResponsible]  DEFAULT ((0)) FOR [IsPartResponsible]
GO
/****** Object:  StoredProcedure [dbo].[Set_Araclar]    Script Date: 17.01.2022 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Set_Araclar] 
	
	@AracID as uniqueidentifier,
	@Marka as nvarchar(max),
	@Model as nvarchar(max),
	@Yil as int,
	@Fiyat as int,
	@Islem  as nvarchar(max)
	
	

AS
BEGIN

	select @Islem;
	IF @Islem='YeniKayıt' BEGIN
				insert into Araclar(Marka,Model,Yil,Fiyat) values (@Marka,@Model,@Yil,@Fiyat)
		END
	IF @Islem='Güncelleme' BEGIN
				update Araclar set Marka=@Marka,Model=@Model,Yil=@Yil,Fiyat=@Fiyat where AracID=@AracID
	   END
	IF @Islem='Silme' BEGIN
				delete from Araclar where AracID=@AracID
				
		END

	
END
GO
USE [master]
GO
ALTER DATABASE [Proje] SET  READ_WRITE 
GO
