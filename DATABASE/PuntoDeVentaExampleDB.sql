USE [master]
GO
/****** Object:  Database [PuntoDeVentaDB]    Script Date: 13/08/2023 08:17:37 p. m. ******/
CREATE DATABASE [PuntoDeVentaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PuntoDeVentaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PuntoDeVentaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PuntoDeVentaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PuntoDeVentaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PuntoDeVentaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PuntoDeVentaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PuntoDeVentaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PuntoDeVentaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PuntoDeVentaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PuntoDeVentaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PuntoDeVentaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PuntoDeVentaDB] SET  MULTI_USER 
GO
ALTER DATABASE [PuntoDeVentaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PuntoDeVentaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PuntoDeVentaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PuntoDeVentaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PuntoDeVentaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PuntoDeVentaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PuntoDeVentaDB', N'ON'
GO
ALTER DATABASE [PuntoDeVentaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [PuntoDeVentaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PuntoDeVentaDB]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 13/08/2023 08:17:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Direccion] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesVenta]    Script Date: 13/08/2023 08:17:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesVenta](
	[DetalleVentaId] [int] NOT NULL,
	[VentaId] [int] NULL,
	[ProductoId] [int] NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleVentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 13/08/2023 08:17:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ProductoId] [int] NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Precio] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 13/08/2023 08:17:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[VentaId] [int] NOT NULL,
	[ClienteId] [int] NULL,
	[FechaVenta] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[VentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Direccion]) VALUES (1, N'Juan Pérez', N'Achumani, Calle 15, Nro 32, La Paz')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Direccion]) VALUES (2, N'Manchas Poma Canqui', N'Calle las Rosas de la Selva Nro 12')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Direccion]) VALUES (3, N'Doña Florinda', N'La vecindad del Chavo')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Direccion]) VALUES (4, N'Paolo López', N'Plaza Castro, Nro 2, Cochabamba')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Direccion]) VALUES (5, N'Panchito Paucara', N'Las Lomas Calle 4 Nro 3')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Direccion]) VALUES (6, N'Manchas Gustav', N'Achumani Calle 10 Nro 45')
INSERT [dbo].[Clientes] ([ClienteId], [Nombre], [Direccion]) VALUES (7, N'Lorena Marshal', N'Achumani Calle 45 Nro 423')
GO
INSERT [dbo].[DetallesVenta] ([DetalleVentaId], [VentaId], [ProductoId], [Cantidad]) VALUES (1, 1, 1, 3)
INSERT [dbo].[DetallesVenta] ([DetalleVentaId], [VentaId], [ProductoId], [Cantidad]) VALUES (2, 1, 2, 2)
INSERT [dbo].[DetallesVenta] ([DetalleVentaId], [VentaId], [ProductoId], [Cantidad]) VALUES (3, 2, 1, 1)
INSERT [dbo].[DetallesVenta] ([DetalleVentaId], [VentaId], [ProductoId], [Cantidad]) VALUES (4, 3, 3, 4)
INSERT [dbo].[DetallesVenta] ([DetalleVentaId], [VentaId], [ProductoId], [Cantidad]) VALUES (5, 3, 3, 4)
INSERT [dbo].[DetallesVenta] ([DetalleVentaId], [VentaId], [ProductoId], [Cantidad]) VALUES (6, 4, 4, 2)
GO
INSERT [dbo].[Productos] ([ProductoId], [Nombre], [Precio]) VALUES (1, N'Pilfrut', CAST(1.99 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoId], [Nombre], [Precio]) VALUES (2, N'Galleta Maria', CAST(15.75 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoId], [Nombre], [Precio]) VALUES (3, N'Comida para Gato', CAST(50.60 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoId], [Nombre], [Precio]) VALUES (4, N'Nuggets', CAST(5.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta]) VALUES (1, 1, CAST(N'2023-08-13T02:39:23.080' AS DateTime))
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta]) VALUES (2, 2, CAST(N'2023-08-13T02:39:23.080' AS DateTime))
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta]) VALUES (3, 3, CAST(N'2023-08-13T02:39:23.080' AS DateTime))
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta]) VALUES (4, 4, CAST(N'2023-08-13T02:39:23.080' AS DateTime))
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Productos] ([ProductoId])
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD FOREIGN KEY([VentaId])
REFERENCES [dbo].[Ventas] ([VentaId])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZAR_CLIENTE]    Script Date: 13/08/2023 08:17:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ACTUALIZAR_CLIENTE]
(
@Nombre  NVARCHAR(50),
@Direccion NVARCHAR(100),
@Id INT
)
AS
UPDATE Clientes
SET Nombre=@Nombre,Direccion=@Direccion
WHERE ClienteId=@Id
GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_CLIENTE]    Script Date: 13/08/2023 08:17:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ELIMINAR_CLIENTE]
(
@Id INT
)
AS
DELETE FROM Clientes WHERE ClienteId=@Id
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_CLIENTES]    Script Date: 13/08/2023 08:17:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[INSERTAR_CLIENTES]
(
@ClienteId INT,
@Nombre  NVARCHAR(50),
@Direccion NVARCHAR(100)
)
AS
INSERT INTO Clientes(ClienteId,Nombre,Direccion)
Values (@ClienteId,@Nombre,@Direccion)
GO
/****** Object:  StoredProcedure [dbo].[LISTAR_CLIENTES]    Script Date: 13/08/2023 08:17:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[LISTAR_CLIENTES]
AS
Select ClienteId, Nombre, Direccion
FROM Clientes
GO
USE [master]
GO
ALTER DATABASE [PuntoDeVentaDB] SET  READ_WRITE 
GO
