using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.Blazor;
using NuGet.Protocol.Plugins;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Security.Cryptography;
using System;

namespace FrontEnd.Models
{
    public class Empleado
    {
        public int nIdEmpleado { get; set; }
        public string? cNombre { get; set; }
        public string? cApellido { get; set; }
        public DateTime dtFechaContratacion { get; set; }
        public int cDocumento { get; set; }
    }
}
