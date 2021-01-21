USE [master]
GO
/****** Object:  Database [db_wallet_clip_money]    Script Date: 21-Jan-21 1:58:43 PM ******/
CREATE DATABASE [db_wallet_clip_money]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_wallet_clip_money', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\db_wallet_clip_money.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_wallet_clip_money_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\db_wallet_clip_money_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_wallet_clip_money] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_wallet_clip_money].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_wallet_clip_money] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_wallet_clip_money] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_wallet_clip_money] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_wallet_clip_money] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_wallet_clip_money] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_wallet_clip_money] SET  MULTI_USER 
GO
ALTER DATABASE [db_wallet_clip_money] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_wallet_clip_money] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_wallet_clip_money] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_wallet_clip_money] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_wallet_clip_money] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_wallet_clip_money] SET QUERY_STORE = OFF
GO
USE [db_wallet_clip_money]
GO
/****** Object:  Table [dbo].[cuentas]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuentas](
	[cvu] [bigint] IDENTITY(1,1) NOT NULL,
	[id_us] [int] NOT NULL,
	[saldo] [money] NOT NULL,
	[limite_al_descubierto] [money] NULL,
	[intereses_al_descubierto] [tinyint] NULL,
	[tipo_moneda] [varchar](20) NOT NULL,
	[fecha_alta] [datetime2](7) NOT NULL,
	[fecha_baja] [datetime2](7) NULL,
	[cuenta_activa] [bit] NOT NULL,
 CONSTRAINT [PK__cuentas__C7E286852917CF19] PRIMARY KEY CLUSTERED 
(
	[cvu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidades]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidades](
	[id_localidad] [int] IDENTITY(1,1) NOT NULL,
	[id_prov] [tinyint] NOT NULL,
	[nom_loc] [varchar](50) NULL,
 CONSTRAINT [PK_localidades] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id_login] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[id_us] [int] NOT NULL,
	[id_cuenta] [bigint] NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operaciones]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operaciones](
	[id_operacion] [smallint] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime2](7) NOT NULL,
	[monto] [money] NOT NULL,
	[cvu_cbu_destino] [bigint] NULL,
	[tipo_op] [smallint] NOT NULL,
	[id_cuenta] [bigint] NOT NULL,
	[monto_giro] [money] NULL,
 CONSTRAINT [PK_operaciones] PRIMARY KEY CLUSTERED 
(
	[id_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[id_pais] [tinyint] IDENTITY(1,1) NOT NULL,
	[nom_pais] [varchar](30) NOT NULL,
 CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincias](
	[id_provincia] [tinyint] IDENTITY(1,1) NOT NULL,
	[nom_prov] [varchar](30) NOT NULL,
	[id_pais] [tinyint] NOT NULL,
 CONSTRAINT [PK_provincias] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_operaciones]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_operaciones](
	[id_tipo_operacion] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre_op] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tipo_operaciones] PRIMARY KEY CLUSTERED 
(
	[id_tipo_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[foto_frente_dni] [varchar](50) NOT NULL,
	[foto_reverso_dni] [varchar](50) NOT NULL,
	[dni] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[fecha_nac] [date] NOT NULL,
	[cuilcuit] [bigint] NOT NULL,
	[telefono] [varchar](20) NULL,
	[calle] [varchar](30) NOT NULL,
	[numero_calle] [char](6) NOT NULL,
	[departamento] [bit] NULL,
	[piso] [tinyint] NULL,
	[puerta] [char](10) NULL,
	[barrio] [varchar](20) NOT NULL,
	[codigo_postal] [char](9) NOT NULL,
	[id_localidad] [int] NOT NULL,
	[preguntaSecreta] [varchar](100) NOT NULL,
	[respuestaSecreta] [varchar](100) NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[localidades] ON 

INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (1, 1, N'25 de Mayo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (2, 1, N'3 de febrero')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (3, 1, N'A. Alsina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (4, 1, N'A. Gonzáles Cháves')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (5, 1, N'Aguas Verdes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (6, 1, N'Alberti')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (7, 1, N'Arrecifes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (8, 1, N'Ayacucho')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (9, 1, N'Azul')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (10, 1, N'Bahía Blanca')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (11, 1, N'Balcarce')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (12, 1, N'Baradero')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (13, 1, N'Benito Juárez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (14, 1, N'Berisso')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (15, 1, N'Bolívar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (16, 1, N'Bragado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (17, 1, N'Brandsen')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (18, 1, N'Campana')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (19, 1, N'Cañuelas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (20, 1, N'Capilla del Señor')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (21, 1, N'Capitán Sarmiento')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (22, 1, N'Carapachay')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (23, 1, N'Carhue')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (24, 1, N'Cariló')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (25, 1, N'Carlos Casares')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (26, 1, N'Carlos Tejedor')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (27, 1, N'Carmen de Areco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (28, 1, N'Carmen de Patagones')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (29, 1, N'Castelli')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (30, 1, N'Chacabuco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (31, 1, N'Chascomús')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (32, 1, N'Chivilcoy')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (33, 1, N'Colón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (34, 1, N'Coronel Dorrego')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (35, 1, N'Coronel Pringles')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (36, 1, N'Coronel Rosales')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (37, 1, N'Coronel Suarez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (38, 1, N'Costa Azul')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (39, 1, N'Costa Chica')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (40, 1, N'Costa del Este')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (41, 1, N'Costa Esmeralda')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (42, 1, N'Daireaux')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (43, 1, N'Darregueira')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (44, 1, N'Del Viso')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (45, 1, N'Dolores')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (46, 1, N'Don Torcuato')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (47, 1, N'Ensenada')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (48, 1, N'Escobar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (49, 1, N'Exaltación de la Cruz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (50, 1, N'Florentino Ameghino')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (51, 1, N'Garín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (52, 1, N'Gral. Alvarado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (53, 1, N'Gral. Alvear')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (54, 1, N'Gral. Arenales')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (55, 1, N'Gral. Belgrano')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (56, 1, N'Gral. Guido')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (57, 1, N'Gral. Lamadrid')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (58, 1, N'Gral. Las Heras')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (59, 1, N'Gral. Lavalle')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (60, 1, N'Gral. Madariaga')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (61, 1, N'Gral. Pacheco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (62, 1, N'Gral. Paz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (63, 1, N'Gral. Pinto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (64, 1, N'Gral. Pueyrredón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (65, 1, N'Gral. Rodríguez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (66, 1, N'Gral. Viamonte')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (67, 1, N'Gral. Villegas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (68, 1, N'Guaminí')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (69, 1, N'Guernica')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (70, 1, N'Hipólito Yrigoyen')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (71, 1, N'Ing. Maschwitz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (72, 1, N'Junín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (73, 1, N'La Plata')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (74, 1, N'Laprida')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (75, 1, N'Las Flores')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (76, 1, N'Las Toninas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (77, 1, N'Leandro N. Alem')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (78, 1, N'Lincoln')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (79, 1, N'Loberia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (80, 1, N'Lobos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (81, 1, N'Los Cardales')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (82, 1, N'Los Toldos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (83, 1, N'Lucila del Mar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (84, 1, N'Luján')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (85, 1, N'Magdalena')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (86, 1, N'Maipú')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (87, 1, N'Mar Chiquita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (88, 1, N'Mar de Ajó')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (89, 1, N'Mar de las Pampas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (90, 1, N'Mar del Plata')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (91, 1, N'Mar del Tuyú')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (92, 1, N'Marcos Paz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (93, 1, N'Mercedes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (94, 1, N'Miramar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (95, 1, N'Monte')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (96, 1, N'Monte Hermoso')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (97, 1, N'Munro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (98, 1, N'Navarro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (99, 1, N'Necochea')
GO
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (100, 1, N'Olavarría')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (101, 1, N'Partido de la Costa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (102, 1, N'Pehuajó')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (103, 1, N'Pellegrini')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (104, 1, N'Pergamino')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (105, 1, N'Pigüé')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (106, 1, N'Pila')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (107, 1, N'Pilar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (108, 1, N'Pinamar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (109, 1, N'Pinar del Sol')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (110, 1, N'Polvorines')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (111, 1, N'Pte. Perón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (112, 1, N'Puán')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (113, 1, N'Punta Indio')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (114, 1, N'Ramallo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (115, 1, N'Rauch')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (116, 1, N'Rivadavia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (117, 1, N'Rojas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (118, 1, N'Roque Pérez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (119, 1, N'Saavedra')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (120, 1, N'Saladillo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (121, 1, N'Salliqueló')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (122, 1, N'Salto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (123, 1, N'San Andrés de Giles')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (124, 1, N'San Antonio de Areco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (125, 1, N'San Antonio de Padua')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (126, 1, N'San Bernardo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (127, 1, N'San Cayetano')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (128, 1, N'San Clemente del Tuyú')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (129, 1, N'San Nicolás')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (130, 1, N'San Pedro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (131, 1, N'San Vicente')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (132, 1, N'Santa Teresita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (133, 1, N'Suipacha')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (134, 1, N'Tandil')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (135, 1, N'Tapalqué')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (136, 1, N'Tordillo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (137, 1, N'Tornquist')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (138, 1, N'Trenque Lauquen')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (139, 1, N'Tres Lomas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (140, 1, N'Villa Gesell')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (141, 1, N'Villarino')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (142, 1, N'Zárate')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (143, 2, N'11 de Septiembre')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (144, 2, N'20 de Junio')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (145, 2, N'25 de Mayo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (146, 2, N'Acassuso')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (147, 2, N'Adrogué')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (148, 2, N'Aldo Bonzi')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (149, 2, N'Área Reserva Cinturón Ecológico')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (150, 2, N'Avellaneda')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (151, 2, N'Banfield')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (152, 2, N'Barrio Parque')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (153, 2, N'Barrio Santa Teresita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (154, 2, N'Beccar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (155, 2, N'Bella Vista')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (156, 2, N'Berazategui')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (157, 2, N'Bernal Este')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (158, 2, N'Bernal Oeste')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (159, 2, N'Billinghurst')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (160, 2, N'Boulogne')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (161, 2, N'Burzaco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (162, 2, N'Carapachay')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (163, 2, N'Caseros')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (164, 2, N'Castelar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (165, 2, N'Churruca')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (166, 2, N'Ciudad Evita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (167, 2, N'Ciudad Madero')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (168, 2, N'Ciudadela')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (169, 2, N'Claypole')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (170, 2, N'Crucecita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (171, 2, N'Dock Sud')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (172, 2, N'Don Bosco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (173, 2, N'Don Orione')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (174, 2, N'El Jagüel')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (175, 2, N'El Libertador')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (176, 2, N'El Palomar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (177, 2, N'El Tala')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (178, 2, N'El Trébol')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (179, 2, N'Ezeiza')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (180, 2, N'Ezpeleta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (181, 2, N'Florencio Varela')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (182, 2, N'Florida')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (183, 2, N'Francisco Álvarez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (184, 2, N'Gerli')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (185, 2, N'Glew')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (186, 2, N'González Catán')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (187, 2, N'Gral. Lamadrid')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (188, 2, N'Grand Bourg')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (189, 2, N'Gregorio de Laferrere')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (190, 2, N'Guillermo Enrique Hudson')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (191, 2, N'Haedo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (192, 2, N'Hurlingham')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (193, 2, N'Ing. Sourdeaux')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (194, 2, N'Isidro Casanova')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (195, 2, N'Ituzaingó')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (196, 2, N'José C. Paz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (197, 2, N'José Ingenieros')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (198, 2, N'José Marmol')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (199, 2, N'La Lucila')
GO
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (200, 2, N'La Reja')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (201, 2, N'La Tablada')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (202, 2, N'Lanús')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (203, 2, N'Llavallol')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (204, 2, N'Loma Hermosa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (205, 2, N'Lomas de Zamora')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (206, 2, N'Lomas del Millón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (207, 2, N'Lomas del Mirador')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (208, 2, N'Longchamps')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (209, 2, N'Los Polvorines')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (210, 2, N'Luis Guillón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (211, 2, N'Malvinas Argentinas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (212, 2, N'Martín Coronado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (213, 2, N'Martínez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (214, 2, N'Merlo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (215, 2, N'Ministro Rivadavia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (216, 2, N'Monte Chingolo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (217, 2, N'Monte Grande')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (218, 2, N'Moreno')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (219, 2, N'Morón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (220, 2, N'Muñiz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (221, 2, N'Olivos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (222, 2, N'Pablo Nogués')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (223, 2, N'Pablo Podestá')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (224, 2, N'Paso del Rey')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (225, 2, N'Pereyra')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (226, 2, N'Piñeiro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (227, 2, N'Plátanos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (228, 2, N'Pontevedra')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (229, 2, N'Quilmes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (230, 2, N'Rafael Calzada')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (231, 2, N'Rafael Castillo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (232, 2, N'Ramos Mejía')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (233, 2, N'Ranelagh')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (234, 2, N'Remedios de Escalada')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (235, 2, N'Sáenz Peña')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (236, 2, N'San Antonio de Padua')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (237, 2, N'San Fernando')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (238, 2, N'San Francisco Solano')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (239, 2, N'San Isidro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (240, 2, N'San José')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (241, 2, N'San Justo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (242, 2, N'San Martín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (243, 2, N'San Miguel')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (244, 2, N'Santos Lugares')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (245, 2, N'Sarandí')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (246, 2, N'Sourigues')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (247, 2, N'Tapiales')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (248, 2, N'Temperley')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (249, 2, N'Tigre')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (250, 2, N'Tortuguitas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (251, 2, N'Tristán Suárez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (252, 2, N'Trujui')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (253, 2, N'Turdera')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (254, 2, N'Valentín Alsina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (255, 2, N'Vicente López')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (256, 2, N'Villa Adelina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (257, 2, N'Villa Ballester')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (258, 2, N'Villa Bosch')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (259, 2, N'Villa Caraza')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (260, 2, N'Villa Celina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (261, 2, N'Villa Centenario')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (262, 2, N'Villa de Mayo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (263, 2, N'Villa Diamante')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (264, 2, N'Villa Domínico')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (265, 2, N'Villa España')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (266, 2, N'Villa Fiorito')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (267, 2, N'Villa Guillermina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (268, 2, N'Villa Insuperable')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (269, 2, N'Villa José León Suárez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (270, 2, N'Villa La Florida')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (271, 2, N'Villa Luzuriaga')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (272, 2, N'Villa Martelli')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (273, 2, N'Villa Obrera')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (274, 2, N'Villa Progreso')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (275, 2, N'Villa Raffo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (276, 2, N'Villa Sarmiento')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (277, 2, N'Villa Tesei')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (278, 2, N'Villa Udaondo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (279, 2, N'Virrey del Pino')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (280, 2, N'Wilde')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (281, 2, N'William Morris')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (282, 3, N'Agronomía')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (283, 3, N'Almagro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (284, 3, N'Balvanera')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (285, 3, N'Barracas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (286, 3, N'Belgrano')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (287, 3, N'Boca')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (288, 3, N'Boedo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (289, 3, N'Caballito')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (290, 3, N'Chacarita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (291, 3, N'Coghlan')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (292, 3, N'Colegiales')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (293, 3, N'Constitución')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (294, 3, N'Flores')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (295, 3, N'Floresta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (296, 3, N'La Paternal')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (297, 3, N'Liniers')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (298, 3, N'Mataderos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (299, 3, N'Monserrat')
GO
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (300, 3, N'Monte Castro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (301, 3, N'Nueva Pompeya')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (302, 3, N'Núñez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (303, 3, N'Palermo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (304, 3, N'Parque Avellaneda')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (305, 3, N'Parque Chacabuco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (306, 3, N'Parque Chas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (307, 3, N'Parque Patricios')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (308, 3, N'Puerto Madero')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (309, 3, N'Recoleta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (310, 3, N'Retiro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (311, 3, N'Saavedra')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (312, 3, N'San Cristóbal')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (313, 3, N'San Nicolás')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (314, 3, N'San Telmo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (315, 3, N'Vélez Sársfield')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (316, 3, N'Versalles')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (317, 3, N'Villa Crespo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (318, 3, N'Villa del Parque')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (319, 3, N'Villa Devoto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (320, 3, N'Villa Gral. Mitre')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (321, 3, N'Villa Lugano')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (322, 3, N'Villa Luro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (323, 3, N'Villa Ortúzar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (324, 3, N'Villa Pueyrredón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (325, 3, N'Villa Real')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (326, 3, N'Villa Riachuelo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (327, 3, N'Villa Santa Rita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (328, 3, N'Villa Soldati')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (329, 3, N'Villa Urquiza')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (330, 4, N'Aconquija')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (331, 4, N'Ancasti')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (332, 4, N'Andalgalá')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (333, 4, N'Antofagasta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (334, 4, N'Belén')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (335, 4, N'Capayán')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (336, 4, N'Capital')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (337, 4, N'4')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (338, 4, N'Corral Quemado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (339, 4, N'El Alto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (340, 4, N'El Rodeo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (341, 4, N'F.Mamerto Esquiú')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (342, 4, N'Fiambalá')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (343, 4, N'Hualfín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (344, 4, N'Huillapima')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (345, 4, N'Icaño')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (346, 4, N'La Puerta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (347, 4, N'Las Juntas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (348, 4, N'Londres')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (349, 4, N'Los Altos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (350, 4, N'Los Varela')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (351, 4, N'Mutquín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (352, 4, N'Paclín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (353, 4, N'Poman')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (354, 4, N'Pozo de La Piedra')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (355, 4, N'Puerta de Corral')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (356, 4, N'Puerta San José')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (357, 4, N'Recreo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (358, 4, N'S.F.V de 4')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (359, 4, N'San Fernando')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (360, 4, N'San Fernando del Valle')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (361, 4, N'San José')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (362, 4, N'Santa María')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (363, 4, N'Santa Rosa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (364, 4, N'Saujil')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (365, 4, N'Tapso')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (366, 4, N'Tinogasta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (367, 4, N'Valle Viejo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (368, 4, N'Villa Vil')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (369, 5, N'Aviá Teraí')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (370, 5, N'Barranqueras')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (371, 5, N'Basail')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (372, 5, N'Campo Largo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (373, 5, N'Capital')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (374, 5, N'Capitán Solari')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (375, 5, N'Charadai')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (376, 5, N'Charata')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (377, 5, N'Chorotis')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (378, 5, N'Ciervo Petiso')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (379, 5, N'Cnel. Du Graty')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (380, 5, N'Col. Benítez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (381, 5, N'Col. Elisa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (382, 5, N'Col. Popular')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (383, 5, N'Colonias Unidas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (384, 5, N'Concepción')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (385, 5, N'Corzuela')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (386, 5, N'Cote Lai')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (387, 5, N'El Sauzalito')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (388, 5, N'Enrique Urien')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (389, 5, N'Fontana')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (390, 5, N'Fte. Esperanza')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (391, 5, N'Gancedo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (392, 5, N'Gral. Capdevila')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (393, 5, N'Gral. Pinero')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (394, 5, N'Gral. San Martín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (395, 5, N'Gral. Vedia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (396, 5, N'Hermoso Campo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (397, 5, N'I. del Cerrito')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (398, 5, N'J.J. Castelli')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (399, 5, N'La Clotilde')
GO
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (400, 5, N'La Eduvigis')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (401, 5, N'La Escondida')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (402, 5, N'La Leonesa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (403, 5, N'La Tigra')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (404, 5, N'La Verde')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (405, 5, N'Laguna Blanca')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (406, 5, N'Laguna Limpia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (407, 5, N'Lapachito')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (408, 5, N'Las Breñas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (409, 5, N'Las Garcitas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (410, 5, N'Las Palmas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (411, 5, N'Los Frentones')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (412, 5, N'Machagai')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (413, 5, N'Makallé')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (414, 5, N'Margarita Belén')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (415, 5, N'Miraflores')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (416, 5, N'Misión N. Pompeya')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (417, 5, N'Napenay')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (418, 5, N'Pampa Almirón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (419, 5, N'Pampa del Indio')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (420, 5, N'Pampa del Infierno')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (421, 5, N'Pdcia. de La Plaza')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (422, 5, N'Pdcia. Roca')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (423, 5, N'Pdcia. Roque Sáenz Peña')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (424, 5, N'Pto. Bermejo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (425, 5, N'Pto. Eva Perón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (426, 5, N'Puero Tirol')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (427, 5, N'Puerto Vilelas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (428, 5, N'Quitilipi')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (429, 5, N'Resistencia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (430, 5, N'Sáenz Peña')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (431, 5, N'Samuhú')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (432, 5, N'San Bernardo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (433, 5, N'Santa Sylvina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (434, 5, N'Taco Pozo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (435, 5, N'Tres Isletas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (436, 5, N'Villa Ángela')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (437, 5, N'Villa Berthet')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (438, 5, N'Villa R. Bermejito')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (439, 6, N'Aldea Apeleg')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (440, 6, N'Aldea Beleiro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (441, 6, N'Aldea Epulef')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (442, 6, N'Alto Río Sengerr')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (443, 6, N'Buen Pasto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (444, 6, N'Camarones')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (445, 6, N'Carrenleufú')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (446, 6, N'Cholila')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (447, 6, N'Co. Centinela')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (448, 6, N'Colan Conhué')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (449, 6, N'Comodoro Rivadavia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (450, 6, N'Corcovado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (451, 6, N'Cushamen')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (452, 6, N'Dique F. Ameghino')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (453, 6, N'Dolavón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (454, 6, N'Dr. R. Rojas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (455, 6, N'El Hoyo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (456, 6, N'El Maitén')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (457, 6, N'Epuyén')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (458, 6, N'Esquel')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (459, 6, N'Facundo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (460, 6, N'Gaimán')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (461, 6, N'Gan Gan')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (462, 6, N'Gastre')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (463, 6, N'Gdor. Costa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (464, 6, N'Gualjaina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (465, 6, N'J. de San Martín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (466, 6, N'Lago Blanco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (467, 6, N'Lago Puelo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (468, 6, N'Lagunita Salada')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (469, 6, N'Las Plumas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (470, 6, N'Los Altares')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (471, 6, N'Paso de los Indios')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (472, 6, N'Paso del Sapo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (473, 6, N'Pto. Madryn')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (474, 6, N'Pto. Pirámides')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (475, 6, N'Rada Tilly')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (476, 6, N'Rawson')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (477, 6, N'Río Mayo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (478, 6, N'Río Pico')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (479, 6, N'Sarmiento')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (480, 6, N'Tecka')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (481, 6, N'Telsen')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (482, 6, N'Trelew')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (483, 6, N'Trevelin')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (484, 6, N'Veintiocho de Julio')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (485, 7, N'Achiras')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (486, 7, N'Adelia Maria')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (487, 7, N'Agua de Oro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (488, 7, N'Alcira Gigena')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (489, 7, N'Aldea Santa Maria')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (490, 7, N'Alejandro Roca')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (491, 7, N'Alejo Ledesma')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (492, 7, N'Alicia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (493, 7, N'Almafuerte')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (494, 7, N'Alpa Corral')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (495, 7, N'Alta Gracia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (496, 7, N'Alto Alegre')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (497, 7, N'Alto de Los Quebrachos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (498, 7, N'Altos de Chipion')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (499, 7, N'Amboy')
GO
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (500, 7, N'Ambul')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (501, 7, N'Ana Zumaran')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (502, 7, N'Anisacate')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (503, 7, N'Arguello')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (504, 7, N'Arias')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (505, 7, N'Arroyito')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (506, 7, N'Arroyo Algodon')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (507, 7, N'Arroyo Cabral')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (508, 7, N'Arroyo Los Patos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (509, 7, N'Assunta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (510, 7, N'Atahona')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (511, 7, N'Ausonia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (512, 7, N'Avellaneda')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (513, 7, N'Ballesteros')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (514, 7, N'Ballesteros Sud')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (515, 7, N'Balnearia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (516, 7, N'Bañado de Soto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (517, 7, N'Bell Ville')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (518, 7, N'Bengolea')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (519, 7, N'Benjamin Gould')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (520, 7, N'Berrotaran')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (521, 7, N'Bialet Masse')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (522, 7, N'Bouwer')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (523, 7, N'Brinkmann')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (524, 7, N'Buchardo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (525, 7, N'Bulnes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (526, 7, N'Cabalango')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (527, 7, N'Calamuchita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (528, 7, N'Calchin')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (529, 7, N'Calchin Oeste')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (530, 7, N'Calmayo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (531, 7, N'Camilo Aldao')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (532, 7, N'Caminiaga')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (533, 7, N'Cañada de Luque')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (534, 7, N'Cañada de Machado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (535, 7, N'Cañada de Rio Pinto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (536, 7, N'Cañada del Sauce')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (537, 7, N'Canals')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (538, 7, N'Candelaria Sud')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (539, 7, N'Capilla de Remedios')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (540, 7, N'Capilla de Siton')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (541, 7, N'Capilla del Carmen')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (542, 7, N'Capilla del Monte')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (543, 7, N'Cordoba capital')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (544, 7, N'Capitan Gral B. O´Higgins')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (545, 7, N'Carnerillo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (546, 7, N'Carrilobo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (547, 7, N'Casa Grande')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (548, 7, N'Cavanagh')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (549, 7, N'Cerro Colorado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (550, 7, N'Chaján')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (551, 7, N'Chalacea')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (552, 7, N'Chañar Viejo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (553, 7, N'Chancaní')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (554, 7, N'Charbonier')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (555, 7, N'Charras')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (556, 7, N'Chazón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (557, 7, N'Chilibroste')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (558, 7, N'Chucul')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (559, 7, N'Chuña')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (560, 7, N'Chuña Huasi')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (561, 7, N'Churqui Cañada')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (562, 7, N'Cienaga Del Coro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (563, 7, N'Cintra')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (564, 7, N'Col. Almada')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (565, 7, N'Col. Anita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (566, 7, N'Col. Barge')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (567, 7, N'Col. Bismark')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (568, 7, N'Col. Bremen')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (569, 7, N'Col. Caroya')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (570, 7, N'Col. Italiana')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (571, 7, N'Col. Iturraspe')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (572, 7, N'Col. Las Cuatro Esquinas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (573, 7, N'Col. Las Pichanas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (574, 7, N'Col. Marina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (575, 7, N'Col. Prosperidad')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (576, 7, N'Col. San Bartolome')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (577, 7, N'Col. San Pedro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (578, 7, N'Col. Tirolesa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (579, 7, N'Col. Vicente Aguero')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (580, 7, N'Col. Videla')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (581, 7, N'Col. Vignaud')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (582, 7, N'Col. Waltelina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (583, 7, N'Colazo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (584, 7, N'Comechingones')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (585, 7, N'Conlara')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (586, 7, N'Copacabana')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (587, 7, N'7')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (588, 7, N'Coronel Baigorria')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (589, 7, N'Coronel Moldes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (590, 7, N'Corral de Bustos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (591, 7, N'Corralito')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (592, 7, N'Cosquín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (593, 7, N'Costa Sacate')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (594, 7, N'Cruz Alta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (595, 7, N'Cruz de Caña')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (596, 7, N'Cruz del Eje')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (597, 7, N'Cuesta Blanca')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (598, 7, N'Dean Funes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (599, 7, N'Del Campillo')
GO
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (600, 7, N'Despeñaderos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (601, 7, N'Devoto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (602, 7, N'Diego de Rojas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (603, 7, N'Dique Chico')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (604, 7, N'El Arañado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (605, 7, N'El Brete')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (606, 7, N'El Chacho')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (607, 7, N'El Crispín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (608, 7, N'El Fortín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (609, 7, N'El Manzano')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (610, 7, N'El Rastreador')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (611, 7, N'El Rodeo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (612, 7, N'El Tío')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (613, 7, N'Elena')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (614, 7, N'Embalse')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (615, 7, N'Esquina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (616, 7, N'Estación Gral. Paz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (617, 7, N'Estación Juárez Celman')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (618, 7, N'Estancia de Guadalupe')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (619, 7, N'Estancia Vieja')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (620, 7, N'Etruria')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (621, 7, N'Eufrasio Loza')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (622, 7, N'Falda del Carmen')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (623, 7, N'Freyre')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (624, 7, N'Gral. Baldissera')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (625, 7, N'Gral. Cabrera')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (626, 7, N'Gral. Deheza')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (627, 7, N'Gral. Fotheringham')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (628, 7, N'Gral. Levalle')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (629, 7, N'Gral. Roca')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (630, 7, N'Guanaco Muerto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (631, 7, N'Guasapampa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (632, 7, N'Guatimozin')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (633, 7, N'Gutenberg')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (634, 7, N'Hernando')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (635, 7, N'Huanchillas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (636, 7, N'Huerta Grande')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (637, 7, N'Huinca Renanco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (638, 7, N'Idiazabal')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (639, 7, N'Impira')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (640, 7, N'Inriville')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (641, 7, N'Isla Verde')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (642, 7, N'Italó')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (643, 7, N'James Craik')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (644, 7, N'Jesús María')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (645, 7, N'Jovita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (646, 7, N'Justiniano Posse')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (647, 7, N'Km 658')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (648, 7, N'L. V. Mansilla')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (649, 7, N'La Batea')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (650, 7, N'La Calera')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (651, 7, N'La Carlota')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (652, 7, N'La Carolina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (653, 7, N'La Cautiva')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (654, 7, N'La Cesira')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (655, 7, N'La Cruz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (656, 7, N'La Cumbre')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (657, 7, N'La Cumbrecita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (658, 7, N'La Falda')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (659, 7, N'La Francia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (660, 7, N'La Granja')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (661, 7, N'La Higuera')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (662, 7, N'La Laguna')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (663, 7, N'La Paisanita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (664, 7, N'La Palestina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (665, 7, N'12')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (666, 7, N'La Paquita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (667, 7, N'La Para')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (668, 7, N'La Paz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (669, 7, N'La Playa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (670, 7, N'La Playosa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (671, 7, N'La Población')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (672, 7, N'La Posta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (673, 7, N'La Puerta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (674, 7, N'La Quinta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (675, 7, N'La Rancherita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (676, 7, N'La Rinconada')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (677, 7, N'La Serranita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (678, 7, N'La Tordilla')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (679, 7, N'Laborde')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (680, 7, N'Laboulaye')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (681, 7, N'Laguna Larga')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (682, 7, N'Las Acequias')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (683, 7, N'Las Albahacas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (684, 7, N'Las Arrias')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (685, 7, N'Las Bajadas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (686, 7, N'Las Caleras')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (687, 7, N'Las Calles')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (688, 7, N'Las Cañadas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (689, 7, N'Las Gramillas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (690, 7, N'Las Higueras')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (691, 7, N'Las Isletillas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (692, 7, N'Las Junturas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (693, 7, N'Las Palmas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (694, 7, N'Las Peñas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (695, 7, N'Las Peñas Sud')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (696, 7, N'Las Perdices')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (697, 7, N'Las Playas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (698, 7, N'Las Rabonas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (699, 7, N'Las Saladas')
GO
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (700, 7, N'Las Tapias')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (701, 7, N'Las Varas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (702, 7, N'Las Varillas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (703, 7, N'Las Vertientes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (704, 7, N'Leguizamón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (705, 7, N'Leones')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (706, 7, N'Los Cedros')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (707, 7, N'Los Cerrillos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (708, 7, N'Los Chañaritos (C.E)')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (709, 7, N'Los Chanaritos (R.S)')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (710, 7, N'Los Cisnes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (711, 7, N'Los Cocos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (712, 7, N'Los Cóndores')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (713, 7, N'Los Hornillos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (714, 7, N'Los Hoyos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (715, 7, N'Los Mistoles')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (716, 7, N'Los Molinos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (717, 7, N'Los Pozos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (718, 7, N'Los Reartes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (719, 7, N'Los Surgentes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (720, 7, N'Los Talares')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (721, 7, N'Los Zorros')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (722, 7, N'Lozada')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (723, 7, N'Luca')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (724, 7, N'Luque')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (725, 7, N'Luyaba')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (726, 7, N'Malagueño')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (727, 7, N'Malena')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (728, 7, N'Malvinas Argentinas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (729, 7, N'Manfredi')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (730, 7, N'Maquinista Gallini')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (731, 7, N'Marcos Juárez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (732, 7, N'Marull')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (733, 7, N'Matorrales')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (734, 7, N'Mattaldi')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (735, 7, N'Mayu Sumaj')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (736, 7, N'Media Naranja')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (737, 7, N'Melo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (738, 7, N'Mendiolaza')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (739, 7, N'Mi Granja')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (740, 7, N'Mina Clavero')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (741, 7, N'Miramar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (742, 7, N'Morrison')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (743, 7, N'Morteros')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (744, 7, N'Mte. Buey')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (745, 7, N'Mte. Cristo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (746, 7, N'Mte. De Los Gauchos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (747, 7, N'Mte. Leña')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (748, 7, N'Mte. Maíz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (749, 7, N'Mte. Ralo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (750, 7, N'Nicolás Bruzone')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (751, 7, N'Noetinger')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (752, 7, N'Nono')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (753, 7, N'Nueva 7')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (754, 7, N'Obispo Trejo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (755, 7, N'Olaeta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (756, 7, N'Oliva')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (757, 7, N'Olivares San Nicolás')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (758, 7, N'Onagolty')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (759, 7, N'Oncativo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (760, 7, N'Ordoñez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (761, 7, N'Pacheco De Melo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (762, 7, N'Pampayasta N.')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (763, 7, N'Pampayasta S.')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (764, 7, N'Panaholma')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (765, 7, N'Pascanas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (766, 7, N'Pasco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (767, 7, N'Paso del Durazno')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (768, 7, N'Paso Viejo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (769, 7, N'Pilar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (770, 7, N'Pincén')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (771, 7, N'Piquillín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (772, 7, N'Plaza de Mercedes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (773, 7, N'Plaza Luxardo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (774, 7, N'Porteña')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (775, 7, N'Potrero de Garay')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (776, 7, N'Pozo del Molle')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (777, 7, N'Pozo Nuevo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (778, 7, N'Pueblo Italiano')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (779, 7, N'Puesto de Castro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (780, 7, N'Punta del Agua')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (781, 7, N'Quebracho Herrado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (782, 7, N'Quilino')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (783, 7, N'Rafael García')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (784, 7, N'Ranqueles')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (785, 7, N'Rayo Cortado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (786, 7, N'Reducción')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (787, 7, N'Rincón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (788, 7, N'Río Bamba')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (789, 7, N'Río Ceballos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (790, 7, N'Río Cuarto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (791, 7, N'Río de Los Sauces')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (792, 7, N'Río Primero')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (793, 7, N'Río Segundo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (794, 7, N'Río Tercero')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (795, 7, N'Rosales')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (796, 7, N'Rosario del Saladillo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (797, 7, N'Sacanta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (798, 7, N'Sagrada Familia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (799, 7, N'Saira')
GO
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (800, 7, N'Saladillo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (801, 7, N'Saldán')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (802, 7, N'Salsacate')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (803, 7, N'Salsipuedes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (804, 7, N'Sampacho')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (805, 7, N'San Agustín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (806, 7, N'San Antonio de Arredondo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (807, 7, N'San Antonio de Litín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (808, 7, N'San Basilio')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (809, 7, N'San Carlos Minas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (810, 7, N'San Clemente')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (811, 7, N'San Esteban')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (812, 7, N'San Francisco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (813, 7, N'San Ignacio')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (814, 7, N'San Javier')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (815, 7, N'San Jerónimo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (816, 7, N'San Joaquín')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (817, 7, N'San José de La Dormida')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (818, 7, N'San José de Las Salinas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (819, 7, N'San Lorenzo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (820, 7, N'San Marcos Sierras')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (821, 7, N'San Marcos Sud')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (822, 7, N'San Pedro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (823, 7, N'San Pedro N.')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (824, 7, N'San Roque')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (825, 7, N'San Vicente')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (826, 7, N'Santa Catalina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (827, 7, N'Santa Elena')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (828, 7, N'Santa Eufemia')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (829, 7, N'Santa Maria')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (830, 7, N'Sarmiento')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (831, 7, N'Saturnino M.Laspiur')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (832, 7, N'Sauce Arriba')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (833, 7, N'Sebastián Elcano')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (834, 7, N'Seeber')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (835, 7, N'Segunda Usina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (836, 7, N'Serrano')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (837, 7, N'Serrezuela')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (838, 7, N'Sgo. Temple')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (839, 7, N'Silvio Pellico')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (840, 7, N'Simbolar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (841, 7, N'Sinsacate')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (842, 7, N'Sta. Rosa de Calamuchita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (843, 7, N'Sta. Rosa de Río Primero')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (844, 7, N'Suco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (845, 7, N'Tala Cañada')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (846, 7, N'Tala Huasi')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (847, 7, N'Talaini')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (848, 7, N'Tancacha')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (849, 7, N'Tanti')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (850, 7, N'Ticino')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (851, 7, N'Tinoco')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (852, 7, N'Tío Pujio')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (853, 7, N'Toledo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (854, 7, N'Toro Pujio')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (855, 7, N'Tosno')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (856, 7, N'Tosquita')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (857, 7, N'Tránsito')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (858, 7, N'Tuclame')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (859, 7, N'Tutti')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (860, 7, N'Ucacha')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (861, 7, N'Unquillo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (862, 7, N'Valle de Anisacate')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (863, 7, N'Valle Hermoso')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (864, 7, N'Vélez Sarfield')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (865, 7, N'Viamonte')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (866, 7, N'Vicuña Mackenna')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (867, 7, N'Villa Allende')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (868, 7, N'Villa Amancay')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (869, 7, N'Villa Ascasubi')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (870, 7, N'Villa Candelaria N.')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (871, 7, N'Villa Carlos Paz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (872, 7, N'Villa Cerro Azul')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (873, 7, N'Villa Ciudad de América')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (874, 7, N'Villa Ciudad Pque Los Reartes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (875, 7, N'Villa Concepción del Tío')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (876, 7, N'Villa Cura Brochero')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (877, 7, N'Villa de Las Rosas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (878, 7, N'Villa de María')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (879, 7, N'Villa de Pocho')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (880, 7, N'Villa de Soto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (881, 7, N'Villa del Dique')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (882, 7, N'Villa del Prado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (883, 7, N'Villa del Rosario')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (884, 7, N'Villa del Totoral')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (885, 7, N'Villa Dolores')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (886, 7, N'Villa El Chancay')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (887, 7, N'Villa Elisa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (888, 7, N'Villa Flor Serrana')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (889, 7, N'Villa Fontana')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (890, 7, N'Villa Giardino')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (891, 7, N'Villa Gral. Belgrano')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (892, 7, N'Villa Gutierrez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (893, 7, N'Villa Huidobro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (894, 7, N'Villa La Bolsa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (895, 7, N'Villa Los Aromos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (896, 7, N'Villa Los Patos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (897, 7, N'Villa María')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (898, 7, N'Villa Nueva')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (899, 7, N'Villa Pque. Santa Ana')
GO
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (900, 7, N'Villa Pque. Siquiman')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (901, 7, N'Villa Quillinzo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (902, 7, N'Villa Rossi')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (903, 7, N'Villa Rumipal')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (904, 7, N'Villa San Esteban')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (905, 7, N'Villa San Isidro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (906, 7, N'Villa 21')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (907, 7, N'Villa Sarmiento (G.R)')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (908, 7, N'Villa Sarmiento (S.A)')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (909, 7, N'Villa Tulumba')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (910, 7, N'Villa Valeria')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (911, 7, N'Villa Yacanto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (912, 7, N'Washington')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (913, 7, N'Wenceslao Escalante')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (914, 7, N'Ycho Cruz Sierras')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (915, 8, N'Alvear')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (916, 8, N'Bella Vista')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (917, 8, N'Berón de Astrada')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (918, 8, N'Bonpland')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (919, 8, N'Caá Cati')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (920, 8, N'Capital')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (921, 8, N'Chavarría')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (922, 8, N'Col. C. Pellegrini')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (923, 8, N'Col. Libertad')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (924, 8, N'Col. Liebig')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (925, 8, N'Col. Sta Rosa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (926, 8, N'Concepción')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (927, 8, N'Cruz de Los Milagros')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (928, 8, N'Curuzú-Cuatiá')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (929, 8, N'Empedrado')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (930, 8, N'Esquina')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (931, 8, N'Estación Torrent')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (932, 8, N'Felipe Yofré')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (933, 8, N'Garruchos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (934, 8, N'Gdor. Agrónomo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (935, 8, N'Gdor. Martínez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (936, 8, N'Goya')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (937, 8, N'Guaviravi')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (938, 8, N'Herlitzka')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (939, 8, N'Ita-Ibate')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (940, 8, N'Itatí')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (941, 8, N'Ituzaingó')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (942, 8, N'José Rafael Gómez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (943, 8, N'Juan Pujol')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (944, 8, N'La Cruz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (945, 8, N'Lavalle')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (946, 8, N'Lomas de Vallejos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (947, 8, N'Loreto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (948, 8, N'Mariano I. Loza')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (949, 8, N'Mburucuyá')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (950, 8, N'Mercedes')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (951, 8, N'Mocoretá')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (952, 8, N'Mte. Caseros')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (953, 8, N'Nueve de Julio')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (954, 8, N'Palmar Grande')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (955, 8, N'Parada Pucheta')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (956, 8, N'Paso de La Patria')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (957, 8, N'Paso de Los Libres')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (958, 8, N'Pedro R. Fernandez')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (959, 8, N'Perugorría')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (960, 8, N'Pueblo Libertador')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (961, 8, N'Ramada Paso')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (962, 8, N'Riachuelo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (963, 8, N'Saladas')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (964, 8, N'San Antonio')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (965, 8, N'San Carlos')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (966, 8, N'San Cosme')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (967, 8, N'San Lorenzo')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (968, 8, N'20 del Palmar')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (969, 8, N'San Miguel')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (970, 8, N'San Roque')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (971, 8, N'Santa Ana')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (972, 8, N'Santa Lucía')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (973, 8, N'Santo Tomé')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (974, 8, N'Sauce')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (975, 8, N'Tabay')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (976, 8, N'Tapebicuá')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (977, 8, N'Tatacua')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (978, 8, N'Virasoro')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (979, 8, N'Yapeyú')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (980, 8, N'Yataití Calle')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (981, 9, N'Alarcón')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (982, 9, N'Alcaraz')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (983, 9, N'Alcaraz N.')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (984, 9, N'Alcaraz S.')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (985, 9, N'Aldea Asunción')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (986, 9, N'Aldea Brasilera')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (987, 9, N'Aldea Elgenfeld')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (988, 9, N'Aldea Grapschental')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (989, 9, N'Aldea Ma. Luisa')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (990, 9, N'Aldea Protestante')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (991, 9, N'Aldea Salto')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (992, 9, N'Aldea San Antonio (G)')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (993, 9, N'Aldea San Antonio (P)')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (994, 9, N'Aldea 19')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (995, 9, N'Aldea San Miguel')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (996, 9, N'Aldea San Rafael')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (997, 9, N'Aldea Spatzenkutter')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (998, 9, N'Aldea Sta. María')
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (999, 9, N'Aldea Sta. Rosa')
GO
INSERT [dbo].[localidades] ([id_localidad], [id_prov], [nom_loc]) VALUES (1000, 9, N'Aldea Valle María')
SET IDENTITY_INSERT [dbo].[localidades] OFF
SET IDENTITY_INSERT [dbo].[paises] ON 

INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (1, N'argentina')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (2, N'chile')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (12, N'Peru')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (13, N'Uruguay')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (14, N'USA')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (15, N'Japan')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (16, N'usa')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (17, N'usa')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (18, N'España')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (19, N'Nueva Zelanda')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (20, N'Singapur')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (21, N'Mexico')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (22, N'Chile')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (23, N'Argentina')
SET IDENTITY_INSERT [dbo].[paises] OFF
SET IDENTITY_INSERT [dbo].[provincias] ON 

INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (1, N'Buenos Aires', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (2, N'Buenos Aires-GBA', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (3, N'Capital Federal', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (4, N'Catamarca', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (5, N'Chaco', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (6, N'Chubut', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (7, N'Córdoba', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (8, N'Corrientes', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (9, N'Entre Ríos', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (10, N'Formosa', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (11, N'Jujuy', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (12, N'La Pampa', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (13, N'La Rioja', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (14, N'Mendoza', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (15, N'Misiones', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (16, N'Neuquén', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (17, N'Río Negro', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (18, N'Salta', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (19, N'San Juan', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (20, N'San Luis', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (21, N'Santa Cruz', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (22, N'Santa Fe', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (23, N'Santiago del Estero', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (24, N'Tierra del Fuego', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (25, N'Tucumán', 1)
SET IDENTITY_INSERT [dbo].[provincias] OFF
SET IDENTITY_INSERT [dbo].[tipo_operaciones] ON 

INSERT [dbo].[tipo_operaciones] ([id_tipo_operacion], [nombre_op]) VALUES (2, N'deposito')
INSERT [dbo].[tipo_operaciones] ([id_tipo_operacion], [nombre_op]) VALUES (3, N'extraccion')
INSERT [dbo].[tipo_operaciones] ([id_tipo_operacion], [nombre_op]) VALUES (4, N'transferencia')
INSERT [dbo].[tipo_operaciones] ([id_tipo_operacion], [nombre_op]) VALUES (5, N'giro al descubierto')
SET IDENTITY_INSERT [dbo].[tipo_operaciones] OFF
/****** Object:  Index [IX_cuentas]    Script Date: 21-Jan-21 1:58:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cuentas] ON [dbo].[cuentas]
(
	[id_us] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cuentas]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_usuario] FOREIGN KEY([id_us])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[cuentas] CHECK CONSTRAINT [FK_cuenta_usuario]
GO
ALTER TABLE [dbo].[localidades]  WITH CHECK ADD  CONSTRAINT [FK_localidades_provincias] FOREIGN KEY([id_prov])
REFERENCES [dbo].[provincias] ([id_provincia])
GO
ALTER TABLE [dbo].[localidades] CHECK CONSTRAINT [FK_localidades_provincias]
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [FK_login_cuentas] FOREIGN KEY([id_cuenta])
REFERENCES [dbo].[cuentas] ([cvu])
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [FK_login_cuentas]
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [FK_login_usuarios] FOREIGN KEY([id_us])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [FK_login_usuarios]
GO
ALTER TABLE [dbo].[operaciones]  WITH CHECK ADD  CONSTRAINT [FK_operaciones_cuenta] FOREIGN KEY([id_cuenta])
REFERENCES [dbo].[cuentas] ([cvu])
GO
ALTER TABLE [dbo].[operaciones] CHECK CONSTRAINT [FK_operaciones_cuenta]
GO
ALTER TABLE [dbo].[operaciones]  WITH CHECK ADD  CONSTRAINT [FK_operaciones_tipo_operaciones] FOREIGN KEY([tipo_op])
REFERENCES [dbo].[tipo_operaciones] ([id_tipo_operacion])
GO
ALTER TABLE [dbo].[operaciones] CHECK CONSTRAINT [FK_operaciones_tipo_operaciones]
GO
ALTER TABLE [dbo].[provincias]  WITH CHECK ADD  CONSTRAINT [FK_provincias_paises] FOREIGN KEY([id_pais])
REFERENCES [dbo].[paises] ([id_pais])
GO
ALTER TABLE [dbo].[provincias] CHECK CONSTRAINT [FK_provincias_paises]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_localidades] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[localidades] ([id_localidad])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_localidades]
GO
/****** Object:  StoredProcedure [dbo].[proc_agregar_usuario]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_agregar_usuario] 
	-- Add the parameters for the stored procedure here
	@nombre varchar(30),
	@apellido varchar(30),
	@dni int,
	@email varchar(50) = 'defaultvalue',
	@fecha_nacimiento date,
	@cuilcuit bigint,
	@telefono varchar(20),
	@calle varchar(30),
	@numero_calle char(6),
	@departamento bit = NULL,
	@piso tinyint = NULL,
	@puerta char(10) = NULL,
	@barrio varchar(20),
	@codigo_postal char(9),
	@id_localidad varchar(50),
	--@provincia varchar(30),
	--@pais varchar(30),
	@foto_frente_dni varchar(50),
	@foto_reverso_dni varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[usuarios]
           ([nombre]
           ,[apellido]
           ,[foto_frente_dni]
           ,[foto_reverso_dni]
           ,[dni]
           ,[email]
           ,[fecha_nac]
           ,[cuilcuit]
           ,[telefono]
           ,[calle]
           ,[numero_calle]
           ,[departamento]
           ,[piso]
           ,[puerta]
           ,[barrio]
           ,[codigo_postal]
           ,[id_localidad])
     VALUES
           (@nombre ,
			@apellido ,
			@foto_frente_dni ,
			@foto_reverso_dni ,
			@dni ,
			@email ,
			@fecha_nacimiento ,
			@cuilcuit ,
			@telefono ,
			@calle ,
			@numero_calle ,
			@departamento ,
			@piso ,
			@puerta ,
			@barrio ,
			@codigo_postal ,
			@id_localidad );
	SELECT CAST(SCOPE_IDENTITY() AS int);
END
GO
/****** Object:  StoredProcedure [dbo].[proc_desactivar_cuenta]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_desactivar_cuenta] 
	-- Add the parameters for the stored procedure here
	@cvu bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[cuentas]
	   SET 
		  [cuenta_activa] = 0
	 WHERE cvu=@cvu;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_do_extraction]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_do_extraction]
	-- Add the parameters for the stored procedure here
	@ammount money,
	@id_account bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[operaciones]
           ([fecha]
           ,[monto]
           ,[tipo_op]
           ,[id_cuenta])
     VALUES
           (GETDATE()
           ,@ammount
           ,1
           ,@id_account);

	UPDATE [dbo].[cuentas]
		SET 
		  [saldo] = saldo - @ammount
		from cuentas c, operaciones op
		where c.cvu=op.id_cuenta AND saldo>=@ammount;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_eliminar_usuario]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_eliminar_usuario] 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM usuarios WHERE id_usuario=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_giroAlDescubierto]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_giroAlDescubierto]
	@ammount money, 
	@id_account bigint
AS
BEGIN
	SET NOCOUNT ON;
	IF @ammount<=(SELECT saldo*1.10 FROM cuentas WHERE cvu=@id_account --El monto del giro debe ser menor al saldo+ el 10%
		AND @ammount>saldo)--El monto del giro debe ser mayor al saldo (si no es extraccion)
		BEGIN TRY
			BEGIN TRANSACTION
					INSERT INTO [dbo].[operaciones]
					([fecha]
					,[monto]
					,[tipo_op]
					,[id_cuenta]
					,[monto_giro])
				 VALUES
					   (GETDATE()
					   ,@ammount
					   ,4
					   ,@id_account
					   ,@ammount-(SELECT saldo FROM cuentas WHERE cvu=@id_account)
					   )

				UPDATE [dbo].[cuentas]
				   SET 
					  [saldo] = saldo - @ammount
				 WHERE cvu=@id_account
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			RAISERROR('An error occurred, transaction/overdraft aborted.', 16/*error severity*/, 1);
			ROLLBACK TRANSACTION
		END CATCH
	ELSE
		RAISERROR('El monto ingresado no es valido',16,2);
