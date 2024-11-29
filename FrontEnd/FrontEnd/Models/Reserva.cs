using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.Blazor;
using NuGet.Protocol.Plugins;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Security.Cryptography;
using System;

namespace FrontEnd.Models
{
    public class Reserva
    {
        public int nIdReserva { get; set; }
        public DateTime dtFechaReserva { get; set; }
        public int nIdCliente { get; set; }
    }
}
