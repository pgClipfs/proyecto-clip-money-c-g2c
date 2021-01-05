USE [master]
GO
/****** Object:  Database [db_wallet_clip_money]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  Table [dbo].[cuentas]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  Table [dbo].[localidades]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  Table [dbo].[login]    Script Date: 04-Jan-21 6:01:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id_login] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[id_us] [int] NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operaciones]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
 CONSTRAINT [PK_operaciones] PRIMARY KEY CLUSTERED 
(
	[id_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  Table [dbo].[provincias]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  Table [dbo].[tipo_operaciones]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  Table [dbo].[usuarios]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
	[piso] [smallint] NULL,
	[puerta] [char](10) NULL,
	[barrio] [varchar](20) NOT NULL,
	[codigo_postal] [char](9) NOT NULL,
	[id_localidad] [int] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_cuentas]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_agregar_usuario]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_desactivar_cuenta]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_do_extraction]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_eliminar_usuario]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_last_movements]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_make_deposit]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_modificar_cuenta]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_modificar_datos_personales]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_modificar_usuario]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_obtener_cuenta]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_obtener_cuentas]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_obtener_login]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_obtener_usuario]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
	SELECT nombre, apellido, dni FROM usuarios WHERE id_usuario = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_obtener_usuario_porID]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_obtener_usuarios]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[tr_do_extraction]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[tr_overdraft]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[tr_register_client_new_account]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
	@password varchar(20)
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
           ,[id_localidad])
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
				   ,@id_localidad);

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

			INSERT INTO [dbo].[login]
				   ([username]
				   ,[password]
				   ,[id_us])
			 VALUES
				   (@username
				   ,@password
				   ,@id_usuario)

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
/****** Object:  StoredProcedure [dbo].[tr_transference]    Script Date: 04-Jan-21 6:01:56 PM ******/
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
