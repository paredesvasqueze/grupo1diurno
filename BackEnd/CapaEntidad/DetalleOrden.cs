namespace CapaEntidad
{
    public class DetalleOrden
    {
        public int nIdDetalleOrden { get; set; }
        public string? nCantidad { get; set; }
        public int nIdOrden { get; set; }
        public int nIdProducto { get; set; }
    }
}