END
GO
/****** Object:  StoredProcedure [dbo].[proc_last_movements]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_last_movements] 
	-- Add the parameters for the stored procedure here
	@id_account bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 10 op.[id_operacion]
      ,op.[fecha]
      ,op.[monto]
	  ,op.[cvu_cbu_destino]
      --,[cbu_destino]
      --,[cvu_destino]
      ,op.[tipo_op]
	  ,t.nombre_op
      ,op.[id_cuenta]
  FROM [dbo].[operaciones] op JOIN tipo_operaciones t ON op.tipo_op=t.id_tipo_operacion
  WHERE op.id_cuenta=@id_account
  ORDER BY fecha DESC
END
GO
/****** Object:  StoredProcedure [dbo].[proc_make_deposit]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_make_deposit]
	-- Add the parameters for the stored procedure here
	@monto money,
	--@cbu_destino bigint=NULL,
	--@cvu_destino bigint=NULL,
	@id_cuenta bigint--capaz alcanza con int para esta pk

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--INSERT INTO [dbo].[operaciones]
 --          ([fecha]
 --          ,[monto]
 --          ,[cvu_destino]
 --          ,[tipo_op])
 --    VALUES
 --          (GETDATE()
 --          ,@monto
 --          ,@cvu_destino
 --          ,2)
	
	--como obtener pk de cuenta a la que pertenece la operacion, o se la provee como argumento al procedimiento?
	--DECLARE @id_cuenta bigint;
	--select @id_cuenta = @id_cuenta from cuentas

	INSERT INTO [dbo].[operaciones]
           ([fecha]
           ,[monto]
           --,[cbu_destino]
           --,[cvu_destino]
           ,[tipo_op]
           ,[id_cuenta])
     VALUES
           (GETDATE()
           ,@monto
           --,@cbu_destino
           --,@cvu_destino
           ,2
           ,@id_cuenta)

	UPDATE [dbo].[cuentas]
		SET 
		  [saldo] = saldo + @monto
	from cuentas
	--where cvu=@cbu_destino OR cvu=@cvu_destino;
	where cvu=@id_cuenta;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_modificar_cuenta]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_modificar_cuenta] 
	-- Add the parameters for the stored procedure here
	@cvu bigint,
	@idUs int,
	@saldo money,
	@limiteAlDescubierto money,
	@interesesAlDescubierto tinyint,
	@tipoDeMoneda varchar(20),
	@fechaDeAlta datetime,
	@fechaDeBaja datetime,
	@cuentaActiva bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[cuentas]
	   SET [id_us] = @idUs
		  ,[saldo] = @saldo
		  ,[limite_al_descubierto] = @limiteAlDescubierto
		  ,[intereses_al_descubierto] = @interesesAlDescubierto
		  ,[tipo_moneda] = @tipoDeMoneda
		  ,[fecha_alta] = @fechaDeAlta
		  ,[fecha_baja] = @fechaDeBaja
		  ,[cuenta_activa] = @cuentaActiva
	 WHERE cvu=@cvu;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_modificar_datos_personales]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_modificar_datos_personales] 
	-- Add the parameters for the stored procedure here
	@idUsuario int,
	@email varchar(50)=NULL,
	@telefono varchar(20)=NULL,
	@calle varchar(30)=NULL,
	@numero_calle char(6)=NULL,
	@departamento bit=NULL,
	@piso smallint=NULL,
	@puerta char(10)=NULL,
	@barrio varchar(20)=NULL,
	@codigo_postal char(9)=NULL,
	@localidad int=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[usuarios]
   SET [email] = ISNULL(@email,email)
      ,[telefono] = ISNULL(@telefono,telefono)
      ,[calle] = ISNULL(@calle,calle)
      ,[numero_calle] = ISNULL(@numero_calle,numero_calle)
      ,[departamento] = ISNULL(@departamento,departamento)
      ,[piso] = ISNULL(@piso,piso)
      ,[puerta] = ISNULL(@puerta,puerta)
      ,[barrio] = ISNULL(@barrio,barrio)
      ,[codigo_postal] = ISNULL(@codigo_postal,codigo_postal)
      ,[id_localidad] = ISNULL(@localidad,id_localidad)
 WHERE id_usuario = @idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[proc_modificar_perfil_de_usuario]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_modificar_perfil_de_usuario] 
	-- Add the parameters for the stored procedure here
	@idUsuario int,
	@email varchar(50) = 'defaultvalue',
	@fecha_nacimiento date,
	@telefono varchar(20),
	@calle varchar(30),
	@numero_calle char(6),
	@departamento bit = NULL,
	@piso tinyint = NULL,
	@puerta char(10) = NULL,
	@barrio varchar(20),
	@codigo_postal char(9),
	@localidad varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[usuarios]
   SET [email] = @email
      ,[fecha_nac] = @fecha_nacimiento
      ,[telefono] = @telefono
      ,[calle] = @calle
      ,[numero_calle] = @numero_calle
      ,[departamento] = @departamento
      ,[piso] = @piso
      ,[puerta] = @puerta
      ,[barrio] = @barrio
      ,[codigo_postal] = @codigo_postal
      ,[id_localidad] = @localidad
 WHERE id_usuario = @idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[proc_modificar_usuario]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_modificar_usuario] 
	-- Add the parameters for the stored procedure here
	@idUsuario int,
	@nombre varchar(30),
	@apellido varchar(30),
	@foto_frente_dni varchar(50),
	@foto_reverso_dni varchar(50),
	@dni int,
	@email varchar(50) = 'defaultvalue',
	@fecha_nacimiento date,
	@cuilcuit bigint,
	@telefono varchar(20),
	@calle varchar(30),
	@numero_calle char(6),
	@departamento bit = NULL,
	@piso tinyint = NULL,
	@puerta char(10) = NULL,
	@barrio varchar(20),
	@codigo_postal char(9),
	@localidad varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[usuarios]
   SET [nombre] = @nombre
      ,[apellido] = @apellido
      ,[foto_frente_dni] = @foto_frente_dni
      ,[foto_reverso_dni] = @foto_reverso_dni
      ,[dni] = @dni
      ,[email] = @email
      ,[fecha_nac] = @fecha_nacimiento
      ,[cuilcuit] = @cuilcuit
      ,[telefono] = @telefono
      ,[calle] = @calle
      ,[numero_calle] = @numero_calle
      ,[departamento] = @departamento
      ,[piso] = @piso
      ,[puerta] = @puerta
      ,[barrio] = @barrio
      ,[codigo_postal] = @codigo_postal
      ,[id_localidad] = @localidad
 WHERE id_usuario = @idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[proc_obtener_cuenta]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_obtener_cuenta] 
	-- Add the parameters for the stored procedure here
	@cvu bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM cuentas WHERE cvu=@cvu;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_obtener_cuentas]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_obtener_cuentas] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM cuentas;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_obtener_login]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_obtener_login] 
	-- Add the parameters for the stored procedure here
	@username varchar(20),
	@password varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM login where username=@username AND password=@password;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_obtener_usuario]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_obtener_usuario] 
	-- Add the parameters for the stored procedure here
	@id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT nombre, apellido, foto_frente_dni, foto_reverso_dni, dni, email, fecha_nac, cuilcuit, telefono
	, calle, numero_calle, departamento, piso, puerta, barrio, codigo_postal, id_localidad FROM usuarios WHERE id_usuario = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_obtener_usuario_porID]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_obtener_usuario_porID] 
	-- Add the parameters for the stored procedure here
	@id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	u.nombre,
	u.apellido, 
	u.dni,
	u.email,
	u.fecha_nac,
	u.cuilcuit,
	u.telefono,
	u.calle,
	u.numero_calle,
	u.departamento,
	u.piso,
	u.puerta,
	u.barrio,
	l.nom_loc,
	pr.nom_prov,
	pa.nom_pais,
	u.codigo_postal
	FROM usuarios u JOIN
	localidades l ON u.id_localidad=l.id_localidad JOIN
	provincias pr ON pr.id_provincia=l.id_prov JOIN
	paises pa ON pa.id_pais=pr.id_pais
	WHERE id_usuario = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_obtener_usuarios]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_obtener_usuarios] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_usuario, nombre, apellido from usuarios;
END
GO
/****** Object:  StoredProcedure [dbo].[tr_do_extraction]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[tr_do_extraction]
	-- Add the parameters for the stored procedure here
	@ammount money,
	@id_account bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION
		INSERT INTO [dbo].[operaciones]
           ([fecha]
           ,[monto]
           ,[tipo_op]
           ,[id_cuenta])
		VALUES
			(GETDATE()
			,@ammount
			,1
			,@id_account);

		UPDATE [dbo].[cuentas]
			SET 
			  [saldo] = saldo - @ammount
			from cuentas c, operaciones op
			where c.cvu=op.id_cuenta AND saldo>=@ammount;

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		RAISERROR('An error occurred, extraction as transaction aborted.', 16/*error severity*/, 1)
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[tr_overdraft]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[tr_overdraft]
	-- Add the parameters for the stored procedure here
	@ammount money, 
	@id_account bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [dbo].[operaciones]
				   ([fecha]
				   ,[monto]
				   ,[tipo_op]
				   ,[id_cuenta])
			 VALUES
				   (GETDATE()
				   ,@ammount
				   ,4
				   ,@id_account);

			UPDATE [dbo].[cuentas]
			   SET 
				  [saldo] = saldo - @ammount --¿Como controloar que no se pase del limite,y llamar funcion para ir cobrando intereses?
			 WHERE cvu=@id_account AND saldo - @ammount>=limite_al_descubierto;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		RAISERROR('An error occurred, transaction/overdraft aborted.', 16/*error severity*/, 1);
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[tr_register_client_new_account]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[tr_register_client_new_account]
	-- Add the parameters for the stored procedure here
	@nombre varchar(30),
	@apellido varchar(30),
	@dni int,
	@email varchar(50) = 'defaultvalue',
	@fecha_nacimiento date,
	@cuilcuit bigint,
	@telefono varchar(20),
	@calle varchar(30),
	@numero_calle char(6),
	@departamento bit = NULL,
	@piso tinyint = NULL,
	@puerta char(10) = NULL,
	@barrio varchar(20),
	@codigo_postal char(9),
	--@localidad varchar(50),
	@id_localidad int,
	--@provincia varchar(30),
	--@pais varchar(30),
	@foto_frente_dni varchar(50),
	@foto_reverso_dni varchar(50),
	@username varchar(20), --Added new parameters to include the login data
	@password varchar(20),
	@preguntaSecreta varchar(100),
	@respuestaSecreta varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here

	BEGIN TRY
		BEGIN TRANSACTION
			--@id_pais tinyint,
			--@id_provincia tinyint,
			

			--SELECT @id_pais = id_pais 
			--FROM paises
			--WHERE nom_pais = @pais;

			--SELECT @id_provincia = id_provincia 
			--FROM provincias
			--WHERE nom_prov = @provincia;

			--These next lines where enabled toguether with the @localidad parameter
			--declare @id_localidad int;
			--SELECT @id_localidad = id_localidad 
			--FROM localidades
			--WHERE nom_loc = @localidad;


			INSERT INTO [dbo].[usuarios]
           ([nombre]
           ,[apellido]
           ,[foto_frente_dni]
           ,[foto_reverso_dni]
           ,[dni]
           ,[email]
           ,[fecha_nac]
           ,[cuilcuit]
           ,[telefono]
           ,[calle]
           ,[numero_calle]
           ,[departamento]
           ,[piso]
           ,[puerta]
           ,[barrio]
           ,[codigo_postal]
           ,[id_localidad]
           ,[preguntaSecreta]
           ,[respuestaSecreta])
			 VALUES
				   (@nombre
				   ,@apellido
				   ,@foto_frente_dni
				   ,@foto_reverso_dni
				   ,@dni
				   ,@email
				   ,@fecha_nacimiento
				   ,@cuilcuit
				   ,@telefono
				   ,@calle
				   ,@numero_calle
				   ,@departamento
				   ,@piso
				   ,@puerta
				   ,@barrio
				   ,@codigo_postal
				   ,@id_localidad
				   ,@preguntaSecreta
                   ,@respuestaSecreta);

			DECLARE @id_usuario int
			SELECT @id_usuario = SCOPE_IDENTITY();

			INSERT INTO [dbo].[cuentas]
				   ([id_us]
				   ,[saldo]
				   ,[limite_al_descubierto]
				   ,[cuenta_activa]
				   ,[intereses_al_descubierto]
				   ,[fecha_alta]
				   ,[fecha_baja]
				   ,[tipo_moneda])
			 VALUES
				   (@id_usuario
				   ,1000.00
				   ,-25000.00
				   ,1
				   ,60
				   ,GETDATE()
				   ,NULL
				   ,'pesos');

			DECLARE @id_cuenta int
			SELECT @id_cuenta = SCOPE_IDENTITY();

			INSERT INTO [dbo].[login]
				   ([username]
				   ,[password]
				   ,[id_us]
				   ,[id_cuenta])
			 VALUES
				   (@username
				   ,@password
				   ,@id_usuario
				   ,@id_cuenta);

			select * from cuentas where cvu=@id_cuenta;
			--Added when doing register to get the account id that was registered,
			--maybe this is not necesary since the login is the one that needs account id

			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH
			RAISERROR('An error occurred, transaction/registration aborted.', 16/*error severity*/, 1) 
			ROLLBACK TRANSACTION
		END CATCH
	--declare @id_pais tinyint,
	--		@id_provincia tinyint,
	--		@id_localidad tinyint;

	--SELECT @id_pais = id_pais 
	--FROM paises
	--WHERE nom_pais = @pais;

	--SELECT @id_provincia = id_provincia 
	--FROM provincias
	--WHERE nom_prov = @provincia;
