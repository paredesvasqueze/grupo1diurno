using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.Blazor;
using NuGet.Protocol.Plugins;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Security.Cryptography;
using System;

namespace FrontEnd.Models
{
    public class Orden
    {
        public int nIdOrden { get; set; }
        public DateTime dFecha { get; set; }
        public int nIdCliente { get; set; }
        public int nIdEmpleado { get; set; }
        public int nIdMesa { get; set; }
    }
}
