CREATE PROCEDURE USP_Actualizar_Cliente
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
