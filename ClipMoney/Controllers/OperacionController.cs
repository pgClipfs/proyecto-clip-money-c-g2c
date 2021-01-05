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

        // GET: api/Operacion/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Operation
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void Post([FromBody] Operacion operacionMontoId)
        {
            Operacion operacion = new Operacion();
            operacion.Monto = operacionMontoId.Monto;
            operacion.IdCuenta = operacionMontoId.IdCuenta;
            operacion.Depositar();
        }

        // PUT: api/Operation/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/Operation/5
        public void Delete(int id)
        {
        }
    }
}