﻿using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.Blazor;
using NuGet.Protocol.Plugins;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Security.Cryptography;
using System;

namespace FrontEnd.Models
{
    public class Cliente
    {
        public int nIdCliente { get; set; }
        public string? cNombre { get; set; }
        public string? cApellido { get; set; }
        public string? cCorreo { get; set; }
        public string? cTelefono { get; set; }
        public DateTime dFechaRegistro { get; set; }
        public string? cDocumento { get; set; }
    }
}