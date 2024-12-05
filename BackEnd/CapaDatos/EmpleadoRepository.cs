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
    public class EmpleadoRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public EmpleadoRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Empleados
        public IEnumerable<Empleado> ObtenerEmpleadoTodos()
        {
            var Empleados = new List<Empleado>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Empleado> lstFound = new List<Empleado>();
                var query = "USP_GET_Empleado_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Empleado>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;              
                
            }
        }

        public int InsertarEmpleado(Empleado oEmpleado)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                
                var query = "USP_Insert_Empleado";
                var param = new DynamicParameters();
                param.Add("@cNombre", oEmpleado.cNombre);
                param.Add("@cApellido", oEmpleado.cApellido);
                param.Add("@dtFechaContratacion", oEmpleado.dtFechaContratacion);
                param.Add("@cDocumento", oEmpleado.cDocumento);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);                
            }
        }

        public int ActualizarEmpleado(Empleado oEmpleado)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Actualizar_Empleado";
                var param = new DynamicParameters();
                param.Add("@nIdEmpleado", oEmpleado.nIdEmpleado);
                param.Add("@cNombre", oEmpleado.cNombre);
                param.Add("@cApellido", oEmpleado.cApellido);
                param.Add("@dtFechaContratacion", oEmpleado.dtFechaContratacion);
                param.Add("@cDocumento", oEmpleado.cDocumento);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
        public int EliminarEmpleado(Empleado oEmpleado)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Eliminar_Empleado";
                var param = new DynamicParameters();
                param.Add("@nIdEmpleado", oEmpleado.cNombre);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
