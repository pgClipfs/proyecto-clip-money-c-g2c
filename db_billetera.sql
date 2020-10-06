USE [master]
GO
/****** Object:  Database [db_wallet_clip_money]    Script Date: 6/10/2020 20:35:13 ******/
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
/****** Object:  Table [dbo].[contacto]    Script Date: 6/10/2020 20:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contacto](
	[id_contacto] [int] IDENTITY(1,1) NOT NULL,
	[localidad] [tinyint] NOT NULL,
	[barrio] [varchar](20) NOT NULL,
	[calle] [varchar](20) NOT NULL,
	[nro_casa] [nchar](20) NOT NULL,
	[departamento] [bit] NULL,
	[piso] [tinyint] NULL,
	[puerta] [char](10) NULL,
	[cod_postal] [char](9) NOT NULL,
 CONSTRAINT [PK_ubicacion] PRIMARY KEY CLUSTERED 
(
	[id_contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuentas]    Script Date: 6/10/2020 20:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuentas](
	[monto_al_descubierto] [money] NOT NULL,
	[saldo] [money] NOT NULL,
	[id_us] [int] NOT NULL,
	[cuenta_activa] [bit] NOT NULL,
	[cvu] [bigint] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cvu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidades]    Script Date: 6/10/2020 20:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidades](
	[id_localidad] [tinyint] IDENTITY(1,1) NOT NULL,
	[nom_loc] [varchar](30) NOT NULL,
	[id_prov] [tinyint] NOT NULL,
 CONSTRAINT [PK_localidades] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 6/10/2020 20:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id_login] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[ultimo_acceso] [datetime2](7) NOT NULL,
	[usuario] [varchar](20) NOT NULL,
	[id_us] [int] NOT NULL,
	[log_activo] [bit] NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operaciones]    Script Date: 6/10/2020 20:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operaciones](
	[id_operacion] [tinyint] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime2](7) NOT NULL,
	[monto] [money] NOT NULL,
	[cbu_destino] [bigint] NULL,
	[cvu_destino] [bigint] NULL,
	[tipo_op] [tinyint] NOT NULL,
	[id_cuenta] [bigint] NOT NULL,
 CONSTRAINT [PK_operaciones] PRIMARY KEY CLUSTERED 
(
	[id_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 6/10/2020 20:35:13 ******/
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
/****** Object:  Table [dbo].[provincias]    Script Date: 6/10/2020 20:35:13 ******/
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
/****** Object:  Table [dbo].[tipo_operaciones]    Script Date: 6/10/2020 20:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_operaciones](
	[id_tipo_operacion] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre_op] [varchar](20) NOT NULL,
	[descripcion] [text] NOT NULL,
 CONSTRAINT [PK_tipo_operaciones] PRIMARY KEY CLUSTERED 
(
	[id_tipo_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 6/10/2020 20:35:13 ******/
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
	[telefono] [int] NOT NULL,
	[id_cont] [int] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[contacto] ON 

INSERT [dbo].[contacto] ([id_contacto], [localidad], [barrio], [calle], [nro_casa], [departamento], [piso], [puerta], [cod_postal]) VALUES (13, 14, N'alberdi', N'c.pellegrini', N'49                  ', NULL, NULL, NULL, N'4444     ')
INSERT [dbo].[contacto] ([id_contacto], [localidad], [barrio], [calle], [nro_casa], [departamento], [piso], [puerta], [cod_postal]) VALUES (14, 14, N'alberdi', N'c.pellegrini', N'49                  ', 0, NULL, NULL, N'3333     ')
INSERT [dbo].[contacto] ([id_contacto], [localidad], [barrio], [calle], [nro_casa], [departamento], [piso], [puerta], [cod_postal]) VALUES (15, 14, N'alberdi', N'c.pellegrini', N'49                  ', 1, 3, N'a         ', N'5011     ')
SET IDENTITY_INSERT [dbo].[contacto] OFF
GO
SET IDENTITY_INSERT [dbo].[localidades] ON 

