using CapaEntidad;
using CapaDatos;

namespace CapaDomain
{
    public class MesaDomain
    {
        private readonly MesaRepository _MesaRepository;

        public MesaDomain(MesaRepository MesaRepository)
        {
           
                _MesaRepository = MesaRepository;     
        }

        public IEnumerable<Mesa> ObtenerMesaTodos()
        {
            try
            {
                return _MesaRepository.ObtenerMesaTodos();
            }
            catch (Exception)
            {

                throw;
            }
           
        }

        public int InsertarMesa(Mesa oMesa)
        {
            try
            {
                return _MesaRepository.InsertarMesa(oMesa);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int ActualizarMesa(Mesa oMesa)
        {
            try
            {
                return _MesaRepository.ActualizarMesa(oMesa);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public int EliminarMesa(Mesa oMesa)
        {
            try
            {
                return _MesaRepository.EliminarMesa(oMesa);
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}
