using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MesaController : ControllerBase
    {
        private readonly MesaDomain _MesaDomain;

        public MesaController(MesaDomain MesaDomain)
        {
            _MesaDomain = MesaDomain;
        }

        [HttpGet("ObtenerMesaTodos")]
        public IActionResult ObtenerMesaTodos()
        {
            var Mesas = _MesaDomain.ObtenerMesaTodos();
            return Ok(Mesas);
        }

        [HttpPost("InsertarMesa")]
        public IActionResult InsertarMesa(Mesa oMesa)
        {
            var id = _MesaDomain.InsertarMesa(oMesa);
            return Ok(id);
        }

        [HttpPut("ActualizarMesa")]
        public IActionResult ActualizarMesa(Mesa oMesa)
        {
            var id = _MesaDomain.ActualizarMesa(oMesa);
            return Ok(id);
        }

        [HttpDelete("EliminarMesa")]
        public IActionResult EliminarMesa(Mesa oMesa)
        {
            var id = _MesaDomain.EliminarMesa(oMesa);
            return Ok(id);
        }
    }
}
