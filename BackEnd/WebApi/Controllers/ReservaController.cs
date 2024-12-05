using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;
namespace WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ReservaController : ControllerBase
    {
        private readonly ReservaDomain _ReservaDomain;
        public ReservaController(ReservaDomain ReservaDomain)
        {
            _ReservaDomain = ReservaDomain;
        }
        [HttpGet("ObtenerReservaTodos")]
        public IActionResult ObtenerReservaTodos()
        {
            var Reservas = _ReservaDomain.ObtenerReservaTodos();
            return Ok(Reservas);
        }
        [HttpPost("InsertarReserva")]
        public IActionResult InsertarReserva(Reserva oReserva)
        {
            var id = _ReservaDomain.InsertarReserva(oReserva);
            return Ok(id);
        }
        [HttpPut("ActualizarReserva")]
        public IActionResult ActualizarReserva(Reserva oReserva)
        {
            var id = _ReservaDomain.ActualizarReserva(oReserva);
            return Ok(id);
        }
        [HttpDelete("EliminarReserva/{nIdReserva}")]
        public IActionResult EliminarReserva(Int32 nIdReserva)
        {
            Reserva oReserva = new Reserva() { nIdReserva = nIdReserva };
            var id = _ReservaDomain.EliminarReserva(oReserva);
            return Ok(id);
        }
    }
}