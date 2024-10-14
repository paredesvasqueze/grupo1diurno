using System;
using System.Collections.Generic;
using System.Data;
using Dapper;
using CapaEntidad;

namespace CapaDatos
{
    public class EmpleadoData
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public EmpleadoData(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Empleados
        public IEnumerable<Empleado> ObtenerEmpleadoTodos()
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                var query = "USP_GET_Empleado_Todos";
                var param = new DynamicParameters();
                return SqlMapper.Query<Empleado>(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }

        public int InsertarEmpleado(Empleado oEmpleado)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Insert_Empleado";
                var param = new DynamicParameters();
                param.Add("@nIdEmpleado", oEmpleado.nIdEmpleado);
                param.Add("@cNombre", oEmpleado.cNombre);
                param.Add("@cApellido", oEmpleado.cApellido);
                param.Add("@dtFechaContratacion", oEmpleado.dtFechaContratacion); // Corregido aquí
                return SqlMapper.Execute(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }

        public int ActualizarEmpleado(Empleado oEmpleado)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Update_Empleado";
                var param = new DynamicParameters();
                param.Add("@nIdEmpleado", oEmpleado.nIdEmpleado);
                param.Add("@cNombre", oEmpleado.cNombre);
                param.Add("@cApellido", oEmpleado.cApellido);
                param.Add("@dtFechaContratacion", oEmpleado.dtFechaContratacion); 
                return SqlMapper.Execute(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }

        public int EliminarEmpleado(Empleado oEmpleado)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Delete_Empleado";
                var param = new DynamicParameters();
                param.Add("@nIdEmpleado", oEmpleado.nIdEmpleado);
                return SqlMapper.Execute(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