END
GO
/****** Object:  StoredProcedure [dbo].[tr_transference]    Script Date: 21-Jan-21 1:58:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[tr_transference] 
	-- Add the parameters for the stored procedure here
	@monto money,
	--@cbu_destino bigint=NULL,
	--@cvu_destino bigint=NULL,
	@id_cuenta bigint,--capaz alcanza con int para esta pk
	@cvu_cbu_destino bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION
		INSERT INTO [dbo].[operaciones]
           ([fecha]
           ,[monto]
		   ,[cvu_cbu_destino]
           --,[cbu_destino]
           --,[cvu_destino]
           ,[tipo_op]
           ,[id_cuenta])
		 VALUES
			   (GETDATE()
			   ,@monto
			   --,@cbu_destino
			   --,@cvu_destino
			   ,@cvu_cbu_destino
			   ,3
			   ,@id_cuenta)

		UPDATE [dbo].[cuentas]
			SET 
			  [saldo] = saldo + @monto
			from cuentas
			where cvu=@cvu_cbu_destino AND @monto<=(select saldo from cuentas 
																	where cvu=@id_cuenta); --AND cvu<>@id_cuenta
			--where cvu=@cbu_destino OR cvu=@cvu_destino AND @monto<=(select saldo from cuentas 
																	--where cvu=@id_cuenta); --AND cvu<>@id_cuenta

		UPDATE [dbo].[cuentas]
			SET
				[saldo] = saldo - @monto
			FROM cuentas
			WHERE cvu=@id_cuenta AND (cvu<>@cvu_cbu_destino) AND saldo>=@monto;

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		RAISERROR('An error occurred, transference aborted.', 16/*error severity*/, 1)
		ROLLBACK TRANSACTION
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [db_wallet_clip_money] SET  READ_WRITE 
GO
