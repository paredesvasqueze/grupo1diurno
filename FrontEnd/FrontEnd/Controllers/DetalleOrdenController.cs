using FrontEnd.Filter;
using FrontEnd.Models;
using FrontEnd.Servicio;
using Microsoft.AspNetCore.Mvc;

namespace FrontEnd.Controllers
{
    [TypeFilter(typeof(TokenAuthorizationFilter))]
    [ApiController]
    [Route("[controller]")]
    public class DetalleOrdenController : Controller
    {
        private readonly DetalleOrdenService _detalleOrdenService;
        private string _token;

        public DetalleOrdenController(DetalleOrdenService detalleOrdenService)
        {
            _detalleOrdenService = detalleOrdenService;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            var detalleOrdenes = await _detalleOrdenService.GetDetalleOrdenesAsync(_token);
            return View(detalleOrdenes);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] DetalleOrden detalleOrden)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _detalleOrdenService.CreateDetalleOrdenAsync(detalleOrden, _token);
                if (result)
                {
                    return Ok();
                }
            }
            return BadRequest();
        }

        [HttpPut]
        public async Task<IActionResult> Update([FromBody] DetalleOrden detalleOrden)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            if (ModelState.IsValid)
            {
                var result = await _detalleOrdenService.UpdateDetalleOrdenAsync(detalleOrden, _token);
                if (result)
                {
                    return Ok();
                }
            }
            return BadRequest();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            _token = HttpContext.Request.Cookies["AuthToken"];
            var result = await _detalleOrdenService.DeleteDetalleOrdenAsync(id, _token);
            if (result)
            {
                return Ok();
            }
            return BadRequest();
        }
    }
}
