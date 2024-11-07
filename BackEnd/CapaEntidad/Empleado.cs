namespace CapaEntidad
{
    public class Empleado
    {
        public int nIdEmpleado { get; set; }
        public string? cNombre { get; set; }
        public string? cApellido { get; set; }
        public DateTime dtFechaContratacion { get; set; }
        public int cDocumento { get; set; }
    }
}