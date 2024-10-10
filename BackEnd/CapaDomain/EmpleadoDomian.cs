using CapaEntidad;
using CapaDatos;

namespace CapaDomain
{
    public class EmpleadoDomain
    {
        private readonly EmpleadoRepository _EmpleadoRepository;

        public EmpleadoDomain(EmpleadoRepository EmpleadoRepository)
        {
           
                _EmpleadoRepository = EmpleadoRepository;     
        }

        public IEnumerable<Empleado> ObtenerEmpleadoTodos()
        {
            try
            {
                return _EmpleadoRepository.ObtenerEmpleadoTodos();
            }
            catch (Exception)
            {

                throw;
            }
           
        }

        public int InsertarEmpleado(Empleado oEmpleado)
        {
            try
            {
                return _EmpleadoRepository.InsertarEmpleado(oEmpleado);
            }
            catch (Exception)
            {
                throw;
            }
            
        }
    }
}
