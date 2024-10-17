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

        public int ActualizarEmpleado(Empleado oEmpleado)
        {
            try
            {
                return _EmpleadoRepository.ActualizarEmpleado(oEmpleado);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int EliminarEmpleado(Empleado oEmpleado)
        {
            try
            {
                return _EmpleadoRepository.EliminarEmpleado(oEmpleado);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
