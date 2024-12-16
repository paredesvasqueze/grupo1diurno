using CapaEntidad;
using CapaDatos;

namespace CapaDomain
{
    public class ConservaDomain
    {
        private readonly ConservaRepository _ConservaRepository;

        public ConservaDomain(ConservaRepository ConservaRepository)
        {

            _ConservaRepository = ConservaRepository;
        }

        public IEnumerable<Conserva> ObtenerConservaTodos()
        {
            try
            {
                return _ConservaRepository.ObtenerConservaTodos();
            }
            catch (Exception)
            {

                throw;
            }

        }

        public int InsertarConserva(Conserva oConserva)
        {
            try
            {
                return _ConservaRepository.InsertarConserva(oConserva);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int ActualizarConserva(Conserva oConserva)
        {
            try
            {
                return _ConservaRepository.ActualizarConserva(oConserva);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public int EliminarConserva(Conserva oConserva)
        {
            try
            {
                return _ConservaRepository.EliminarConserva(oConserva);
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}

