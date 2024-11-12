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
    public class ProductoRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public ProductoRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Productos
        public IEnumerable<Producto> ObtenerProductoTodos()
        {
            var Productos = new List<Producto>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Producto> lstFound = new List<Producto>();
                var query = "USP_GET_Producto_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Producto>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;              
                
            }
        }

        public int InsertarProducto(Producto oProducto)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                
                var query = "USP_Insert_Producto";
                var param = new DynamicParameters();
                param.Add("@cNombre", oProducto.cNombre);
                param.Add("@cDescripcion", oProducto.cDescripcion);
                param.Add("@nIdCategoria", oProducto.nIdCategoria);
                param.Add("@nPrecio", oProducto.nPrecio);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);                
            }
        }
        public int ActualizarProducto(Producto oProducto)
            {
                using (var connection = _conexionSingleton.GetConnection())
                {
                    connection.Open();

                    var query = "USP_Actualizar_Producto";
                    var param = new DynamicParameters();
                    param.Add("@nIdProducto", oProducto.nIdProducto);
                    param.Add("@cNombre", oProducto.cNombre);
                    param.Add("@cDescripcion", oProducto.cDescripcion);
                    param.Add("@nIdCategoria", oProducto.nIdCategoria); 
                    return SqlMapper.Execute(connection, query, param, commandType: CommandType.StoredProcedure);
                }
            }

            public int EliminarProducto(Producto oProducto)
            {
                using (var connection = _conexionSingleton.GetConnection())
                {
                    connection.Open();

                    var query = "USP_Eliminar_Producto";
                    var param = new DynamicParameters();
                    param.Add("@nIdProducto", oProducto.nIdProducto);
                    return SqlMapper.Execute(connection, query, param, commandType: CommandType.StoredProcedure);
                }
            }
    }
}
