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
    public class MesaRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public MesaRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Mesas
        public IEnumerable<Mesa> ObtenerMesaTodos()
        {
            var Mesas = new List<Mesa>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Mesa> lstFound = new List<Mesa>();
                var query = "USP_GET_Mesa_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Mesa>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;              
                
            }
        }

        public int InsertarMesa(Mesa oMesa)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                
                var query = "USP_Insert_Mesa";
                var param = new DynamicParameters();
                param.Add("@nNroMesa", oMesa.nNroMesa);
                param.Add("@cCapacidad", oMesa.cCapacidad);               
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);                
            }
        }

        public int ActualizarMesa(Mesa oMesa)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Actualizar_Mesa";
                var param = new DynamicParameters();
                param.Add("@nIdMesa", oMesa.nIdMesa);
                param.Add("@nNroMesa", oMesa.nNroMesa);
                param.Add("@cCapacidad", oMesa.cCapacidad);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }

        public int EliminarMesa(Mesa oMesa)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Eliminar_Mesa";
                var param = new DynamicParameters();
                param.Add("@nIdMesa", oMesa.nIdMesa);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
