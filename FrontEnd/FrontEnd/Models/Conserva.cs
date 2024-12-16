using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.Blazor;
using NuGet.Protocol.Plugins;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Security.Cryptography;
using System;
using Microsoft.AspNetCore.Http.HttpResults;
using System.Security.Principal;

namespace FrontEnd.Models
{
    public class Conserva
    {
        public int nIdConserva { get; set; }
        public string? cDescripcionConserva { get; set; }
        public DateTime dFechaLote { get; set; }

        public DateTime dFechaCapacidad { get; set; }
        public int nUnidadesProducidas { get; set; }

    }
}
