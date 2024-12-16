using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ConservaController : ControllerBase
    {
        private readonly ConservaDomain _ConservaDomain;

        public ConservaController(ConservaDomain ConservaDomain)
        {
            _ConservaDomain = ConservaDomain;
        }

        [HttpGet("ObtenerConservaTodos")]
        public IActionResult ObtenerConservaTodos()
        {
            var Conservas = _ConservaDomain.ObtenerConservaTodos();
            return Ok(Conservas);
        }

        [HttpPost("InsertarConserva")]
        public IActionResult InsertarConserva(Conserva oConserva)
        {
            var id = _ConservaDomain.InsertarConserva(oConserva);
            return Ok(id);
        }

        [HttpPut("ActualizarConserva")]
        public IActionResult ActualizarConserva(Conserva oConserva)
        {
            var id = _ConservaDomain.ActualizarConserva(oConserva);
            return Ok(id);
        }

        [HttpDelete("EliminarConserva/{nIdConserva}")]
        public IActionResult EliminarConserva(Int32 nIdConserva)
        {
            Conserva oConserva = new Conserva() { nIdConserva = nIdConserva };
            var id = _ConservaDomain.EliminarConserva(oConserva);
            return Ok(id);
        }
    }
}
