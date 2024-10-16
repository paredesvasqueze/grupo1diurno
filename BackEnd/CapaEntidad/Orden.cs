namespace CapaEntidad
{
    public class Orden
    {
        public int nIdOrden { get; set; }
        public DateTime dFecha { get; set; }
        public int nIdCliente { get; set; }
        public int nIdEmpleado { get; set; }
        public int nIdMesa { get; set; }
    }
}
