USE [master]
GO
/****** Object:  Database [db_billetera]    Script Date: 2/10/2020 7:46:52 p. m. ******/
CREATE DATABASE [db_billetera]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_billetera', FILENAME = N'C:\Program Files\Microsoft SQL Server 2019\MSSQL15.SQLEXPRESS01\MSSQL\DATA\db_billetera.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_billetera_log', FILENAME = N'C:\Program Files\Microsoft SQL Server 2019\MSSQL15.SQLEXPRESS01\MSSQL\DATA\db_billetera_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_billetera] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_billetera].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_billetera] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_billetera] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_billetera] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_billetera] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_billetera] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_billetera] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_billetera] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_billetera] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_billetera] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_billetera] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_billetera] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_billetera] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_billetera] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_billetera] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_billetera] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_billetera] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_billetera] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_billetera] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_billetera] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_billetera] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_billetera] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_billetera] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_billetera] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_billetera] SET  MULTI_USER 
GO
ALTER DATABASE [db_billetera] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_billetera] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_billetera] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_billetera] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_billetera] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_billetera] SET QUERY_STORE = OFF
GO
USE [db_billetera]
GO
/****** Object:  Table [dbo].[cuentas]    Script Date: 2/10/2020 7:46:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuentas](
	[cvu] [bigint] IDENTITY(1,1) NOT NULL,
	[monto_al_descubierto] [money] NOT NULL,
	[saldo] [money] NOT NULL,
	[id_us] [int] NOT NULL,
	[id_op] [tinyint] NOT NULL,
 CONSTRAINT [PK_cuenta] PRIMARY KEY CLUSTERED 
(
	[cvu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 2/10/2020 7:46:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[ultimo_acceso] [datetime2](7) NOT NULL,
	[usuario] [varchar](20) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operaciones]    Script Date: 2/10/2020 7:46:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operaciones](
	[id_operacion] [tinyint] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime2](7) NOT NULL,
	[monto] [money] NOT NULL,
	[cbu_destino] [bigint] NOT NULL,
	[cvu_destino] [bigint] NOT NULL,
	[tipo_op] [tinyint] NOT NULL,
 CONSTRAINT [PK_operaciones] PRIMARY KEY CLUSTERED 
(
	[id_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_operaciones]    Script Date: 2/10/2020 7:46:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_operaciones](
	[id_op] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre_op] [varchar](20) NOT NULL,
	[descripcion] [text] NOT NULL,
 CONSTRAINT [PK_tipo_operaciones] PRIMARY KEY CLUSTERED 
(
	[id_op] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ubicacion]    Script Date: 2/10/2020 7:46:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ubicacion](
	[id_ubicacion] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](20) NOT NULL,
	[provincia] [varchar](20) NOT NULL,
	[localidad] [varchar](20) NOT NULL,
	[barrio] [varchar](20) NOT NULL,
	[calle] [varchar](20) NOT NULL,
	[nro_casa] [nchar](20) NOT NULL,
	[departamento] [bit] NOT NULL,
	[piso] [tinyint] NULL,
	[puerta] [char](10) NULL,
 CONSTRAINT [PK_ubicacion] PRIMARY KEY CLUSTERED 
(
	[id_ubicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 2/10/2020 7:46:52 p. m. ******/
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
	[id_login] [int] NOT NULL,
	[dni] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[fecha_nac] [date] NOT NULL,
	[cuilcuit] [bigint] NOT NULL,
	[telefono] [int] NOT NULL,
	[id_ubic] [int] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cuentas]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_operaciones] FOREIGN KEY([id_op])
REFERENCES [dbo].[operaciones] ([id_operacion])
GO
ALTER TABLE [dbo].[cuentas] CHECK CONSTRAINT [FK_cuenta_operaciones]
GO
ALTER TABLE [dbo].[cuentas]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_usuario] FOREIGN KEY([id_us])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[cuentas] CHECK CONSTRAINT [FK_cuenta_usuario]
GO
ALTER TABLE [dbo].[operaciones]  WITH CHECK ADD  CONSTRAINT [FK_operaciones_tipo_operaciones] FOREIGN KEY([tipo_op])
REFERENCES [dbo].[tipo_operaciones] ([id_op])
GO
ALTER TABLE [dbo].[operaciones] CHECK CONSTRAINT [FK_operaciones_tipo_operaciones]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuario_login] FOREIGN KEY([id_login])
REFERENCES [dbo].[login] ([id_usuario])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuario_login]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_ubicacion] FOREIGN KEY([id_ubic])
REFERENCES [dbo].[ubicacion] ([id_ubicacion])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_ubicacion]
GO
USE [master]
GO
ALTER DATABASE [db_billetera] SET  READ_WRITE 
GO
