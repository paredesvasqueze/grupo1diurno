USE [El_Hornito]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 23/10/2024 09:18:01 ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 23/10/2024 09:18:01 ******/
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
/****** Object:  Table [dbo].[DetalleOrden]    Script Date: 23/10/2024 09:18:01 ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 23/10/2024 09:18:01 ******/
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
/****** Object:  Table [dbo].[Mesa]    Script Date: 23/10/2024 09:18:01 ******/
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
/****** Object:  Table [dbo].[Orden]    Script Date: 23/10/2024 09:18:01 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 23/10/2024 09:18:01 ******/
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
/****** Object:  Table [dbo].[Reserva]    Script Date: 23/10/2024 09:18:01 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Categoria]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Categoria]
    @IdCategoria INT,
    @Categoria NVARCHAR(50)
AS
BEGIN
    UPDATE Categoria
    SET cCategoria = @Categoria
    WHERE nIdCategoria = @IdCategoria;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Cliente]    Script Date: 23/10/2024 09:18:01 ******/
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
	    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_DetalleOrden]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_DetalleOrden]
    @IdDetalle INT,
    @Cantidad INT,
    @IdOrden INT,
    @IdProducto INT
AS
BEGIN
    UPDATE DetalleOrden
    SET nCantidad = @Cantidad,
        nIdOrden = @IdOrden,
        nIdProducto = @IdProducto
    WHERE nIdDetalle = @IdDetalle;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Empleado]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Empleado]
    @IdEmpleado INT,
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50),
    @FechaContratacion DATE,
    @Documento NVARCHAR(20)
AS
BEGIN
    UPDATE Empleado
    SET cNombre = @Nombre,
        cApellido = @Apellido,
        dFechaContratacion = @FechaContratacion,
        cDocumento = @Documento
    WHERE nIdEmpleado = @IdEmpleado;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Mesa]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Mesa]
    @IdMesa INT,
    @NoMesa INT,
    @Capacidad INT
AS
BEGIN
    UPDATE Mesa
    SET nNoMesa = @NoMesa,
        cCapacidad = @Capacidad
    WHERE nIdMesa = @IdMesa;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Orden]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Orden]
    @IdOrden INT,
    @Fecha DATE,
    @IdCliente INT,
    @IdEmpleado INT,
    @IdMesa INT
AS
BEGIN
    UPDATE Orden
    SET dFecha = @Fecha,
        nIdCliente = @IdCliente,
        nIdEmpleado = @IdEmpleado,
        nIdMesa = @IdMesa
    WHERE nIdOrden = @IdOrden;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Producto]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Producto]
    @IdProducto INT,
    @Nombre NVARCHAR(100),
    @Descripcion NVARCHAR(255),
    @IdCategoria INT,
    @Precio DECIMAL(10, 2)
AS
BEGIN
    UPDATE Producto
    SET cNombre = @Nombre,
        cDescripcion = @Descripcion,
        nIdCategoria = @IdCategoria,
        nPrecio = @Precio
    WHERE nIdProducto = @IdProducto;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Reserva]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Reserva]
    @IdReserva INT,
    @FechaReserva DATE,
    @IdCliente INT
AS
BEGIN
    UPDATE Reserva
    SET dFechaReserva = @FechaReserva,
        nIdCliente = @IdCliente
    WHERE nIdReserva = @IdReserva;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Categoria]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Categoria]
    @IdCategoria INT
AS
BEGIN
    DELETE FROM Categoria
    WHERE nIdCategoria = @IdCategoria;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Cliente]    Script Date: 23/10/2024 09:18:01 ******/
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
	    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_DetalleOrden]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_DetalleOrden]
    @IdDetalle INT
AS
BEGIN
    DELETE FROM DetalleOrden
    WHERE nIdDetalle = @IdDetalle;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Empleado]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Empleado]
    @IdEmpleado INT
