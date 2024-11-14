USE [El_Hornito]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  Table [dbo].[DetalleOrden]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  Table [dbo].[Mesa]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  Table [dbo].[Orden]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  Table [dbo].[Reserva]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  Table [dbo].[usser]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usser](
	[nIDUsser] [int] IDENTITY(1,1) NOT NULL,
	[cUserName] [varchar](50) NULL,
	[cPassword] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[nIDUsser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([nIdCategoria], [cCategoria]) VALUES (1, N'peperoni')
INSERT [dbo].[Categoria] ([nIdCategoria], [cCategoria]) VALUES (2, N'peperoni')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([nIdCliente], [cNombre], [cApellido], [cCorreo], [cTelefono], [dFechaRegistro], [cDocumento]) VALUES (1, N'Juan', N'Terrones', N'terronesjuan@gmail.com', N'989590301', CAST(N'2024-11-14' AS Date), N'98520360')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleOrden] ON 

INSERT [dbo].[DetalleOrden] ([nIdDetalle], [nCantidad], [nIdOrden], [nIdProducto]) VALUES (6, 1, 1, 2)
INSERT [dbo].[DetalleOrden] ([nIdDetalle], [nCantidad], [nIdOrden], [nIdProducto]) VALUES (7, 2, 1, 2)
SET IDENTITY_INSERT [dbo].[DetalleOrden] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([nIdEmpleado], [cNombre], [cApellido], [dFechaContratacion], [cDocumento]) VALUES (1, N'Juan', N'Padilla', CAST(N'2024-11-14' AS Date), N'50232547')
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[Mesa] ON 

INSERT [dbo].[Mesa] ([nIdMesa], [nNoMesa], [cCapacidad]) VALUES (1, 1, 2)
SET IDENTITY_INSERT [dbo].[Mesa] OFF
GO
SET IDENTITY_INSERT [dbo].[Orden] ON 

INSERT [dbo].[Orden] ([nIdOrden], [dFecha], [nIdCliente], [nIdEmpleado], [nIdMesa]) VALUES (1, CAST(N'2024-11-14' AS Date), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Orden] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([nIdProducto], [cNombre], [cDescripcion], [nIdCategoria], [nPrecio]) VALUES (2, N'Jeremy', N'Peperoni', 1, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([nIdProducto], [cNombre], [cDescripcion], [nIdCategoria], [nPrecio]) VALUES (3, N'Jeremy', N'Peperoni', 1, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([nIdProducto], [cNombre], [cDescripcion], [nIdCategoria], [nPrecio]) VALUES (4, N'Jeremy', N'Peperoni', 1, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([nIdProducto], [cNombre], [cDescripcion], [nIdCategoria], [nPrecio]) VALUES (5, N'Jeremy', N'Peperoni', 1, CAST(20.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Producto] OFF
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
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Categoria]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Categoria]
    @nIdCategoria INT,
    @cCategoria VARCHAR(50)
AS
BEGIN
    UPDATE Categoria
    SET cCategoria = @cCategoria
    WHERE nIdCategoria = @nIdCategoria;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Cliente]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Cliente]
    @nIdCliente INT,
    @cNombre VARCHAR(50),
    @cApellido VARCHAR(50),
    @cCorreo VARCHAR(100),
    @cTelefono VARCHAR(20),
	@dFechaRegistro VARCHAR(100),
    @cDocumento VARCHAR(20)
AS
BEGIN
    UPDATE Cliente
    SET cNombre = @cNombre,
        cApellido = @cApellido,
        cCorreo = @cCorreo,
        cTelefono = @cTelefono,
		dFechaRegistro = @dFechaRegistro,
        cDocumento = @cDocumento
    WHERE nIdCliente = @nIdCliente;
	    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_DetalleOrden]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_DetalleOrden]
    @nIdDetalle INT,
    @nCantidad INT,
    @nIdOrden INT,
    @nIdProducto INT
AS
BEGIN
    UPDATE DetalleOrden
    SET nCantidad = @nCantidad,
        nIdOrden = @nIdOrden,
        nIdProducto = @nIdProducto
    WHERE nIdDetalle = @nIdDetalle;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Empleado]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Empleado]
    @nIdEmpleado INT,
    @cNombre VARCHAR(50),
    @cApellido VARCHAR(50),
    @dtFechaContratacion DATE,
    @cDocumento VARCHAR(20)
AS
BEGIN
    UPDATE Empleado
    SET cNombre = @cNombre,
        cApellido = @cApellido,
        dFechaContratacion = @dtFechaContratacion,
        cDocumento = @cDocumento
    WHERE nIdEmpleado = @nIdEmpleado;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Mesa]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Mesa]
    @nIdMesa INT,
    @nNoMesa INT,
    @cCapacidad INT
AS
BEGIN
    UPDATE Mesa
    SET nNoMesa = @nNoMesa,
        cCapacidad = @cCapacidad
    WHERE nIdMesa = @nIdMesa;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Orden]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Orden]
    @nIdOrden INT,
    @dFecha DATE,
    @nIdCliente INT,
    @nIdEmpleado INT,
    @nIdMesa INT
AS
BEGIN
    UPDATE Orden
    SET dFecha = @dFecha,
        nIdCliente = @nIdCliente,
        nIdEmpleado = @nIdEmpleado,
        nIdMesa = @nIdMesa
    WHERE nIdOrden = @nIdOrden;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Producto]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Producto]
    @nIdProducto INT,
    @cNombre NVARCHAR(100),
    @cDescripcion NVARCHAR(255),
    @nIdCategoria INT,
    @nPrecio DECIMAL(10, 2)
