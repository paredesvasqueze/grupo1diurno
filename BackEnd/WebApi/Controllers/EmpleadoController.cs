using Microsoft.AspNetCore.Mvc;
using CapaDomain;
using CapaEntidad;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EmpleadoController : ControllerBase
    {
        private readonly EmpleadoDomain _EmpleadoDomain;

        public EmpleadoController(EmpleadoDomain EmpleadoDomain)
        {
            _EmpleadoDomain = EmpleadoDomain;
        }

        [HttpGet("ObtenerEmpleadoTodos")]
        public IActionResult ObtenerEmpleadoTodos()
        {
            var Empleados = _EmpleadoDomain.ObtenerEmpleadoTodos();
            return Ok(Empleados);
        }

        [HttpPost("InsertarEmpleado")]
        public IActionResult InsertarEmpleado(Empleado oEmpleado)
        {
            var id = _EmpleadoDomain.InsertarEmpleado(oEmpleado);
            return Ok(id);
        }


        [HttpPut("ActualizarEmpleado")]
        public IActionResult ActualizarEmpleado(Empleado oEmpleado)
        {
            var id = _EmpleadoDomain.ActualizarEmpleado(oEmpleado);
            return Ok(id);
        }

        [HttpDelete("EliminarEmpleado/{nIdEmpleado}")]
        public IActionResult EliminarEmpleado(Int32 nIdEmpleado)
        {
            Empleado oEmpleado = new Empleado() { nIdEmpleado = nIdEmpleado };
            var id = _EmpleadoDomain.EliminarEmpleado(oEmpleado);
            return Ok(id);
        }
    }
}
