CREATE PROCEDURE USP_Eliminar_Cliente
    @IdCliente INT
AS
BEGIN
    DELETE FROM Cliente
    WHERE nIdCliente = @IdCliente;
END;
