using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;
using Dapper;

namespace CapaDatos
{
    public class ConservaRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public ConservaRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Conservas
        public IEnumerable<Conserva> ObtenerConservaTodos()
        {
            var Conservas = new List<Conserva>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Conserva> lstFound = new List<Conserva>();
                var query = "USP_GET_Conserva_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Conserva>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;

            }
        }

        public int InsertarConserva(Conserva oConserva)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Insert_Conserva";
                var param = new DynamicParameters();
                param.Add("@cDescripcionConserva", oConserva.cDescripcionConserva);
                param.Add("@dFechaLote", oConserva.dFechaLote);
                param.Add("@dFechaCapacidad", oConserva.dFechaCapacidad);
                param.Add("@nUnidadesProducidas", oConserva.nUnidadesProducidas);

                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }

        public int ActualizarConserva(Conserva oConserva)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Actualizar_Conserva";
                var param = new DynamicParameters();
                param.Add("@nIdConserva", oConserva.nIdConserva);
                param.Add("@cDescripcionConserva", oConserva.cDescripcionConserva);
                param.Add("@dFechaLote", oConserva.dFechaLote);
                param.Add("@dFechaCapacidad", oConserva.dFechaCapacidad);
                param.Add("@nUnidadesProducidas", oConserva.nUnidadesProducidas);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }

        public int EliminarConserva(Conserva oConserva)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Eliminar_Conserva";
                var param = new DynamicParameters();
                param.Add("@IdConserva", oConserva.nIdConserva);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
