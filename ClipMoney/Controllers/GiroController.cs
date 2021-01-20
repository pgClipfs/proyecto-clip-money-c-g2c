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
    [RoutePrefix("api/giro")]
    public class GiroController : ApiController
    {
        // GET: api/Giro
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Giro/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Giro
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Giro/1
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public string Put([FromBody] Operacion operacion)
        {
            GestorOperaciones gestorOperaciones = new GestorOperaciones();
            return gestorOperaciones.RealizarGiroAlDescubierto(operacion.Monto, operacion.IdCuenta);
        }

        // DELETE: api/Giro/5
        public void Delete(int id)
        {
        }
    }
}
