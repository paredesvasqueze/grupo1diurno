using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class OrdenController : ControllerBase
    {
        private readonly OrdenDomain _OrdenDomain;

        public OrdenController(OrdenDomain OrdenDomain)
        {
            _OrdenDomain = OrdenDomain;
        }

        [HttpGet("ObtenerOrdenTodos")]
        public IActionResult ObtenerOrdenTodos()
        {
            var Ordens = _OrdenDomain.ObtenerOrdenTodos();
            return Ok(Ordens);
        }

        [HttpPost("InsertarOrden")]
        public IActionResult InsertarOrden(Orden oOrden)
        {
            var id = _OrdenDomain.InsertarOrden(oOrden);
            return Ok(id);
        }

        [HttpPut("ActualizarOrden")]
        public IActionResult ActualizarOrden(Orden oOrden)
        {
            var id = _OrdenDomain.ActualizarOrden(oOrden);
            return Ok(id);
        }

        [HttpDelete("EliminarOrden/{nIdOrden}")]
        public IActionResult EliminarOrden(Int32 nIdOrden)
        {
            Orden oOrden = new Orden() { nIdOrden = nIdOrden };
            var id = _OrdenDomain.EliminarOrden(oOrden);
            return Ok(id);
        }
    }
}
