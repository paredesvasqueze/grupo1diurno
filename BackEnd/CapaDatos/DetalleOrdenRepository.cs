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
    public class DetalleOrdenRepository
    {
        private readonly ConexionSingleton _conexionSingleton;
        // Constructor que recibe el singleton de conexión
        public DetalleOrdenRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }
        // Método para obtener una lista de DetalleOrdens
        public IEnumerable<DetalleOrden> ObtenerDetalleOrdenTodos()
        {
            var DetalleOrdens = new List<DetalleOrden>();
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<DetalleOrden> lstFound = new List<DetalleOrden>();
                var query = "USP_GET_DetalleOrden_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<DetalleOrden>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;

            }
        }
        public int InsertarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Insert_DetalleOrden";
                var param = new DynamicParameters();
                param.Add("@nCantidad", oDetalleOrden.nCantidad);
                param.Add("@nIdOrden", oDetalleOrden.nIdOrden);
                param.Add("@nIdProducto", oDetalleOrden.nIdProducto);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
        public int ActualizarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                var query = "USP_Actualizar_DetalleOrden";
                var param = new DynamicParameters();
                param.Add("@nIdDetalle", oDetalleOrden.nIdDetalle);
                param.Add("@nCantidad", oDetalleOrden.nCantidad);
                param.Add("@nIdOrden", oDetalleOrden.nIdOrden);
                param.Add("@nIdProducto", oDetalleOrden.nIdProducto);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
        public int EliminarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                var query = "USP_Eliminar_DetalleOrden";
                var param = new DynamicParameters();
                param.Add("@nIdDetalle", oDetalleOrden.nIdDetalle);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
    }
}