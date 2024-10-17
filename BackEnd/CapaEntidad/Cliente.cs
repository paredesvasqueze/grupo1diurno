namespace CapaEntidad
{
    public class Cliente
    {
        public int nIdCliente { get; set; }
        public string? cNombre { get; set; }
        public string? cApellido { get; set; }
        public string? cCorreo { get; set; }
        public string? cTelefono { get; set; }
        public DateTime dFechaRegistro { get; set; }
        public string? cDocumento { get; set; }
    }
}