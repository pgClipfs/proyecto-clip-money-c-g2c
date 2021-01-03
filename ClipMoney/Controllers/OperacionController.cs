using ClipMoney.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ClipMoney.Controllers
{
    [Authorize]
    [RoutePrefix("api/operacion")]
    public class OperacionController : ApiController
    {
        // GET: api/Operation
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Operation/5
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public decimal Get(int id)
        {
            GestorCuenta gestorCuenta = new GestorCuenta();
            return gestorCuenta.ConsultarSaldo(id);
        }

        // POST: api/Operation
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Operation/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/Operation/5
        public void Delete(int id)
        {
        }


        // GET: api/Operation/UltimosMovimientos/1
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public List<Operacion> UltimosMovimientos(int id)
        {
            GestorOperaciones gestorOperaciones = new GestorOperaciones();
            return gestorOperaciones.ObtenerUltimosMovimientos(id);
        }
    }
}