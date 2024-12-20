using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DetalleOrdenController : ControllerBase
    {
        private readonly DetalleOrdenDomain _DetalleOrdenDomain;

        public DetalleOrdenController(DetalleOrdenDomain DetalleOrdenDomain)
        {
            _DetalleOrdenDomain = DetalleOrdenDomain;
        }

        [HttpGet("ObtenerDetalleOrdenTodos")]
        public IActionResult ObtenerDetalleOrdenTodos()
        {
            var DetalleOrdens = _DetalleOrdenDomain.ObtenerDetalleOrdenTodos();
            return Ok(DetalleOrdens);
        }

        [HttpPost("InsertarDetalleOrden")]
        public IActionResult InsertarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            var id = _DetalleOrdenDomain.InsertarDetalleOrden(oDetalleOrden);
            return Ok(id);
        }

        [HttpPut("ActualizarDetalleOrden")]
        public IActionResult ActualizarDetalleOrden(DetalleOrden oDetalleOrden)
        {
            var id = _DetalleOrdenDomain.ActualizarDetalleOrden(oDetalleOrden);
            return Ok(id);
        }

        [HttpDelete("EliminarDetalleOrden/{nIdDetalleOrden}")]
        public IActionResult EliminarDetalleOrden(Int32 nIdDetalleOrden)
        {
            DetalleOrden oDetalleOrden = new DetalleOrden() { nIdDetalleOrden = nIdDetalleOrden };
            var id = _DetalleOrdenDomain.EliminarDetalleOrden(oDetalleOrden);
            return Ok(id);
        }
    }
}
