CREATE PROCEDURE USP_Insert_Cliente
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