INSERT [dbo].[localidades] ([id_localidad], [nom_loc], [id_prov]) VALUES (13, N'cordoba', 5)
INSERT [dbo].[localidades] ([id_localidad], [nom_loc], [id_prov]) VALUES (14, N'rio cuarto', 6)
SET IDENTITY_INSERT [dbo].[localidades] OFF
GO
SET IDENTITY_INSERT [dbo].[paises] ON 

INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (1, N'argentina')
INSERT [dbo].[paises] ([id_pais], [nom_pais]) VALUES (2, N'chile')
SET IDENTITY_INSERT [dbo].[paises] OFF
GO
SET IDENTITY_INSERT [dbo].[provincias] ON 

INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (5, N'cordoba', 1)
INSERT [dbo].[provincias] ([id_provincia], [nom_prov], [id_pais]) VALUES (6, N'buenos aires', 1)
SET IDENTITY_INSERT [dbo].[provincias] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_operaciones] ON 

INSERT [dbo].[tipo_operaciones] ([id_tipo_operacion], [nombre_op], [descripcion]) VALUES (1, N'Extraccion', N'Extraer dinero')
INSERT [dbo].[tipo_operaciones] ([id_tipo_operacion], [nombre_op], [descripcion]) VALUES (2, N'Deposito', N'Depositar dinero')
INSERT [dbo].[tipo_operaciones] ([id_tipo_operacion], [nombre_op], [descripcion]) VALUES (3, N'Transferencia', N'Transferir dinero')
SET IDENTITY_INSERT [dbo].[tipo_operaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id_usuario], [nombre], [apellido], [foto_frente_dni], [foto_reverso_dni], [dni], [email], [fecha_nac], [cuilcuit], [telefono], [id_cont]) VALUES (1003, N'jose', N'perez', N'img/fotof.jmg', N'img/fotor.jmg', 35689528, N'jose_love@sumail.com', CAST(N'1991-09-29' AS Date), 19356895286, 358456825, 13)
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [apellido], [foto_frente_dni], [foto_reverso_dni], [dni], [email], [fecha_nac], [cuilcuit], [telefono], [id_cont]) VALUES (1004, N'sabrina', N'perez', N'img/fotof.jmg', N'img/fotor.jmg', 35777528, N'sabrii@sumail.com', CAST(N'1991-09-29' AS Date), 19357775286, 358456825, 14)
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [apellido], [foto_frente_dni], [foto_reverso_dni], [dni], [email], [fecha_nac], [cuilcuit], [telefono], [id_cont]) VALUES (1005, N'juan', N'hernandez', N'img/fotof.jmg', N'img/fotor.jmg', 35777528, N'juanito@sumail.com', CAST(N'1991-09-05' AS Date), 19355689286, 35568928, 15)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
ALTER TABLE [dbo].[contacto]  WITH CHECK ADD  CONSTRAINT [FK_contacto_localidades] FOREIGN KEY([localidad])
REFERENCES [dbo].[localidades] ([id_localidad])
GO
ALTER TABLE [dbo].[contacto] CHECK CONSTRAINT [FK_contacto_localidades]
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
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_ubicacion] FOREIGN KEY([id_cont])
REFERENCES [dbo].[contacto] ([id_contacto])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_ubicacion]
GO
/****** Object:  StoredProcedure [dbo].[hacer_deposito]    Script Date: 6/10/2020 20:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hacer_deposito]
	-- Add the parameters for the stored procedure here
	@monto money,
	@cvu_destino bigint

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[operaciones]
           ([fecha]
           ,[monto]
           ,[cvu_destino]
           ,[tipo_op])
     VALUES
           (GETDATE()
           ,@monto
           ,@cvu_destino
           ,2)


	UPDATE [dbo].[cuentas]
		SET 
		  [saldo] = saldo + @monto
	from cuentas c, operaciones op
	where c.cvu=op.id_cuenta
END
GO
USE [master]
GO
ALTER DATABASE [db_wallet_clip_money] SET  READ_WRITE 
GO
