using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductoController : ControllerBase
    {
        private readonly ProductoDomain _ProductoDomain;

        public ProductoController(ProductoDomain ProductoDomain)
        {
            _ProductoDomain = ProductoDomain;
        }

        [HttpGet("ObtenerProductoTodos")]
        public IActionResult ObtenerProductoTodos()
        {
            var Productos = _ProductoDomain.ObtenerProductoTodos();
            return Ok(Productos);
        }

        [HttpPost("InsertarProducto")]
        public IActionResult InsertarProducto(Producto oProducto)
        {
            var id = _ProductoDomain.InsertarProducto(oProducto);
            return Ok(id);
        }


        [HttpPut("ActualizarProducto")]
        public IActionResult ActualizarProducto(Producto oProducto)
        {
            var id = _ProductoDomain.ActualizarProducto(oProducto);
            return Ok(id);
        }

        [HttpDelete("EliminarProducto/{nIdProducto}")]
        public IActionResult EliminarProducto(Int32 nIdProducto)
        {
            Producto oProducto = new Producto() { nIdProducto = nIdProducto };
            var id = _ProductoDomain.EliminarProducto(oProducto);
            return Ok(id);
        }
    }
}
