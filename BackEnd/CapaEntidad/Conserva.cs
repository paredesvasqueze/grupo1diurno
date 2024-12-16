namespace CapaEntidad
{
    public class Conserva
    {
        public int nIdConserva { get; set; }
        public string? cDescripcionConserva { get; set; }
        public DateTime dFechaLote { get; set; }

        public DateTime dFechaCapacidad { get; set; }
        public int nUnidadesProducidas { get; set; }

    }
}