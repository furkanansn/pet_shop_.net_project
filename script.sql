USE [master]
GO
/****** Object:  Database [WebDemo]    Script Date: 5.06.2020 18:11:40 ******/
CREATE DATABASE [WebDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebDemo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WebDemo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebDemo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WebDemo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WebDemo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebDemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebDemo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebDemo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebDemo] SET  MULTI_USER 
GO
ALTER DATABASE [WebDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebDemo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebDemo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebDemo] SET QUERY_STORE = OFF
GO
USE [WebDemo]
GO
/****** Object:  Table [dbo].[Kargo]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kargo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SirketAdi] [nvarchar](150) NOT NULL,
	[Adres] [nvarchar](500) NULL,
	[Telefon] [char](15) NULL,
	[Website] [nvarchar](50) NULL,
	[EMail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kargo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[ResimID] [int] NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marka]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marka](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[ResimID] [int] NULL,
 CONSTRAINT [PK_Marka] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Soyadi] [nvarchar](50) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[EMail] [nvarchar](50) NOT NULL,
	[Telefon] [char](15) NOT NULL,
	[Sifre] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusteriAdres]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusteriAdres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MusteriID] [int] NOT NULL,
	[Adres] [nvarchar](500) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MusteriAdres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OzellikDeger]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OzellikDeger](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[OzellikTipID] [int] NOT NULL,
 CONSTRAINT [PK_OzellikDeger] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OzellikTip]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OzellikTip](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[kategoriID] [int] NOT NULL,
 CONSTRAINT [PK_OzellikTip] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resim]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyukYol] [nvarchar](250) NULL,
	[OrtaYol] [nvarchar](250) NULL,
	[KucukYol] [nvarchar](250) NULL,
	[Varsayilan] [bit] NULL,
	[SiraNo] [tinyint] NULL,
	[UrunID] [int] NULL,
 CONSTRAINT [PK_Resim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satis]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis](
	[Id] [int] NOT NULL,
	[MusteriID] [int] NULL,
	[SatisTarihi] [datetime] NOT NULL,
	[ToplamTutar] [money] NOT NULL,
	[SepetteMi] [bit] NOT NULL,
	[KargoID] [int] NULL,
	[SiparisDurumID] [int] NULL,
	[KargoTakipNo] [nvarchar](20) NULL,
 CONSTRAINT [PK_Satis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SatisDetay]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SatisDetay](
	[SatisID] [int] NOT NULL,
	[UrunID] [int] NOT NULL,
	[Adet] [int] NULL,
	[Fiyat] [money] NULL,
	[Indirim] [float] NULL,
 CONSTRAINT [PK_SatisDetay] PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC,
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisDurum]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDurum](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
 CONSTRAINT [PK_SiparisDurum] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](50) NULL,
	[AlisFiyati] [money] NOT NULL,
	[SatisFiyati] [money] NOT NULL,
	[EklenmeTarihi] [datetime] NULL,
	[SonKullanmaTarihi] [datetime] NULL,
	[KategoriID] [int] NULL,
	[MarkaID] [int] NULL,
	[Anasayfa] [bit] NULL,
	[Pasif] [bit] NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunOzellik]    Script Date: 5.06.2020 18:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunOzellik](
	[UrunID] [int] NOT NULL,
	[OzellikTipID] [int] NOT NULL,
	[OzellikDegerID] [int] NOT NULL,
 CONSTRAINT [PK_UrunOzellik] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC,
	[OzellikTipID] ASC,
	[OzellikDegerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (6, N'Kedi', NULL, NULL)
INSERT [dbo].[Kategori] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (8, N'Kuş', NULL, NULL)
INSERT [dbo].[Kategori] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (9, N'Tavşan', NULL, NULL)
INSERT [dbo].[Kategori] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (10, N'Köpek', NULL, NULL)
INSERT [dbo].[Kategori] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (11, N'Hamster', NULL, NULL)
INSERT [dbo].[Kategori] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (12, N'Balık', NULL, NULL)
INSERT [dbo].[Kategori] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (13, N'Sürüngen', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Kategori] OFF
SET IDENTITY_INSERT [dbo].[Marka] ON 

INSERT [dbo].[Marka] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (43, N'Bosch', NULL, 9)
INSERT [dbo].[Marka] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (44, N'Snoopy', NULL, 10)
INSERT [dbo].[Marka] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (45, N'Kent', NULL, 11)
INSERT [dbo].[Marka] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (46, N'Enjoy', NULL, 15)
INSERT [dbo].[Marka] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (47, N'Bonnie', NULL, 16)
INSERT [dbo].[Marka] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (48, N'Felicia', NULL, 17)
INSERT [dbo].[Marka] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (52, N'Jungle', NULL, 18)
INSERT [dbo].[Marka] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (56, N'Royal Canin', NULL, 20)
INSERT [dbo].[Marka] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (57, N'Quik', NULL, 21)
INSERT [dbo].[Marka] ([Id], [Adi], [Aciklama], [ResimID]) VALUES (58, N'Living World', NULL, 22)
SET IDENTITY_INSERT [dbo].[Marka] OFF
SET IDENTITY_INSERT [dbo].[OzellikDeger] ON 

INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (20, N'Diyet Köpek Maması', NULL, 7)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (21, N'Hamile Köpek Maması', NULL, 7)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (22, N'Yaşlı Köpek Maması', NULL, 7)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (23, N'Yavru köpek Maması', NULL, 7)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (24, N'Elizabeth Tasmaları', NULL, 8)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (25, N'K9 Köpek Tasmaları', NULL, 8)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (26, N'Köpek boyun Tasmaları', NULL, 8)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (27, N'Diyet Kedi Mamaları', NULL, 9)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (28, N'Hamile Kedi Mamaları', NULL, 9)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (29, N'Hassas Kedi Mamaları', NULL, 9)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (30, N'Özel Irk Kedi Mamaları', NULL, 9)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (31, N'Doğal Kedi Kumları', NULL, 10)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (32, N'Kristal Kedi Kumları', NULL, 10)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (33, N'Topraklaşan Kedi Kumları', NULL, 10)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (34, N'Kanarya Yemi', NULL, 11)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (35, N'Papağan Yemi', NULL, 11)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (36, N'Muhabbet Kuşu Yemi', NULL, 11)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (37, N'Kuş Boyunlukları', NULL, 12)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (38, N'Kuş Sulukları', NULL, 12)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (39, N'Kuş Mamalıkları', NULL, 12)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (40, N'Artemia Yemleri', NULL, 13)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (41, N'Tatlı Su Balık Yemleri', NULL, 13)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (42, N'Tuzlu Su Balık yemleri', NULL, 13)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (43, N'Fanuslar', NULL, 14)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (44, N'Japon Kitleri', NULL, 14)
INSERT [dbo].[OzellikDeger] ([Id], [Adi], [Aciklama], [OzellikTipID]) VALUES (45, N'Akvaryumlar', NULL, 14)
SET IDENTITY_INSERT [dbo].[OzellikDeger] OFF
SET IDENTITY_INSERT [dbo].[OzellikTip] ON 

INSERT [dbo].[OzellikTip] ([Id], [Adi], [Aciklama], [kategoriID]) VALUES (7, N'Köpek Maması', NULL, 10)
INSERT [dbo].[OzellikTip] ([Id], [Adi], [Aciklama], [kategoriID]) VALUES (8, N'Köpek Tasmaları', NULL, 10)
INSERT [dbo].[OzellikTip] ([Id], [Adi], [Aciklama], [kategoriID]) VALUES (9, N'Kedi Mamaları', NULL, 6)
INSERT [dbo].[OzellikTip] ([Id], [Adi], [Aciklama], [kategoriID]) VALUES (10, N'Kedi Kumları', NULL, 6)
INSERT [dbo].[OzellikTip] ([Id], [Adi], [Aciklama], [kategoriID]) VALUES (11, N'Kuş Yemleri', NULL, 8)
INSERT [dbo].[OzellikTip] ([Id], [Adi], [Aciklama], [kategoriID]) VALUES (12, N'Kuş Kafes Ekipmanları', NULL, 8)
INSERT [dbo].[OzellikTip] ([Id], [Adi], [Aciklama], [kategoriID]) VALUES (13, N'Balık Yemleri', NULL, 12)
INSERT [dbo].[OzellikTip] ([Id], [Adi], [Aciklama], [kategoriID]) VALUES (14, N'Balık Akvaryumu ve Sehpaları', NULL, 12)
SET IDENTITY_INSERT [dbo].[OzellikTip] OFF
SET IDENTITY_INSERT [dbo].[Resim] ON 

INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (9, NULL, N'/Content/MarkaResim/dbf6d7fc-f17b-4319-8e78-0026d974fc41.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (10, NULL, N'/Content/MarkaResim/ffd2cf82-b5d1-4e6e-be67-5d310e65bcc8.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (11, NULL, N'/Content/MarkaResim/e0d31666-b62f-48ee-97fd-688ac4534acc.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (12, N'/Content/UrunResim/Buyuk/6aeab46a-b81c-4f8e-893c-3a01ac3a8693.jpg', N'/Content/UrunResim/Orta/4f7d5b07-ef21-419b-9a13-8c5d8bbf6f55.jpg', NULL, 0, NULL, 3)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (13, N'/Content/UrunResim/Buyuk/78f90ca8-8a5c-4a81-bc91-23cb2c0cef06.jpg', N'/Content/UrunResim/Orta/6c59d537-7d31-4065-b748-9a2bc00abbfb.jpg', NULL, 0, NULL, 5)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (15, NULL, N'/Content/MarkaResim/086e447b-dd19-485d-a8fd-27606c7f47b7.jfif', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (16, NULL, N'/Content/MarkaResim/245705e1-baf3-4470-832e-4389e5bd9729.jfif', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (17, NULL, N'/Content/MarkaResim/68f7597c-daed-426b-ada8-40a26649dc84.jfif', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (18, NULL, N'/Content/MarkaResim/ebcaa90b-57b4-481e-8959-780515a33175.JPG', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (19, N'/Content/UrunResim/Buyuk/bf65ea92-89a5-4857-af78-afc132777e56.jpg', N'/Content/UrunResim/Orta/4f773675-3265-460d-9fd6-f2b5065c4f91.jpg', NULL, 0, NULL, 7)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (20, NULL, N'/Content/MarkaResim/7105e9d3-536f-4058-9746-53c2c4d9c8d3.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (21, NULL, N'/Content/MarkaResim/44c17cb7-39f7-4875-a91b-8d9b9d1434c5.jfif', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (22, NULL, N'/Content/MarkaResim/b216f93e-973f-4a27-83e9-9d89f013a501.jfif', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (24, N'/Content/SliderResim34267282-6778-4f91-b622-5b89aac54d68.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (25, N'/Content/UrunResim/Buyuk/7d1445b3-aab9-478b-a49f-9cec5c765a6a.jpg', N'/Content/UrunResim/Orta/96c1d474-c423-4ada-a242-c8609c50f094.jpg', NULL, 0, NULL, 8)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (26, N'/Content/UrunResim/Buyuk/b3cd0c31-e46a-423e-9229-0603ca5387af.jpg', N'/Content/UrunResim/Orta/69fdf2c6-0682-4d8a-b315-b13b8292896f.jpg', NULL, 0, NULL, 9)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (27, N'/Content/UrunResim/Buyuk/79f0a4db-c2be-44cb-875f-9b91d79d205e.jpg', N'/Content/UrunResim/Orta/1454d0d7-8bc8-4c23-95b6-fe3e3479b2c1.jpg', NULL, 0, NULL, 10)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (28, N'/Content/UrunResim/Buyuk/ffb59cd9-579b-404d-a213-0ca0494162d6.png', N'/Content/UrunResim/Orta/27780332-4005-4daf-a883-bcae29a4934b.png', NULL, 0, NULL, 11)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (29, N'/Content/UrunResim/Buyuk/36534982-6ecb-482e-a9fe-0250526a6b29.jpg', N'/Content/UrunResim/Orta/b0beea06-175a-4029-a61b-00c106090703.jpg', NULL, 0, NULL, 12)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (30, N'/Content/UrunResim/Buyuk/8830f698-9a00-4a09-b07a-06397e5a4a3c.png', N'/Content/UrunResim/Orta/afbbd1dc-86d0-415b-8b84-1edd7d7ccf45.png', NULL, 0, NULL, 13)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (31, N'/Content/UrunResim/Buyuk/c2c4d7b7-2107-4d3c-8f1c-171f342783a1.png', N'/Content/UrunResim/Orta/c41d4856-8bee-4acb-b623-6e1bfce74f7f.png', NULL, 0, NULL, 14)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (32, N'/Content/UrunResim/Buyuk/7609c460-bb98-4ae1-93a1-dc595c1c3d08.jpg', N'/Content/UrunResim/Orta/24a8fe55-cf98-4e6c-bfdf-142002c4f830.jpg', NULL, 0, NULL, 15)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (33, N'/Content/UrunResim/Buyuk/aea2a0f5-505f-4875-8ea1-cb7636dac53e.jpg', N'/Content/UrunResim/Orta/c0e86bce-bf1c-4516-a067-b501e3e85753.jpg', NULL, 0, NULL, 16)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (34, N'/Content/UrunResim/Buyuk/0c59e206-faf0-4d9e-b07e-8ff5fa9198d2.jpg', N'/Content/UrunResim/Orta/18c7aeb5-44bb-4896-b6c6-b6516fedce6a.jpg', NULL, 0, NULL, 17)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (35, N'/Content/UrunResim/Buyuk/03c5a862-42a5-4e96-852a-2869b3cafe2e.jpg', N'/Content/UrunResim/Orta/647b6fc3-7a1a-4485-8636-cb4b415cb5f1.jpg', NULL, 0, NULL, 18)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (36, N'/Content/UrunResim/Buyuk/37bd729e-7432-4acf-bc19-409ccb46429c.jpg', N'/Content/UrunResim/Orta/0242da68-4ca4-43a2-9341-4013b0ecd0cc.jpg', NULL, 0, NULL, 19)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (37, N'/Content/UrunResim/Buyuk/4231b5a8-269c-46ec-b5ba-49a59bfceedf.jpg', N'/Content/UrunResim/Orta/fcd0e669-5774-46d5-9662-0d906411b8cc.jpg', NULL, 0, NULL, 20)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (38, N'/Content/UrunResim/Buyuk/c164548a-5628-416a-a89d-b9834c44203c.jpg', N'/Content/UrunResim/Orta/6321e083-37c2-4566-a0ce-d51358af0d70.jpg', NULL, 0, NULL, 21)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (39, N'/Content/UrunResim/Buyuk/f115d43e-537f-4196-a211-f4f2c40fca71.jpg', N'/Content/UrunResim/Orta/370d2da1-85f8-4eaa-b91c-9a4e94f2ba40.jpg', NULL, 0, NULL, 22)
INSERT [dbo].[Resim] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (40, N'/Content/UrunResim/Buyuk/973a43e4-b8fd-44cc-ae42-b9cc8db90d61.jpeg', N'/Content/UrunResim/Orta/e7d213ef-b41b-4e61-970f-1baee55e37a3.jpeg', NULL, 0, NULL, 23)
SET IDENTITY_INSERT [dbo].[Resim] OFF
SET IDENTITY_INSERT [dbo].[Urun] ON 

INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (3, N'Special Light', N'12.5 kg', 199.0000, 329.0000, NULL, NULL, 6, 43, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (5, N'Elite Kafes', NULL, 99.0000, 199.0000, NULL, NULL, 8, 44, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (7, N'Jungle Sevgi Maması 125 gr-24 Adet', NULL, 15.0000, 45.0000, NULL, NULL, 10, 52, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (8, N'Sevgi Yaşlı Köpek Maması  125 gr-24 Adet', NULL, 25.0000, 45.0000, NULL, NULL, 10, 52, 0, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (9, N'Yavru köpek Maması', NULL, 45.0000, 65.0000, NULL, NULL, 10, 52, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (10, N'Hamile Köpek Maması', NULL, 80.0000, 120.0000, NULL, NULL, 10, 52, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (11, N'Light 40 Kuru Diyet Kedi Maması 2kg', NULL, 100.0000, 150.0000, NULL, NULL, 6, 56, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (12, N'Az Tahıllı  Hamile Kedi Maması  2 Kg', NULL, 35.0000, 55.0000, NULL, NULL, 6, 48, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (13, N'Hair Skin Hassas Tüylü Kedi Mamasi 2kg', NULL, 110.0000, 150.0000, NULL, NULL, 6, 56, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (14, N'Royal Canin Sphynx Kedi Maması 2 Kg', NULL, 150.0000, 160.0000, NULL, NULL, 6, 56, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (15, N'Doğal Kedi Kumu 1,5 kg', NULL, 5.0000, 15.0000, NULL, NULL, 6, 57, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (16, N'Slica Kristal Kedi Kumu 3,6kg', NULL, 25.0000, 35.0000, NULL, NULL, 6, 47, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (17, N'Karbonlu Grey Topraklaşan Kedi Kumu 3kg', NULL, 75.0000, 115.0000, NULL, NULL, 6, 52, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (18, N'Jungle Kanarya Yemi 400gr', NULL, 3.0000, 12.0000, NULL, NULL, 8, 52, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (19, N'Jungle Papağan Yemi 500gr', NULL, 5.0000, 15.0000, NULL, NULL, 8, 52, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (20, N'Lux Meyveli M. Kuş Yemi 5kg', NULL, 45.0000, 67.0000, NULL, NULL, 8, 57, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (21, N'Aynalı Kuş Boyunluğu', NULL, 9.0000, 15.0000, NULL, NULL, 8, 58, 1, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (22, N'Suluk Yatay Telli Kafesler İçin', NULL, 7.0000, 12.0000, NULL, NULL, 8, 58, 0, 1)
INSERT [dbo].[Urun] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [KategoriID], [MarkaID], [Anasayfa], [Pasif]) VALUES (23, N'Tünekli Kristal Mamalık', NULL, 5.0000, 9.0000, NULL, NULL, 8, 58, 1, 1)
SET IDENTITY_INSERT [dbo].[Urun] OFF
ALTER TABLE [dbo].[Kategori]  WITH CHECK ADD  CONSTRAINT [FK_Kategori_Resim] FOREIGN KEY([ResimID])
REFERENCES [dbo].[Resim] ([Id])
GO
ALTER TABLE [dbo].[Kategori] CHECK CONSTRAINT [FK_Kategori_Resim]
GO
ALTER TABLE [dbo].[Marka]  WITH CHECK ADD  CONSTRAINT [FK_Marka_Resim] FOREIGN KEY([ResimID])
REFERENCES [dbo].[Resim] ([Id])
GO
ALTER TABLE [dbo].[Marka] CHECK CONSTRAINT [FK_Marka_Resim]
GO
ALTER TABLE [dbo].[MusteriAdres]  WITH CHECK ADD  CONSTRAINT [FK_MusteriAdres_Musteri] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Musteri] ([Id])
GO
ALTER TABLE [dbo].[MusteriAdres] CHECK CONSTRAINT [FK_MusteriAdres_Musteri]
GO
ALTER TABLE [dbo].[OzellikDeger]  WITH CHECK ADD  CONSTRAINT [FK_OzellikDeger_OzellikTip] FOREIGN KEY([OzellikTipID])
REFERENCES [dbo].[OzellikTip] ([Id])
GO
ALTER TABLE [dbo].[OzellikDeger] CHECK CONSTRAINT [FK_OzellikDeger_OzellikTip]
GO
ALTER TABLE [dbo].[OzellikTip]  WITH CHECK ADD  CONSTRAINT [FK_OzellikTip_Kategori] FOREIGN KEY([kategoriID])
REFERENCES [dbo].[Kategori] ([Id])
GO
ALTER TABLE [dbo].[OzellikTip] CHECK CONSTRAINT [FK_OzellikTip_Kategori]
GO
ALTER TABLE [dbo].[Resim]  WITH CHECK ADD  CONSTRAINT [FK_Resim_Urun] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urun] ([Id])
GO
ALTER TABLE [dbo].[Resim] CHECK CONSTRAINT [FK_Resim_Urun]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_Kargo] FOREIGN KEY([KargoID])
REFERENCES [dbo].[Kargo] ([Id])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_Kargo]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_Musteri] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Musteri] ([Id])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_Musteri]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_SiparisDurum] FOREIGN KEY([SiparisDurumID])
REFERENCES [dbo].[SiparisDurum] ([Id])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_SiparisDurum]
GO
ALTER TABLE [dbo].[SatisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SatisDetay_Satis] FOREIGN KEY([SatisID])
REFERENCES [dbo].[Satis] ([Id])
GO
ALTER TABLE [dbo].[SatisDetay] CHECK CONSTRAINT [FK_SatisDetay_Satis]
GO
ALTER TABLE [dbo].[SatisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SatisDetay_Urun] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urun] ([Id])
GO
ALTER TABLE [dbo].[SatisDetay] CHECK CONSTRAINT [FK_SatisDetay_Urun]
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD  CONSTRAINT [FK_Urun_Kategori] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategori] ([Id])
GO
ALTER TABLE [dbo].[Urun] CHECK CONSTRAINT [FK_Urun_Kategori]
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD  CONSTRAINT [FK_Urun_Marka] FOREIGN KEY([MarkaID])
REFERENCES [dbo].[Marka] ([Id])
GO
ALTER TABLE [dbo].[Urun] CHECK CONSTRAINT [FK_Urun_Marka]
GO
ALTER TABLE [dbo].[UrunOzellik]  WITH CHECK ADD  CONSTRAINT [FK_UrunOzellik_OzellikDeger] FOREIGN KEY([OzellikDegerID])
REFERENCES [dbo].[OzellikDeger] ([Id])
GO
ALTER TABLE [dbo].[UrunOzellik] CHECK CONSTRAINT [FK_UrunOzellik_OzellikDeger]
GO
ALTER TABLE [dbo].[UrunOzellik]  WITH CHECK ADD  CONSTRAINT [FK_UrunOzellik_OzellikTip] FOREIGN KEY([OzellikTipID])
REFERENCES [dbo].[OzellikTip] ([Id])
GO
ALTER TABLE [dbo].[UrunOzellik] CHECK CONSTRAINT [FK_UrunOzellik_OzellikTip]
GO
ALTER TABLE [dbo].[UrunOzellik]  WITH CHECK ADD  CONSTRAINT [FK_UrunOzellik_Urun] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urun] ([Id])
GO
ALTER TABLE [dbo].[UrunOzellik] CHECK CONSTRAINT [FK_UrunOzellik_Urun]
GO
USE [master]
GO
ALTER DATABASE [WebDemo] SET  READ_WRITE 
GO
