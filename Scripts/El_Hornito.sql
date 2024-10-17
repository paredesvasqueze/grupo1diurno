USE [El_Hornito]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[nIdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[cCategoria] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[nIdCliente] [int] IDENTITY(1,1) NOT NULL,
	[cNombre] [nvarchar](50) NOT NULL,
	[cApellido] [nvarchar](50) NOT NULL,
	[cCorreo] [nvarchar](100) NOT NULL,
	[cTelefono] [nvarchar](20) NULL,
	[dFechaRegistro] [date] NOT NULL,
	[cDocumento] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleOrden]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleOrden](
	[nIdDetalle] [int] IDENTITY(1,1) NOT NULL,
	[nCantidad] [int] NOT NULL,
	[nIdOrden] [int] NOT NULL,
	[nIdProducto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[nIdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[cNombre] [nvarchar](50) NOT NULL,
	[cApellido] [nvarchar](50) NOT NULL,
	[dFechaContratacion] [date] NOT NULL,
	[cDocumento] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[nIdMesa] [int] IDENTITY(1,1) NOT NULL,
	[nNoMesa] [int] NOT NULL,
	[cCapacidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[nIdOrden] [int] IDENTITY(1,1) NOT NULL,
	[dFecha] [date] NOT NULL,
	[nIdCliente] [int] NOT NULL,
	[nIdEmpleado] [int] NOT NULL,
	[nIdMesa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[nIdProducto] [int] IDENTITY(1,1) NOT NULL,
	[cNombre] [nvarchar](100) NOT NULL,
	[cDescripcion] [nvarchar](255) NULL,
	[nIdCategoria] [int] NOT NULL,
	[nPrecio] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[nIdReserva] [int] IDENTITY(1,1) NOT NULL,
	[dFechaReserva] [date] NOT NULL,
	[nIdCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleOrden]  WITH CHECK ADD FOREIGN KEY([nIdOrden])
REFERENCES [dbo].[Orden] ([nIdOrden])
GO
ALTER TABLE [dbo].[DetalleOrden]  WITH CHECK ADD FOREIGN KEY([nIdProducto])
REFERENCES [dbo].[Producto] ([nIdProducto])
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD FOREIGN KEY([nIdCliente])
REFERENCES [dbo].[Cliente] ([nIdCliente])
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD FOREIGN KEY([nIdEmpleado])
REFERENCES [dbo].[Empleado] ([nIdEmpleado])
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD FOREIGN KEY([nIdMesa])
REFERENCES [dbo].[Mesa] ([nIdMesa])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([nIdCategoria])
REFERENCES [dbo].[Categoria] ([nIdCategoria])
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([nIdCliente])
REFERENCES [dbo].[Cliente] ([nIdCliente])
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Cliente]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Cliente]
    @IdCliente INT,
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50),
    @Correo NVARCHAR(100),
    @Telefono NVARCHAR(20),
    @Documento NVARCHAR(20)
AS
BEGIN
    UPDATE Cliente
    SET cNombre = @Nombre,
        cApellido = @Apellido,
        cCorreo = @Correo,
        cTelefono = @Telefono,
        cDocumento = @Documento
    WHERE nIdCliente = @IdCliente;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Cliente]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Cliente]
    @IdCliente INT
AS
BEGIN
    DELETE FROM Cliente
    WHERE nIdCliente = @IdCliente;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Cliente_Todos]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GET_Cliente_Todos]
AS
BEGIN
    SELECT * FROM Cliente
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Cliente]    Script Date: 17/10/2024 08:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Cliente]
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50),
    @Correo NVARCHAR(100),
    @Telefono NVARCHAR(20),
    @FechaRegistro DATE,
    @Documento NVARCHAR(20)
AS
BEGIN
    INSERT INTO Cliente (cNombre, cApellido, cCorreo, cTelefono, dFechaRegistro, cDocumento)
    VALUES (@Nombre, @Apellido, @Correo, @Telefono, @FechaRegistro, @Documento);
END;
GO
