namespace FrontEnd.Servicio
{
    public class Paciente
    {
        public int nId { get; set; }                       // Identificador único del paciente
        public string? cNombre { get; set; }              // Nombre del paciente
        public string? cApellido { get; set; }            // Apellido del paciente
        public string? cDireccion { get; set; }           // Dirección del paciente
        public string? cTelefono { get; set; }            // Teléfono del paciente
        public bool bEsActivo { get; set; }               // Estado activo/inactivo
        public DateTime dFechaNacimiento { get; set; }    // Fecha de nacimiento del paciente
        public DateTime dFechaRegistro { get; set; }      // Fecha de registro del paciente
    }
}