AS
BEGIN
    UPDATE Producto
    SET cNombre = @cNombre,
        cDescripcion = @cDescripcion,
        nIdCategoria = @nIdCategoria,
        nPrecio = @nPrecio
    WHERE nIdProducto = @nIdProducto;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Actualizar_Reserva]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Actualizar_Reserva]
    @nIdReserva INT,
    @dFechaReserva DATE,
    @nIdCliente INT
AS
BEGIN
    UPDATE Reserva
    SET dFechaReserva = @dFechaReserva,
        nIdCliente = @nIdCliente
    WHERE nIdReserva = @nIdReserva;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Categoria]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Categoria]
    @nIdCategoria INT
AS
BEGIN
    DELETE FROM Categoria
    WHERE nIdCategoria = @nIdCategoria;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Cliente]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Cliente]
    @nIdCliente INT
AS
BEGIN
    DELETE FROM Cliente
    WHERE nIdCliente = @nIdCliente;
	    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_DetalleOrden]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_DetalleOrden]
    @nIdDetalle INT
AS
BEGIN
    DELETE FROM DetalleOrden
    WHERE nIdDetalle = @nIdDetalle;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Empleado]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Empleado]
    @nIdEmpleado INT
AS
BEGIN
    DELETE FROM Empleado
    WHERE nIdEmpleado = @nIdEmpleado;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Mesa]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Mesa]
    @nIdMesa INT
AS
BEGIN
    DELETE FROM Mesa
    WHERE nIdMesa = @nIdMesa;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Orden]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Orden]
    @nIdOrden INT
AS
BEGIN
    DELETE FROM Orden
    WHERE nIdOrden = @nIdOrden;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Producto]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Producto]
    @nIdProducto INT
AS
BEGIN
    DELETE FROM Producto
    WHERE nIdProducto = @nIdProducto;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_Reserva]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Eliminar_Reserva]
    @nIdReserva INT
AS
BEGIN
    DELETE FROM Reserva
    WHERE nIdReserva = @nIdReserva;
    SELECT CAST(@@ROWCOUNT AS int) AS FilasAfectadas;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Categoria_Todos]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GET_Cliente_Todos]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GET_DetalleOrden_Todos]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GET_Empleado_Todos]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GET_Mesa_Todos]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GET_Orden_Todos]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GET_Producto_Todos]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GET_Reserva_Todos]    Script Date: 13/11/2024 19:56:13 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_Insert_Categoria]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Categoria]
    @cCategoria NVARCHAR(50)
AS
BEGIN
    INSERT INTO Categoria (cCategoria)
    VALUES (@cCategoria);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdCategoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Cliente]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Cliente]
    @cNombre VARCHAR(50),
    @cApellido VARCHAR(50),
    @cCorreo VARCHAR(100),
    @cTelefono VARCHAR(20),
    @dFechaRegistro DATE,
    @cDocumento VARCHAR(20)
AS
BEGIN
    INSERT INTO Cliente (cNombre, cApellido, cCorreo, cTelefono, dFechaRegistro, cDocumento)
    VALUES (@cNombre, @cApellido, @cCorreo, @cTelefono, @dFechaRegistro, @cDocumento);
	    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdCategoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_DetalleOrden]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_DetalleOrden]
    @nCantidad INT,
    @nIdOrden INT,
    @nIdProducto INT
AS
BEGIN
    INSERT INTO DetalleOrden (nCantidad, nIdOrden, nIdProducto)
    VALUES (@nCantidad, @nIdOrden, @nIdProducto);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdDetalle;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Empleado]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Empleado]
    @cNombre VARCHAR(50),
    @cApellido VARCHAR(50),
    @dtFechaContratacion DATE,
    @cDocumento VARCHAR(20)
AS
BEGIN
    INSERT INTO Empleado (cNombre, cApellido, dFechaContratacion, cDocumento)
    VALUES (@cNombre, @cApellido, @dtFechaContratacion, @cDocumento);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdEmpleado;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Mesa]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Mesa]
    @nNoMesa INT,
    @cCapacidad INT
AS
BEGIN
    INSERT INTO Mesa (nNoMesa, cCapacidad)
    VALUES (@nNoMesa, @cCapacidad);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdMesa;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Orden]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Orden]
    @dFecha DATE,
    @nIdCliente INT,
    @nIdEmpleado INT,
    @nIdMesa INT
AS
BEGIN
    INSERT INTO Orden (dFecha, nIdCliente, nIdEmpleado, nIdMesa)
    VALUES (@dFecha, @nIdCliente, @nIdEmpleado, @nIdMesa);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdOrden;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Producto]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Producto]
    @cNombre NVARCHAR(100),
    @cDescripcion NVARCHAR(255),
    @nIdCategoria INT,
    @nPrecio DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Producto (cNombre, cDescripcion, nIdCategoria, nPrecio)
    VALUES (@cNombre, @cDescripcion, @nIdCategoria, @nPrecio);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdProducto;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Reserva]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Insert_Reserva]
    @dFechaReserva DATE,
    @nIdCliente INT
AS
BEGIN
    INSERT INTO Reserva (dFechaReserva, nIdCliente)
    VALUES (@dFechaReserva, @nIdCliente);
    SELECT CAST(SCOPE_IDENTITY() AS int) AS nIdReserva;
END;
GO
/****** Object:  StoredProcedure [dbo].[ValidarUsuario]    Script Date: 13/11/2024 19:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ValidarUsuario]
@cUserName varchar(50),
@cPassword varchar(256)
as
begin
if exists(select * from usser where 
cUserName = @cUserName and cPassword = @cPassword)
begin
select cast(1 as bit)
end
else
begin
select cast(0 as bit)
end

end

GO
