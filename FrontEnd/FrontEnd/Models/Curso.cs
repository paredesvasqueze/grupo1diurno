using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.Blazor;
using NuGet.Protocol.Plugins;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Security.Cryptography;
using System;

namespace FrontEnd.Models
{
    public class Curso
    {
        public int nId { get; set; }
        public string? cNombre { get; set; }
        public string? cDescripcion { get; set; }
        public int nDuracion { get; set; }
        public bool bEsActivo { get; set; }
        public DateTime dFechaInicio { get; set; }
        public DateTime dFechaCreacion { get; set; }                                 

    }
}