AS
BEGIN
    DELETE FROM Empleado
    WHERE nIdEmpleado = @IdEmpleado;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Mesa]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Mesa]
    @IdMesa INT
AS
BEGIN
    DELETE FROM Mesa
    WHERE nIdMesa = @IdMesa;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Orden]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Orden]
    @IdOrden INT
AS
BEGIN
    DELETE FROM Orden
    WHERE nIdOrden = @IdOrden;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Producto]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Producto]
    @IdProducto INT
AS
BEGIN
    DELETE FROM Producto
    WHERE nIdProducto = @IdProducto;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Reserva]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Reserva]
    @IdReserva INT
AS
BEGIN
    DELETE FROM Reserva
    WHERE nIdReserva = @IdReserva;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Categoria_Todos]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GET_Categoria_Todos]
AS
BEGIN
    SELECT * FROM Categoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Cliente_Todos]    Script Date: 23/10/2024 09:18:01 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GET_DetalleOrden_Todos]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GET_DetalleOrden_Todos]
AS
BEGIN
    SELECT * FROM DetalleOrden;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Empleado_Todos]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GET_Empleado_Todos]
AS
BEGIN
    SELECT * FROM Empleado;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Mesa_Todos]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GET_Mesa_Todos]
AS
BEGIN
    SELECT * FROM Mesa;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Orden_Todos]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GET_Orden_Todos]
AS
BEGIN
    SELECT * FROM Orden;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Producto_Todos]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GET_Producto_Todos]
AS
BEGIN
    SELECT * FROM Producto;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Reserva_Todos]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GET_Reserva_Todos]
AS
BEGIN
    SELECT * FROM Reserva;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Categoria]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Categoria]
    @Categoria NVARCHAR(50)
AS
BEGIN
    INSERT INTO Categoria (cCategoria)
    VALUES (@Categoria);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdCategoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Cliente]    Script Date: 23/10/2024 09:18:01 ******/
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
	    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdCategoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_DetalleOrden]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_DetalleOrden]
    @Cantidad INT,
    @IdOrden INT,
    @IdProducto INT
AS
BEGIN
    INSERT INTO DetalleOrden (nCantidad, nIdOrden, nIdProducto)
    VALUES (@Cantidad, @IdOrden, @IdProducto);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdDetalle;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Empleado]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Empleado]
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50),
    @FechaContratacion DATE,
    @Documento NVARCHAR(20)
AS
BEGIN
    INSERT INTO Empleado (cNombre, cApellido, dFechaContratacion, cDocumento)
    VALUES (@Nombre, @Apellido, @FechaContratacion, @Documento);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdEmpleado;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Mesa]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Mesa]
    @NoMesa INT,
    @Capacidad INT
AS
BEGIN
    INSERT INTO Mesa (nNoMesa, cCapacidad)
    VALUES (@NoMesa, @Capacidad);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdMesa;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Orden]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Orden]
    @Fecha DATE,
    @IdCliente INT,
    @IdEmpleado INT,
    @IdMesa INT
AS
BEGIN
    INSERT INTO Orden (dFecha, nIdCliente, nIdEmpleado, nIdMesa)
    VALUES (@Fecha, @IdCliente, @IdEmpleado, @IdMesa);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdOrden;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Producto]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Producto]
    @Nombre NVARCHAR(100),
    @Descripcion NVARCHAR(255),
    @IdCategoria INT,
    @Precio DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Producto (cNombre, cDescripcion, nIdCategoria, nPrecio)
    VALUES (@Nombre, @Descripcion, @IdCategoria, @Precio);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdProducto;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Reserva]    Script Date: 23/10/2024 09:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Reserva]
    @FechaReserva DATE,
    @IdCliente INT
AS
BEGIN
    INSERT INTO Reserva (dFechaReserva, nIdCliente)
    VALUES (@FechaReserva, @IdCliente);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdReserva;
END;
GO
