using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.Blazor;
using NuGet.Protocol.Plugins;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Security.Cryptography;
using System;

namespace FrontEnd.Models
{
    public class DetalleOrden
    {
        public int nIdDetalle { get; set; }
        public int nCantidad { get; set; }
        public int nIdOrden { get; set; }
        public int nIdProducto { get; set; }
    }
}
