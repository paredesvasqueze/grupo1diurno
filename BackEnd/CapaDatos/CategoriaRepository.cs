﻿using System;
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
    public class CategoriaRepository
    {
        private readonly ConexionSingleton _conexionSingleton;

        // Constructor que recibe el singleton de conexión
        public CategoriaRepository(ConexionSingleton conexionSingleton)
        {
            _conexionSingleton = conexionSingleton;
        }

        // Método para obtener una lista de Categorias
        public IEnumerable<Categoria> ObtenerCategoriaTodos()
        {
            var Categorias = new List<Categoria>();

            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                IEnumerable<Categoria> lstFound = new List<Categoria>();
                var query = "USP_GET_Categoria_Todos";
                var param = new DynamicParameters();
                //param.Add("@nConstGrupo", nConstGrupo, dbType: DbType.Int32);
                lstFound = SqlMapper.Query<Categoria>(connection, query, param, commandType: CommandType.StoredProcedure);
                return lstFound;              
                
            }
        }

        public int InsertarCategoria(Categoria oCategoria)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();
                
                var query = "USP_Insert_Categoria";
                var param = new DynamicParameters();
                param.Add("@cCategoria", oCategoria.cCategoria);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);                
            }
        }

        public int ActualizarCategoria(Categoria oCategoria)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Actualizar_Categoria";
                var param = new DynamicParameters();
                param.Add("@nIdCategoria", oCategoria.nIdCategoria);
                param.Add("@cCategoria", oCategoria.cCategoria);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }

        public int EliminarCategoria(Categoria oCategoria)
        {
            using (var connection = _conexionSingleton.GetConnection())
            {
                connection.Open();

                var query = "USP_Eliminar_Categoria";
                var param = new DynamicParameters();
                param.Add("@nIdCategoria", oCategoria.nIdCategoria);
                return (int)SqlMapper.ExecuteScalar(connection, query, param, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
