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
    public class ReservaRepository
    {
        private readonly ConexionSingleton _conexionSingleton;
        // Constructor que recibe el singleton de conexión
        public ReservaRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }
        // Método para obtener una lista de Reservas
        public IEnumerable<Reserva> ObtenerReservaTodos()
        {
            var Reservas = new List<Reserva>();
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Reserva> lstFound = new List<Reserva>();
                var query = "USP_GET_Reserva_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Reserva>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;

            }
        }
        public int InsertarReserva(Reserva oReserva)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Insert_Reserva";
                var param = new DynamicParameters();
                param.Add("@dtFechaReserva", oReserva.dtFechaReserva);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
        public int ActualizarReserva(Reserva oReserva)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                var query = "USP_Insert_Reserva";
                var param = new DynamicParameters();
                param.Add("@nIdReserva", oReserva.nIdReserva);
                param.Add("@dtFechaReserva", oReserva.dtFechaReserva);
                param.Add("@nIdCliente", oReserva.nIdCliente);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
        public int EliminarReserva(Reserva oReserva)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                var query = "USP_Insert_Reserva";
                var param = new DynamicParameters();
                param.Add("@nIdReserva", oReserva.nIdReserva);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
    }
}